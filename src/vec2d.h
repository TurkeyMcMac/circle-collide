#ifndef _VEC2D_H

#define _VEC2D_H

struct vec2d {
	float x, y;
};

typedef struct {
	float cos, sin;
} vec2d_rotation_t;

void vec2d_rotation_get(vec2d_rotation_t *self, float radians);

void vec2d_apply_rotation(struct vec2d *self, const vec2d_rotation_t *rot);

float vec2d_length(const struct vec2d *self);

void vec2d_norm(struct vec2d *self);

#endif /* Header guard */
