#include "neural-net.h"

static nn_bitset compute_neuron(unsigned num_weights,
	const signed char *weights,
	nn_bitset in_bits)
{
	int sum;
	while (num_weights--) {
		if (in_bits & (1 << num_weights))
			sum += (int)weights[num_weights];
	}
	return sum > 0;
}

static nn_bitset compute_layer(unsigned num_neurons,
	unsigned weights_per_neuron,
	const signed char *weights,
	nn_bitset in_bits)
{
	nn_bitset out_bits = 0;
	while (num_neurons--) {
		out_bits |= compute_neuron(weights_per_neuron, weights
		          + num_neurons * weights_per_neuron, in_bits)
			 << num_neurons;
	}
	return out_bits;
}

nn_bitset neural_net_compute(const struct neural_net *self,
	const signed char *weights,
	nn_bitset in_bits)
{
	return compute_layer(self->output, self->hidden,
		weights + self->hidden* self->input,
		compute_layer(self->hidden, self->input, weights, in_bits));
}
