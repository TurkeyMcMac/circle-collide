#ifndef _AGENT_H

#define _AGENT_H

#include "circle.h"
#include "neural-net.h"

#define AGENT_N_INPUTS 27
#define AGENT_N_HIDDEN 26
#define AGENT_N_OUTPUTS 4

#define AGENT_OUT_THRUST  ( 1 << 0 )
#define AGENT_OUT_LEFT    ( 1 << 1 )
#define AGENT_OUT_RIGHT   ( 1 << 2 )
#define AGENT_OUT_SHOOT   ( 1 << 3 )

struct agent {
	struct circle c;
	float direction;
	int health;
	unsigned score;
	NN_WEIGHTS_ARRAY(mind, AGENT_N_INPUTS, AGENT_N_HIDDEN, AGENT_N_OUTPUTS);
};

extern struct neural_net mind_proto;

struct bullet {
	struct circle c;
	struct agent *owner;
	int health;
};

struct agent_manager {
	unsigned n_agents,
	         n_living;
	struct agent agents[];
};

void agent_draw(const struct circle *circ);

bool agent_update(struct circle *circ, struct world *w);

void agent_init_sensor_protos(float range);

#endif /* Header guard */
