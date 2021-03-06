#ifndef _CIRCLE_H

#define _CIRCLE_H

#include "vec2d.h"
#include <stdbool.h>
#include <stddef.h>

struct world;

struct circle;
struct circle_info {
	float radius, mass;
	bool (*on_update)(struct circle *self,
		struct world *w,
		unsigned x, unsigned y);
	void (*delete)(struct circle *self);
	bool (*on_collide)(struct circle *self, struct circle *other);
	void (*draw)(const struct circle *self);
};

struct circle {
	struct circle *next;
	struct circle_info *info;
	struct vec2d position, speed;
	bool is_updated;
};

#define LIST_FOR_EACH(list, item) \
	for ((item) = *(list);			\
			 (item) != NULL;	\
			 (item) = (item)->next)

void circle_draw(const struct circle *self);

float circle_collide(struct circle *restrict self,
	struct circle *restrict other);

bool circle_is_updated(const struct circle *self);

void circle_set_updated(struct circle *self);

void circle_finish_update(struct circle *self);

void circle_wrap_position(struct circle *self, const struct world *w);

struct circle **circle_collide_all(struct circle *self,
	struct circle **others,
	struct world *w);

#endif /* Header guard */
