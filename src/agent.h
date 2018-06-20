#ifndef _AGENT_H

#define _AGENT_H

#include "circle.h"
#include "neural-net.h"

#define AGENT_N_MEM_BITS 5
#define AGENT_N_SENSORS 27

#define AGENT_N_INPUTS  (AGENT_N_MEM_BITS + AGENT_N_SENSORS)
#define AGENT_N_HIDDEN  (AGENT_N_INPUTS - 1)
#define AGENT_N_OUTPUTS (AGENT_N_MEM_BITS + 4)

#define AGENT_MEM_MASK ( (1 << AGENT_N_MEM_BITS) - 1 )
#define AGENT_OUT_THRUST  ( 1 << (AGENT_N_MEM_BITS + 0) )
#define AGENT_OUT_LEFT    ( 1 << (AGENT_N_MEM_BITS + 1) )
#define AGENT_OUT_RIGHT   ( 1 << (AGENT_N_MEM_BITS + 2) )
#define AGENT_OUT_SHOOT   ( 1 << (AGENT_N_MEM_BITS + 3) )

#define AGENT_MIND_SIZE \
	NN_WEIGHTS_NUM(AGENT_N_INPUTS, AGENT_N_HIDDEN, AGENT_N_OUTPUTS)

struct agent {
	struct circle c;
	nn_bitset_t senses;
	float direction;
	int health;
	int cooldown;
	unsigned score;
	unsigned char mem;
	signed char *mind;
};

struct bullet {
	struct circle c;
	struct agent *owner;
	int time;
};

struct agent_manager {
	unsigned n_agents;
	struct agent agents[];
};

static inline int agent_fitness(const struct agent *self)
{
	return self->health + (int)self->score * 2;
}


struct agent_manager *agent_manager_new(unsigned n_agents);

void agent_manager_spread(struct agent_manager *self, struct world *w);

void agent_manager_winnow(struct agent_manager *self);

void initialize_module_agent(void);

#endif /* Header guard */
