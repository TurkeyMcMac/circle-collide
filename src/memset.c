#include "memset.h"

void *memset(void *_mem, int byte, unsigned len)
{
	unsigned char *mem = _mem;
	while (len--)
		mem[len] = byte;
	return mem;
}
