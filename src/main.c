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

static struct agent_manager *manager;
static struct world *world;

void init_world(unsigned width, unsigned height, float tile_size)
{
	initialize_module_ealloc();
	world = world_new(width, height, tile_size);
}

void populate_world(unsigned pop)
{
	initialize_module_agent();
	manager = agent_manager_new(pop);
	agent_manager_spread(manager, world);
}

void next_generation(void)
{
	world_clear(world);
	agent_manager_winnow(manager);
	for (size_t i = 0; i < manager->n_agents; ++i)
		jsAppendScore(agent_fitness(&manager->agents[i]));
	agent_manager_spread(manager, world);
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
