#include "random.h"
#include <limits.h>

static unsigned random_state;

void seed_random(unsigned seed)
{
       random_state = seed;
}

static unsigned rotright(unsigned rot, unsigned amount)
{
       amount %= 32;
       return (rot >> amount) | (rot << (32 - amount));
}

unsigned random(void)
{
       return random_state ^=
               rotright(random_state ^ (random_state * 31 - 1), random_state);
}

float frandom(void)
{
	return (float)random() / (float)UINT_MAX;
}
