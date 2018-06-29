#ifndef _SAVE_BYTES_H

#define _SAVE_BYTES_H

#include "js-routines.h"

static inline void save_set(void *ptr, unsigned len)
{
	jsSetSave((unsigned)ptr, len);
}

#endif /* Header guard */
