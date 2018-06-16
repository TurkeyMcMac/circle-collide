#include "agent.h"
#include "container-of.h"
#include "intersector.h"
#include "js-routines.h"
#include "math.h"
#include "random.h"
#include "vec2d.h"
#include "world.h"

static struct vec2d sensor_protos[AGENT_N_INPUTS];

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
	for (unsigned i = 0; i < AGENT_N_INPUTS; ++i) {
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
	unsigned i = AGENT_N_INPUTS - 1;
	static vec2d_rotation_t rot;
	sensor_protos[i].x = 0;
	sensor_protos[i].y = range;
	vec2d_rotation_get(&rot, -PI / (float)AGENT_N_INPUTS);
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

static nn_bitset test_sensor(const intersector_t *s,
	const struct circle *circ,
	struct world *w,
	unsigned x, unsigned y)
{
	/*TODO:
	 * Very inefficient (checks every tile every time).
	 * Doesn't handle wrapping around the torus.
	 * */
	for (y = 0; y < w->height; ++y) {
		for (x = 0; x < w->width; ++x) {
			struct circle **tile = world_get(w, x, y);
			const struct circle *c;
			LIST_FOR_EACH(tile, c) {
				if (c == circ)
					continue;
				if (intersects(s, &circ->position, c))
					return 1;
			}
		}
	}
	return 0;
}

static nn_bitset get_sensors(const struct agent *self,
	struct world *w,
	unsigned x, unsigned y)
{
	nn_bitset senses = 0;
	vec2d_rotation_t rot;
	vec2d_rotation_get(&rot, self->direction);
	for (unsigned i = 0; i < AGENT_N_INPUTS; ++i) {
		struct vec2d shape = sensor_protos[i];
		intersector_t s;
		vec2d_apply_rotation(&shape, &rot);
		intersector_init(&s, &shape);
		senses |= test_sensor(&s, &self->c, w, x, y) << i;
	}
	return senses;
}

bool agent_update(struct circle *circ,
	struct world *w,
	unsigned x, unsigned y)
{
	struct agent *self = container_of(circ, struct agent, c);
	nn_bitset in = get_sensors(self, w, x, y);
	self->senses = in;
	nn_bitset out = neural_net_compute(&mind_proto, self->mind, in);
	move_agent(self, out);
	circ->speed.x *= 0.995;
	circ->speed.y *= 0.995;
	return false;
}
