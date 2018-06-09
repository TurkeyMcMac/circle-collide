#include "agent.h"
#include "container-of.h"
#include "js-routines.h"
#include "math.h"
#include "vec2d.h"
#include "random.h"

void agent_draw(const struct circle *circ)
{
	const struct agent *self = container_of(circ, struct agent, c);
	struct vec2d direction = {circ->info->radius, 0};
	vec2d_rotation_t rotation;
	vec2d_rotation_get(&rotation, self->direction);
	vec2d_apply_rotation(&direction, &rotation);
	jsDrawLine(
		circ->position.x, circ->position.y,
		circ->position.x + direction.x, circ->position.y + direction.y
	);
	jsDrawCircle(circ->position.x, circ->position.y, circ->info->radius);
}

struct neural_net mind_proto;

bool agent_update(struct circle *circ)
{
	struct agent *self = container_of(circ, struct agent, c);
	nn_bitset output = neural_net_compute(&mind_proto, self->mind,
		vec2d_length(&circ->speed) * 50000.0);
	if (output & AGENT_OUT_LEFT) {
		self->direction += 0.1;
	}
	if (output & AGENT_OUT_RIGHT)
		self->direction -= 0.1;
	if (output & AGENT_OUT_THRUST) {
		vec2d_rotation_t rotation;
		struct vec2d thrust = { 0.05, 0};
		vec2d_rotation_get(&rotation, self->direction);
		vec2d_apply_rotation(&thrust, &rotation);
		circ->speed.x += thrust.x;
		circ->speed.y += thrust.y;
	}
	circ->speed.x *= 0.995;
	circ->speed.y *= 0.995;
	return false;
}