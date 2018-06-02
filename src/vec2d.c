#include "math.h"
#include "vec2d.h"

float vec2d_length(const struct vec2d *self)
{
	return sqrtf(self->x * self->x + self->y * self->y);
}

void vec2d_norm(struct vec2d *self)
{
	float length = vec2d_length(self);
	self->x /= length;
	self->y /= length;
}

void vec2d_rotation_get(vec2d_rotation_t *self, float radians)
{
	self->cos = cosf(radians);
	self->sin = sinf(radians);
}

void vec2d_apply_rotation(struct vec2d *self, const vec2d_rotation_t *rot)
{
	float x = self->x;
	self->x = x * rot->cos - self->y * rot->sin;
	self->y = x * rot->sin + self->y * rot->cos;
}
