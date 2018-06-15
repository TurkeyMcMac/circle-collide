#include "intersector.h"
#include "math.h"

#include "js-routines.h"

void intersector_init(intersector_t *self,
	const struct vec2d *pos,
	const struct vec2d *shape)
{
	float angle;
	self->length = vec2d_length(shape);
	angle = asinf(shape->y / self->length);
	if (shape->x > 0.0)
		angle *= -1;
	else
		angle += angle > 0.0 ? PI : -PI;
	vec2d_rotation_get(&self->rot, angle);
	self->position = *pos;
}

bool intersects(const intersector_t *self, const struct circle *c)
{
	struct vec2d relative = {
		c->position.x - self->position.x,
		c->position.y - self->position.y
	};
	vec2d_apply_rotation(&relative, &self->rot);
	return fabsf(relative.y) < c->info->radius
	    && relative.x > -c->info->radius
	    && relative.x < self->length + c->info->radius;
}
