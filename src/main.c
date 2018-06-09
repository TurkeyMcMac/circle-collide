#include "agent.h"
#include "circle.h"
#include "ealloc.h"
#include "js-routines.h"
#include "memset.h"
#include "neural-net.h"
#include "random.h"
#include "vec2d.h"
#include "world.h"

void bullet_draw(const struct circle *self)
{
	jsDrawCircle(self->position.x, self->position.y, self->info->radius);
}

bool bullet_update(struct circle *self)
{
	return false;
}

struct circle_info agent_info;
struct circle_info bullet_info;

static unsigned num_circles;
static struct world *world;
void init(unsigned nc, unsigned seed, float world_x, float world_y) {
	agent_info.draw = agent_draw;
	agent_info.on_update = agent_update;
	agent_info.radius = 6.24;
	agent_info.mass = agent_info.radius * agent_info.radius;
	bullet_info.draw = bullet_draw;
	bullet_info.on_update = bullet_update;
	bullet_info.radius = 4.0;
	bullet_info.mass = 16.0;
	mind_proto.input = AGENT_N_INPUTS;
	mind_proto.hidden = AGENT_N_HIDDEN;
	mind_proto.output = AGENT_N_OUTPUTS;
	world = world_new(40, 20, 25.0);
	seed_random(seed);
	num_circles = nc;
	while (nc--) {
		struct circle *c;
		if (random() & 3) {
			struct agent *a = ealloc(sizeof(*a));
			c = &a->c;
			c->info = &agent_info;
			a->direction = frandom() * 6.28;
			neural_net_random(&mind_proto, a->mind);
		}
		else {
			c = ealloc(sizeof(*c));
			c->info = &bullet_info;
		}
		c->position.x = random() %
			(unsigned)(world->width * world->tile_size);
		c->position.y = random() %
			(unsigned)(world->height * world->tile_size);
		c->speed.x = frandom() * 2.0 - 1.0;
		c->speed.y = frandom() * 2.0 - 1.0;
		world_put(world, c);
	}
}

void step_circles(void)
{
	world_update_top_left(world);
	world_update_top(world);
	world_update_top_right(world);
	world_update_left(world);
	world_update_middle(world);
	world_update_right(world);
	world_update_bottom_left(world);
	world_update_bottom(world);
	world_update_bottom_right(world);
	world_move_circles(world);
	world_reset_updates(world);
	world_draw(world);
}
