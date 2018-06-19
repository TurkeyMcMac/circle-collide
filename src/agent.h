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

struct agent {
	struct circle c;
	nn_bitset senses;
	float direction;
	int health;
	int cooldown;
	unsigned score;
	unsigned char mem;
	NN_WEIGHTS_ARRAY(mind, AGENT_N_INPUTS, AGENT_N_HIDDEN, AGENT_N_OUTPUTS);
};

extern struct circle_info agent_info;
extern struct circle_info bullet_info;

extern struct neural_net mind_proto;

struct bullet {
	struct circle c;
	struct agent *owner;
	int time;
};

struct agent_manager {
	unsigned n_agents,
	         n_living;
	struct agent agents[];
};

void initialize_module_agent(void);

#endif /* Header guard */
