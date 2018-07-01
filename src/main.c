#include "agent.h"
#include "circle.h"
#include "container-of.h"
#include "ealloc.h"
#include "js-routines.h"
#include "math.h"
#include "mem.h"
#include "neural-net.h"
#include "random.h"
#include "save.h"
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
	for (unsigned i = 0; i < manager->n_agents; ++i)
		agent_random(&manager->agents[i]);
	agent_manager_spread(manager, world);
}

static signed char genome[AGENT_MIND_SIZE];
static unsigned genome_write_head = 0;

void init_genome_write_head(void)
{
	genome_write_head = 0;
}

int write_gene(unsigned gene)
{
	genome[genome_write_head] = gene;
	++genome_write_head;
	return genome_write_head < AGENT_MIND_SIZE;
}

void populate_world_with_genome(unsigned pop)
{
	initialize_module_agent();
	manager = agent_manager_new(pop);
	memcpy(manager->agents[0].mind, genome, AGENT_MIND_SIZE);
	for (unsigned i = 1; i < manager->n_agents; ++i)
		agent_mutate(&manager->agents[i], &manager->agents[0]);
	agent_manager_spread(manager, world);
}

void next_generation(void)
{
	world_clear(world);
	agent_manager_winnow(manager);
	for (size_t i = 0; i < manager->n_agents; ++i)
		jsAppendScore(agent_fitness(&manager->agents[i]));
	save_set(manager->agents[0].mind, AGENT_MIND_SIZE);
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
