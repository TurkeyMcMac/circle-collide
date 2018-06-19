#include "circle.h"
#include "js-routines.h"
#include "math.h"
#include "world.h"

void circle_draw(const struct circle *self)
{
	self->info->draw(self);
}

static void bounce(struct circle *restrict self,
	struct circle *restrict other,
	float dist)
{
	struct vec2d from_center = {
		other->position.x - self->position.x,
		other->position.y - self->position.y
	};
	vec2d_rotation_t rotation;
	float self_y, other_y;
	float angle;
	angle = asinf(from_center.x / dist);
	if (from_center.y < 0)
		angle *= -1;
	vec2d_rotation_get(&rotation, angle);
	vec2d_apply_rotation(&self->speed, &rotation);
	vec2d_apply_rotation(&other->speed, &rotation);
	self_y = self->speed.y;
	other_y = other->speed.y;
	self->speed.y = (self->info->mass - other->info->mass)
	              / (self->info->mass + other->info->mass) * self_y
	              + 2 * other->info->mass
	              / (self->info->mass + other->info->mass) * other_y;
	other->speed.y = 2 * self->info->mass
	               / (self->info->mass + other->info->mass) * self_y
	               + (other->info->mass - self->info->mass)
	               / (self->info->mass + other->info->mass) * other_y;
	vec2d_rotation_get(&rotation, -angle);
	vec2d_apply_rotation(&self->speed, &rotation);
	vec2d_apply_rotation(&other->speed, &rotation);
}

static void dont_overlap(struct circle *restrict self,
	struct circle *restrict other,
	float dist)
{
	float move_away = self->info->radius + other->info->radius - dist;
	float self_move_away = other->info->radius * move_away / dist,
	                       other_move_away = self->info->radius
				       * move_away / dist;
	struct vec2d from_center = {
		other->position.x - self->position.x,
		other->position.y - self->position.y
	};
	vec2d_norm(&from_center);
	self->position.x -= from_center.x * self_move_away;
	self->position.y -= from_center.y * self_move_away;
	other->position.x += from_center.x * other_move_away;
	other->position.y += from_center.y * other_move_away;
}

float circle_collide(struct circle *restrict self,
	struct circle *restrict other)
{
	float touch_dist = self->info->radius + other->info->radius;
	struct vec2d diff = {
		fabsf(self->position.x - other->position.x),
		fabsf(self->position.y - other->position.y)
	};
	float dist;
	if (diff.x <= touch_dist && diff.y < touch_dist
	 && (dist = vec2d_length(&diff)) < touch_dist
	 && dist > 0.0) {
		bounce(self, other, dist);
		return dist;
	} else
		return -1.0; /* Indicates collision; negative distances don't
		              * exist. */
}

bool circle_is_updated(const struct circle *self)
{
	return self->is_updated;
}

void circle_set_updated(struct circle *self)
{
	self->is_updated = true;
}

void circle_finish_update(struct circle *self)
{
	self->is_updated = false;
}

static float wrap_float(float f, float range)
{
	if (f < 0) {
		do
			f += range;
		while (f < 0);
	} else {
		while (f > range)
			f -= range;
	}
	return f;
}

void circle_wrap_position(struct circle *self, const struct world *w)
{
	self->position.x = wrap_float(self->position.x,
		(float)w->width * w->tile_size);
	self->position.y = wrap_float(self->position.y,
		(float)w->height * w->tile_size);
}

struct circle **circle_collide_all(struct circle *self,
	struct circle **others,
	struct world *w)
{
	if (circle_is_updated(self))
		return NULL;
	struct circle *other = *others;
	int tile_x = self->position.x / w->tile_size,
			tile_y = self->position.y / w->tile_size;
	while (other != NULL) {
		float distance = circle_collide(self, other);
		if (distance < 0) {
			others = &other->next;
			other = other->next;
			continue;
		}
		dont_overlap(self, other, distance);
		int other_tile_x = other->position.x / w->tile_size,
				other_tile_y = other->position.y / w->tile_size;
		struct circle *next = other->next;
		if (other_tile_x != tile_x || other_tile_y != tile_y) {
			struct circle **dest = world_get_wrap(w, other_tile_x,
				other_tile_y);
			circle_wrap_position(other, w);
			*others = next;
			other->next = *dest;
			*dest = other;
		}
		other = next;
	}
	int new_tile_x = self->position.x / w->tile_size,
			new_tile_y = self->position.y / w->tile_size;
	if (new_tile_x != tile_x || new_tile_y != tile_y) {
		circle_wrap_position(self, w);
		return world_get_wrap(w, new_tile_x, new_tile_y);
	} else
		return NULL;
}
