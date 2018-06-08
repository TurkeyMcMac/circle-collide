#ifndef _NEURAL_NET_H

#define _NEURAL_NET_H

struct neural_net {
	unsigned input, hidden, output;
};

typedef unsigned long nn_bitset;

void neural_net_random(const struct neural_net *self, signed char *weights);

nn_bitset neural_net_compute(const struct neural_net *self,
	const signed char *weights,
	nn_bitset in_bits);

#define NN_WEIGHTS_NUM(input, hidden, output) \
	((hidden) * (input + 1) + (output) * (hidden + 1))
#define NN_WEIGHTS_ARRAY(array, input, hidden, output) \
	signed char array[NN_WEIGHTS_NUM((input), (hidden), (output))]

#endif /* Header guard */
