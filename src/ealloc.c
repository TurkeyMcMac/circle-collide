#include "ealloc.h"
#include <stddef.h>

/* I'm not sure why this is necessary, but otherwise the variable is overwritten
 * in numerous places by adding constants which have values around 5243000. The
 * first item in the array seems to work as a sink for these strange additions.
 */
static void *next_block_start_padding_[2];
#define next_block_start ( next_block_start_padding_[1] )

#define HEAP_START ( (void *)1024 )
void initialize_module_ealloc(void)
{
	next_block_start = HEAP_START;
}

#define HEAP_END ( (void *)16777216 )
void *ealloc(unsigned size)
{
	void *block = next_block_start;
	next_block_start += (size + 3) / size * size;
	if (next_block_start >= HEAP_END) {
		next_block_start = block;
		block = NULL;
	}
	return block;
}
