#include "agent.h"
#include "circle.h"
#include "container-of.h"
#include "ealloc.h"
#include "js-routines.h"
#include "math.h"
#include "memset.h"
#include "neural-net.h"
#include "random.h"
#include "vec2d.h"
#include "world.h"

static struct world *world;

void init_world(unsigned width, unsigned height, float tile_size)
{
	initialize_module_ealloc();
	world = world_new(width, height, tile_size);
}

void populate_world(unsigned pop)
{
	initialize_module_agent();
	while (pop--) {
		struct circle *c;
		if (random() & 3) {
			struct bullet *b = ealloc(sizeof(*b));
			b->health = 100;
			c = &b->c;
			c->info = &bullet_info;
		}
		else {
			struct agent *a = ealloc(sizeof(*a));
			c = &a->c;
			c->info = &agent_info;
			a->direction = frandom() * 2 * PI;
			neural_net_random(&mind_proto, a->mind);
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
