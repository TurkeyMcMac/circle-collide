#define container_of(ptr, strct, member) \
	( (strct *)((char *)(ptr) - offsetof(strct, member)) )
