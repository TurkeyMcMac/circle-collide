#ifndef _INTERSECTOR_H

#define _INTERSECTOR_H

#include <stdbool.h>
#include "circle.h"

typedef struct intersector {
	struct vec2d position;
	float length;
	vec2d_rotation_t rot;
} intersector_t;

void intersector_init(intersector_t *self,
	const struct vec2d *pos,
	const struct vec2d *shape);

bool intersects(const intersector_t *self, const struct circle *c);

#endif /* Header guard */
