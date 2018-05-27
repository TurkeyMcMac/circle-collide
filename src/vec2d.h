#ifndef _VEC2D_H

#define _VEC2D_H

struct vec2d {
	float x, y;
};

float vec2d_length(const struct vec2d *self);

void vec2d_norm(struct vec2d *self);

void vec2d_rotate(struct vec2d *self, float radians);

#endif /* Header guard */
