void *memcpy(void *restrict into_, const void *restrict from_, unsigned n)
{
	char *restrict into = into_;
	const char *restrict from = from_;
	while (n--)
		into[n] = from[n];
	return into;
}

void *memset(void *mem_, int byte, unsigned len)
{
	unsigned char *mem = mem_;
	while (len--)
		mem[len] = byte;
	return mem;
}
