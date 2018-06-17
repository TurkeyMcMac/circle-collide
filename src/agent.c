#include "agent.h"
#include "container-of.h"
#include "intersector.h"
#include "js-routines.h"
#include "math.h"
#include "random.h"
#include "vec2d.h"
#include "world.h"

static struct vec2d sensor_protos[AGENT_N_SENSORS];

void agent_draw(const struct circle *circ)
{
	const struct agent *self = container_of(circ, struct agent, c);
	struct vec2d face = {circ->info->radius, 0};
	vec2d_rotation_t rot;
	vec2d_rotation_get(&rot, self->direction);
	vec2d_apply_rotation(&face, &rot);
	face.x += circ->position.x;
	face.y += circ->position.y;
	jsDrawLine(circ->position.x, circ->position.y, face.x, face.y);
	for (unsigned i = 0; i < AGENT_N_SENSORS; ++i) {
		struct vec2d sensor;
		if ((self->senses & (1 << i)) == 0)
			continue;
		sensor = sensor_protos[i];
		vec2d_apply_rotation(&sensor, &rot);
		sensor.x += self->c.position.x;
		sensor.y += self->c.position.y;
		jsDrawLine(
			self->c.position.x, self->c.position.y,
			sensor.x, sensor.y
		);
	}
	jsDrawCircle(circ->position.x, circ->position.y, circ->info->radius);
}

struct neural_net mind_proto;

void agent_init_sensor_protos(float range)
{
	unsigned i = AGENT_N_SENSORS - 1;
	static vec2d_rotation_t rot;
	sensor_protos[i].x = 0;
	sensor_protos[i].y = range;
	vec2d_rotation_get(&rot, -PI / (float)AGENT_N_SENSORS);
	while (i--) {
		sensor_protos[i] = sensor_protos[i + 1];
		vec2d_apply_rotation(sensor_protos + i, &rot);
	}
}

static void move_agent(struct agent *a, nn_bitset orders)
{
	if (orders & AGENT_OUT_LEFT)
		a->direction += 0.04;
	if (orders & AGENT_OUT_RIGHT)
		a->direction -= 0.04;
	if (orders & AGENT_OUT_THRUST) {
		vec2d_rotation_t rotation;
		struct vec2d thrust = { 0.05, 0};
		vec2d_rotation_get(&rotation, a->direction);
		vec2d_apply_rotation(&thrust, &rotation);
		a->c.speed.x += thrust.x;
		a->c.speed.y += thrust.y;
	}
}

static void find_sensor_sectors_positive(pos, len,
	tilesize, n_tiles,
	start, midlen, wraplen)
float pos, len, tilesize;
unsigned n_tiles, *start, *midlen, *wraplen;
{
	unsigned n_sectors = len / tilesize;
	n_sectors += 2;
	unsigned maximum = *start + n_sectors;
	if (maximum <= n_tiles) {
		*midlen = n_sectors;
		*wraplen = 0;
	} else {
		*midlen = n_tiles - *start;
		*wraplen = maximum - n_tiles;
	}
}

static void find_sensor_sectors_negative(pos, len,
	tilesize, n_tiles,
	start, midlen, wraplen)
float pos, len, tilesize;
unsigned n_tiles, *start, *midlen, *wraplen;
{
	unsigned n_sectors = -len / tilesize;
	++n_sectors;
	*start -= n_sectors;
	if (*start > n_tiles) {
		// Wrapped around
		*start += n_tiles;
		*midlen = n_tiles - *start;
		*wraplen = n_sectors - *midlen;
	} else {
		*midlen = n_sectors;
		*wraplen = 0;
	}
}

static void find_sensor_sectors(pos, shape, w, x, y, mw, mh, ww, wh)
const struct vec2d *pos, *shape;
const struct world *w;
unsigned *x, *y, *mw, *mh, *ww, *wh;
{
	(shape->x > 0.0
		? find_sensor_sectors_positive
		: find_sensor_sectors_negative
	)(pos->x, shape->x, w->tile_size, w->width, x, mw, ww);
	(shape->y > 0.0
		? find_sensor_sectors_positive
		: find_sensor_sectors_negative
	)(pos->y, shape->y, w->tile_size, w->height, y, mh, wh);
}

static bool test_sensor_area(self, sensor, w, x, y, width, height)
const struct agent *self;
const intersector_t *sensor;
struct world *w;
unsigned x, y, width, height;
{
	unsigned endx = x + width;
	unsigned endy = y + height;
	for(unsigned iy = y; iy < endy; ++iy) {
		for (unsigned ix = x; ix < endx; ++ix) {
			struct circle *c, **tile = world_get(w, ix, iy);
			LIST_FOR_EACH(tile, c) {
				/* TODO: This exclusion of self is an
				 * unnecessary check most of the time. */
				if (c != &self->c
				 && intersects(sensor, &self->c.position, c))
					return true;
			}
		}
	}
	return false;
}

static nn_bitset test_sensor(struct agent *self,
	const struct vec2d *shape,
	struct world *w,
	unsigned x, unsigned y)
{
	// Middle width, middle height, wrapped with, wrapped height
	unsigned mw, mh, ww, wh;
	intersector_t sensor;
	nn_bitset ret = 0;
	find_sensor_sectors(&self->c.position, shape, w,
		&x, &y, &mw, &mh, &ww, &wh);
	intersector_init(&sensor, shape);
#	define TEST_SENSOR_AREA(x, y, width, height, cleanup) do {	\
		bool sensor_touched_ = test_sensor_area(self,		\
			&sensor, 					\
			w,						\
			(x), (y), (width), (height));			\
		if (sensor_touched_) {					\
			cleanup						\
		}							\
	} while (0)
	TEST_SENSOR_AREA(x, y, mw, mh, goto done; );
	self->c.position.x -= (float)w->width * w->tile_size;
	TEST_SENSOR_AREA(0, y, ww, mh, goto clean_wrap_x; );
	self->c.position.y -= (float)w->height * w->tile_size;
	TEST_SENSOR_AREA(0, 0, ww, wh, goto clean_wrap_xy; );
	self->c.position.x += (float)w->width * w->tile_size;
	TEST_SENSOR_AREA(x, 0, mw, wh, ret = 1; );
	self->c.position.y += (float)w->height * w->tile_size;
	return ret;

clean_wrap_xy:
	self->c.position.y += (float)w->height * w->tile_size;
clean_wrap_x:
	self->c.position.x += (float)w->width * w->tile_size;
done:
	return 1;
}

static nn_bitset test_sensors(struct agent *self,
	struct world *w,
	unsigned x, unsigned y)
{
	nn_bitset senses = 0;
	vec2d_rotation_t rot;
	vec2d_rotation_get(&rot, self->direction);
	for (unsigned i = 0; i < AGENT_N_SENSORS; ++i) {
		struct vec2d shape = sensor_protos[i];
		vec2d_apply_rotation(&shape, &rot);
		senses |= test_sensor(self, &shape, w, x, y) << i;
	}
	return senses;
}

bool agent_update(struct circle *circ,
	struct world *w,
	unsigned x, unsigned y)
{
	struct agent *self = container_of(circ, struct agent, c);
	nn_bitset in = test_sensors(self, w, x, y);
	self->senses = in;
	in <<= AGENT_N_MEM_BITS;
	in |= self->mem;
	nn_bitset out = neural_net_compute(&mind_proto, self->mind, in);
	move_agent(self, out);
	self->mem = out & AGENT_MEM_MASK;
	circ->speed.x *= 0.995;
	circ->speed.y *= 0.995;
	return false;
}
