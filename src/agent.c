#include "agent.h"
#include "container-of.h"
#include "ealloc.h"
#include "intersector.h"
#include "js-routines.h"
#include "math.h"
#include "random.h"
#include "vec2d.h"
#include "world.h"

static struct circle_info agent_info;
static struct circle_info bullet_info;

static struct neural_net mind_proto;
static struct vec2d sensor_protos[AGENT_N_SENSORS];

static void init_sensor_protos(float range)
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

void bullet_draw(const struct circle *self)
{
	jsDrawCircle(self->position.x, self->position.y, self->info->radius);
}

bool bullet_update(struct circle *circ, struct world *w, unsigned x, unsigned y)
{
	return container_of(circ, struct bullet, c)->time-- <= 0;
}

bool bullet_collide(struct circle *circ, struct circle *other)
{
	struct bullet *self = container_of(circ, struct bullet, c);
	if (other == &self->owner->c) {
		// Prevent friendly fire most of the time
		++self->owner->health;
		return true;
	} else if (other->info != &bullet_info) {
		self->time = 0;
		++self->owner->score;
		return false;
	} else
		return true;
}

struct circle *next_free_bullet = NULL;

void bullet_delete(struct circle *self)
{
	self->next = next_free_bullet;
	next_free_bullet = self;
}

struct bullet *new_bullet(void)
{
	struct bullet *b;
	if (next_free_bullet) {
		b = container_of(next_free_bullet, struct bullet, c);
		next_free_bullet = next_free_bullet->next;
	} else
		b = ealloc(sizeof(*b));
	return b;
}

static void fire_bullet(struct agent *owner,
	struct world *w,
	const vec2d_rotation_t *rot)
{
	struct bullet *b = new_bullet();
	if (b == NULL) {
		return;
	}
	b->c.info = &bullet_info;
	b->c.speed.x = 5.0;
	b->c.speed.y = 0.0;
	vec2d_apply_rotation(&b->c.speed, rot);
	b->c.speed.x += owner->c.speed.x;
	b->c.speed.y += owner->c.speed.y;
	struct vec2d offset = {owner->c.info->radius + bullet_info.radius, 0.0};
	vec2d_apply_rotation(&offset, rot);
	b->c.position = owner->c.position;
	b->c.position.x += offset.x + owner->c.speed.x;
	b->c.position.y += offset.y + owner->c.speed.y;
	b->owner = owner;
	b->time = 30;
	world_put(w, &b->c);
}

static void move_agent(struct agent *a, struct world *w, nn_bitset_t orders)
{
	vec2d_rotation_t rot;
	if (orders & AGENT_OUT_LEFT)
		a->direction += 0.06;
	if (orders & AGENT_OUT_RIGHT)
		a->direction -= 0.06;
	if (orders & (AGENT_OUT_THRUST | AGENT_OUT_SHOOT))
		vec2d_rotation_get(&rot, a->direction);
	if (orders & AGENT_OUT_THRUST) {
		struct vec2d thrust = { 0.07, 0};
		vec2d_apply_rotation(&thrust, &rot);
		a->c.speed.x += thrust.x;
		a->c.speed.y += thrust.y;
	}
	if (orders & AGENT_OUT_SHOOT && a->cooldown-- <= 0) {
		a->cooldown = 50;
		fire_bullet(a, w, &rot);
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

static nn_bitset_t test_sensor(struct agent *self,
	const struct vec2d *shape,
	struct world *w,
	unsigned x, unsigned y)
{
	// Middle width, middle height, wrapped with, wrapped height
	unsigned mw, mh, ww, wh;
	intersector_t sensor;
	nn_bitset_t ret = 0;
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

static nn_bitset_t test_sensors(struct agent *self,
	struct world *w,
	unsigned x, unsigned y)
{
	nn_bitset_t senses = 0;
	vec2d_rotation_t rot;
	vec2d_rotation_get(&rot, self->direction);
	for (unsigned i = 0; i < AGENT_N_SENSORS; ++i) {
		struct vec2d shape; 
		shape.x = sensor_protos[i].x;
		shape.y = sensor_protos[i].y;
		vec2d_apply_rotation(&shape, &rot);
		senses |= test_sensor(self, &shape, w, x, y) << i;
	}
	return senses;
}

static bool update_agent(struct circle *circ,
	struct world *w,
	unsigned x, unsigned y)
{
	struct agent *self = container_of(circ, struct agent, c);
	if (self->health <= 0)
		return true;
	nn_bitset_t in = test_sensors(self, w, x, y);
	self->senses = in;
	in <<= AGENT_N_MEM_BITS;
	in |= self->mem;
	nn_bitset_t out = neural_net_compute(&mind_proto, self->mind, in);
	move_agent(self, w, out);
	self->mem = out & AGENT_MEM_MASK;
	circ->speed.x *= 0.995;
	circ->speed.y *= 0.995;
	return false;
}

static void draw_agent(const struct circle *circ)
{
	const struct agent *self = container_of(circ, struct agent, c);
	vec2d_rotation_t rot;
	vec2d_rotation_get(&rot, self->direction);
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
#	define DIRECTION_CIRCLE_RADIUS 3.0
	struct vec2d face = {circ->info->radius - DIRECTION_CIRCLE_RADIUS, 0};
	vec2d_apply_rotation(&face, &rot);
	face.x += circ->position.x;
	face.y += circ->position.y;
	jsDrawCircle(face.x, face.y, DIRECTION_CIRCLE_RADIUS);
	jsDrawCircle(circ->position.x, circ->position.y, circ->info->radius);
}

void agent_delete(struct circle *self)
{}

bool agent_collide(struct circle *circ, struct circle *other)
{
	return --container_of(circ, struct agent, c)->health > 0;
}

void initialize_module_agent(void)
{
	agent_info.draw = draw_agent;
	agent_info.on_update = update_agent;
	agent_info.on_collide = agent_collide;
	agent_info.radius = 6.24;
	agent_info.mass = agent_info.radius * agent_info.radius;
	agent_info.delete = agent_delete;

	bullet_info.draw = bullet_draw;
	bullet_info.on_update = bullet_update;
	bullet_info.on_collide = bullet_collide;
	bullet_info.radius = 4.0;
	bullet_info.mass = 16.0;
	bullet_info.delete = bullet_delete;
	next_free_bullet = NULL;

	mind_proto.input = AGENT_N_INPUTS;
	mind_proto.hidden = AGENT_N_HIDDEN;
	mind_proto.output = AGENT_N_OUTPUTS;

	init_sensor_protos(120.0);
}

struct agent_manager *agent_manager_new(unsigned n_agents)
{
	struct agent_manager *am =
		ealloc(sizeof(*am) + n_agents * sizeof(*am->agents));
	am->n_agents = n_agents;
	while (n_agents--) {
		struct agent *a = &am->agents[n_agents];
		a->c.info = &agent_info;
		a->mind = ealloc(AGENT_MIND_SIZE);
		neural_net_random(&mind_proto, a->mind);
	}
	return am;
}

void agent_manager_spread(struct agent_manager *self, struct world *w)
{
	for (unsigned i = 0; i < self->n_agents; ++i) {
		struct agent *a = &self->agents[i];
		struct circle *c = &a->c;
		a->cooldown = 50;
		a->health = 10;
		a->score = 0;
		self->agents[i].direction = frandom() * 2 * PI;
		c->position.x = (float)(random() / 10) * frandom();
		c->position.y = (float)(random() / 10) * frandom();
		c->speed.x = frandom() * 2.0 - 1.0;
		c->speed.y = frandom() * 2.0 - 1.0;
		world_put(w, c);
	}
}

static void mutate_mind(signed char *mind, unsigned size, unsigned n_mut)
{
	unsigned n_inc, n_dec, i;
	n_inc = random() % n_mut;
	n_dec = n_mut - n_inc;
	for (i = 0; n_inc-- > 0; i = (i + random()) % size) {
		++mind[i];
	}
	for (i = 0; n_dec-- > 0; i = (i + random()) % size) {
		--mind[i];
	}
}

static void *memcpy(void *restrict into, const void *restrict from, unsigned n)
{
	char *restrict to = into;
	const char *restrict fr = from;
	while (n--)
		to[n] = fr[n];
	return into;
}

static void sort_agents(struct agent list[], unsigned length)
{
	if (length < 2)
		return;
	struct agent at_pivot = list[0];
	unsigned before = 0;
	for (unsigned i = 0; i < length; ++i) {
		if (agent_fitness(list + i) > agent_fitness(&at_pivot)) {
			list[before] = list[i];
			list[i] = list[++before];
		}
	}
	list[before] = at_pivot;
	sort_agents(list, before);
	++before;
	sort_agents(list + before, length - before);
}

void agent_manager_winnow(struct agent_manager *self)
{
	sort_agents(self->agents, self->n_agents);
	for (unsigned i = 0; i < self->n_agents / 2; ++i) {
		struct agent *a = &self->agents[i + self->n_agents / 2];
		memcpy(a->mind, self->agents[i].mind, AGENT_MIND_SIZE);
		mutate_mind(a->mind, AGENT_MIND_SIZE, 5000);
	}
	if (self->n_agents & 1) {
		memcpy(self->agents[self->n_agents - 1].mind,
			self->agents[0].mind,
			AGENT_MIND_SIZE);
	}
}
