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

void vec2d_rotate(struct vec2d *self, float radians)
{
	float x = self->x;
	self->x = x * cosf(radians) - self->y * sinf(radians);
	self->y = x * sinf(radians) + self->y * cosf(radians);
}
