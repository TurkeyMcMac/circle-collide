#include "world.h"
#include "ealloc.h"
#include "js-routines.h"
#include "memset.h"

struct world *world_new(unsigned width, unsigned height, float tile_size)
{
	struct world *w =
		ealloc(sizeof(*w) + width * height * sizeof(*w->tiles));
	w->width = width;
	w->height = height;
	w->tile_size = tile_size;
	unsigned i = width * height;
	while (i--) {
		w->tiles[i] = NULL;
	}
	return w;
}

void world_put(struct world *self, struct circle *c)
{
	unsigned tile_x = c->position.x / self->tile_size,
	         tile_y = c->position.y / self->tile_size;
	struct circle **tile = world_get(self, tile_x, tile_y);
	c->next = *tile;
	*tile = c;
}

struct circle **world_neighbor(struct world *self,
	int	x, int	y,
	int dx, int dy)
{
	x += dx;
	y += dx;
	if (x < 0)
		do
			x += self->width;
		while (x < 0);
	else
		x %= self->width;
	return world_get(self, x, y);
}


static int wrap_int(int i, int range)
{
	if (i < 0) {
		do
			i += range;
		while (i < 0);
	} else {
		i %= range;
	}
	return i;
}

struct circle **world_get_wrap(struct world *self, int x, int y)
{
	return world_get(self,
		wrap_int(x, self->width), wrap_int(y, self->height));
}

void world_update_tile_with_itself(struct world *self, unsigned x, unsigned y)
{
	struct circle **list = world_get(self, x, y);
	struct circle *c = *list;
	while (c != NULL) {
		struct circle **dest = circle_collide_all(c, &c->next, self),
		              *next = c->next;
		if (dest) {
			*list = next;
			c->next = *dest;
			*dest = c;
		} else
			list = &c->next;
		c = next;
	}
}

void world_update_tiles(struct world *self,
	unsigned x1, unsigned y1,
	unsigned x2, unsigned y2)
{
	struct circle **t1 = world_get(self, x1, y1),
	              **t2 = world_get(self, x2, y2);
	struct circle *c = *t1;
	while (c != NULL) {
		struct circle *next = c->next,
		              **dest = circle_collide_all(c, t2, self);
		if (dest) {
			*t1 = next;
			c->next = *dest;
			*dest = c;
		} else
			t1 = &c->next;
		c = next;
	}
}

void tile_wrap_x(struct circle **self, const struct world *w)
{
	struct circle *c;
	LIST_FOR_EACH(self, c) {
		c->position.x -= (float)w->width * w->tile_size;
	}
}

void tile_unwrap_x(struct circle **self, const struct world *w)
{
	struct circle *c;
	LIST_FOR_EACH(self, c) {
		c->position.x += (float)w->width * w->tile_size;
	}
}

void tile_wrap_y(struct circle **self, const struct world *w)
{
	struct circle *c;
	LIST_FOR_EACH(self, c) {
		c->position.y -= (float)w->height * w->tile_size;
	}
}

void tile_unwrap_y(struct circle **self, const struct world *w)
{
	struct circle *c;
	LIST_FOR_EACH(self, c) {
		c->position.y += (float)w->height * w->tile_size;
	}
}

void world_update_top_left(struct world *self)
{
	world_update_tile_with_itself(self, 0, 0);
	world_update_tiles(self, 0, 0, 1, 0);
	world_update_tiles(self, 0, 0, 1, 1);
	world_update_tiles(self, 0, 0, 0, 1);
	tile_wrap_x(world_get(self, self->width - 1, 1), self);
	world_update_tiles(self, 0, 0, self->width - 1, 1);
	tile_unwrap_x(world_get(self, self->width - 1, 1), self);
}

void world_update_top(struct world *self)
{
	for (unsigned x = 1; x < self->width - 1; ++x) {
		world_update_tile_with_itself(self, x, 0);
		world_update_tiles(self, x, 0, x + 1, 0);
		world_update_tiles(self, x, 0, x + 1, 1);
		world_update_tiles(self, x, 0, x, 1);
		world_update_tiles(self, x, 0, x - 1, 1);
	}
}

void world_update_top_right(struct world *self)
{
	unsigned right = self->width - 1;
	world_update_tile_with_itself(self, right, 0);
	tile_wrap_x(world_get(self, right, 0), self);
	world_update_tiles(self, right, 0, 0, 0);
	world_update_tiles(self, right, 0, 0, 1);
	tile_unwrap_x(world_get(self, right, 0), self);
	world_update_tiles(self, right, 0, right, 1);
	world_update_tiles(self, right, 0, right - 1, 1);
}

void world_update_left(struct world *self)
{
	for (unsigned y = 1; y < self->height - 1; ++y) {
		world_update_tile_with_itself(self, 0, y);
		world_update_tiles(self, 0, y, 1, y);
		world_update_tiles(self, 0, y, 1, y + 1);
		world_update_tiles(self, 0, y, 0, y + 1);
		tile_wrap_x(world_get(self, self->width - 1, y + 1), self);
		world_update_tiles(self, 0, y, self->width - 1, y + 1);
		tile_unwrap_x(world_get(self, self->width - 1, y + 1), self);
	}
}

void world_update_middle(struct world *self)
{
	for (unsigned y = 1; y < self->height - 1; ++y) {
		for (unsigned x = 1; x < self->width - 1; ++x) {
			world_update_tile_with_itself(self, x, y);
			world_update_tiles(self, x, y, x + 1, y);
			world_update_tiles(self, x, y, x + 1, y + 1);
			world_update_tiles(self, x, y, x, y + 1);
			world_update_tiles(self, x, y, x - 1, y + 1);
		}
	}
}

void world_update_right(struct world *self)
{
	unsigned right = self->width - 1;
	for (unsigned y = 1; y < self->height - 1; ++y) {
		world_update_tile_with_itself(self, right, y);
		tile_wrap_x(world_get(self, right, y), self);
		world_update_tiles(self, right, y, 0, y);
		world_update_tiles(self, right, y, 0, y + 1);
		tile_unwrap_x(world_get(self, right, y), self);
		world_update_tiles(self, right, y, right, y + 1);
		world_update_tiles(self, right, y, right - 1, y + 1);
	}
}

void world_update_bottom_left(struct world *self)
{
	unsigned bottom = self->height - 1;
	struct circle **t = world_get(self, 0, bottom);
	world_update_tile_with_itself(self, 0, bottom);
	world_update_tiles(self, 0, bottom, 1, bottom);
	tile_wrap_y(world_get(self, 0, bottom), self);
	world_update_tiles(self, 0, bottom, 1, 0);
	world_update_tiles(self, 0, bottom, 0, 0);
	tile_wrap_x(world_get(self, self->width - 1, 0), self);
	world_update_tiles(self, 0, bottom, self->width - 1, 0);
	tile_unwrap_x(world_get(self, self->width - 1, 0), self);
	tile_unwrap_y(world_get(self, 0, bottom), self);
}

void world_update_bottom(struct world *self)
{
	for (unsigned x = 1; x < self->width - 1; ++x) {
		unsigned bottom = self->height - 1;
		world_update_tile_with_itself(self, x, bottom);
		world_update_tiles(self, x, bottom, x + 1, bottom);
		tile_wrap_y(world_get(self, x, bottom), self);
		world_update_tiles(self, x, bottom, x + 1, 0);
		world_update_tiles(self, x, bottom, x, 0);
		world_update_tiles(self, x, bottom, x - 1, 0);
		tile_unwrap_y(world_get(self, x, bottom), self);
	}
}

void world_update_bottom_right(struct world *self)
{
	unsigned bottom = self->height - 1, right = self->width - 1;
	world_update_tile_with_itself(self, right, bottom);
	tile_wrap_x(world_get(self, right, bottom), self);
	world_update_tiles(self, right, bottom, 0, bottom);
	tile_wrap_y(world_get(self, right, bottom), self);
	world_update_tiles(self, right, bottom, 0, 0);
	tile_unwrap_x(world_get(self, right, bottom), self);
	world_update_tiles(self, right, bottom, right, 0);
	world_update_tiles(self, right, bottom, right - 1, 0);
	tile_unwrap_y(world_get(self, right, bottom), self);
}

void world_reset_updates(struct world *self)
{
	for (unsigned i = 0; i < self->width * self->height; ++i) {
		struct circle *c;
		LIST_FOR_EACH(&self->tiles[i], c)
			circle_finish_update(c);
	}
}

void world_move_circles(struct world *self)
{
	for (unsigned y = 0; y < self->height; ++y) {
		for (unsigned x = 0; x < self->width; ++x) {
			struct circle **tile = world_get(self, x, y),
			              *c = *tile;
			while (c != NULL) {
				if (circle_is_updated(c)) {
					tile = &c->next;
					c = c->next;
					continue;
				}
				c->info->on_update(c);
				struct circle *next = c->next;
				c->position.x += c->speed.x;
				c->position.y += c->speed.y;
				int new_tile_x = (int)(c->position.x
					/ self->tile_size);
				int new_tile_y = (int)(c->position.y
					/ self->tile_size);
				if (new_tile_x != x || new_tile_y != y) {
					struct circle **dest =
						world_get_wrap(self, new_tile_x,
							new_tile_y);
					circle_wrap_position(c, self);
					*tile = next;
					c->next = *dest;
					*dest = c;
					circle_set_updated(c);
				} else
					tile = &c->next;
				c = next;
			}
		}
	}
}

void world_draw(struct world *self)
{
	unsigned i;
	(void)i;
#ifdef SHOULD_DRAW_CELLS
	for (i = 1; i <= self->width; ++i) {
		jsDrawLine(
			(float)i * self->tile_size,
			0.0,
			(float)i * self->tile_size,
			(float)self->height * self->tile_size
		);
	}
	for (i = 1; i <= self->height; ++i) {
		jsDrawLine(
			0.0,
			(float)i * self->tile_size,
			(float)self->width * self->tile_size,
			(float)i * self->tile_size
		);
	}
#endif /* defined SHOULD_DRAW_CELLS */
	for (unsigned y = 0; y <  self->height; ++y) {
		for (unsigned x = 0; x < self->width; ++x) {
			struct circle *c, **tile = world_get(self, x, y);
			LIST_FOR_EACH(tile, c) {
				float width = (float)self->width
				            * self->tile_size;
				float height = (float)self->height
				            * self->tile_size;
				c->position.x -= width;
				c->position.y -= height;
				circle_draw(c);
				c->position.x += width;
				circle_draw(c);
				c->position.x += width;
				circle_draw(c);
				c->position.y += height;
				circle_draw(c);
				c->position.y += height;
				circle_draw(c);
				c->position.x -= width;
				circle_draw(c);
				c->position.x -= width;
				circle_draw(c);
				c->position.y -= height;
				circle_draw(c);
				c->position.x += width;
				circle_draw(c);
#ifdef SHOULD_DRAW_CELL_LINKS
				jsDrawLine(
					c->position.x,
					c->position.y,
					(float)x * self->tile_size,
					(float)y * self->tile_size
				);
#endif /* defined SHOULD_DRAW_CELL_LINKS */
			}
		}
	}
}
