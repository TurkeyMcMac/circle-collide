#include "ealloc.h"

static void *next_block_start = (void *)64;

void *ealloc(unsigned size)
{
	void *block = next_block_start;
	next_block_start += (size + 3) / size * size;
	return block;
}

