#include "circle.h"

struct world {
	unsigned width, height;
	float tile_size;
	struct circle *tiles[];
};

#define DEFINE_WORLD_STRUCT(w, h, ts) { \
	.width = (w),						\
	.height = (h),						\
	.tile_size = (ts),					\
	.tiles = {[(w) * (h) - 1] = 0}				\
}

static inline struct circle **world_get(struct world *self, unsigned x,
	unsigned y)
{
	return &self->tiles[y * self->width + x];
}

struct world *world_new(unsigned width, unsigned height, float tile_size);

void world_put(struct world *self, struct circle *c);

struct circle **world_neighbor(struct world *self,
	int	x, int	y,
	int dx, int dy);

struct circle **world_get_wrap(struct world *self, int x, int y);

void world_update_tile_with_itself(struct world *self, unsigned x, unsigned y);

void world_update_tiles(struct world *self,
	unsigned x1, unsigned y1,
	unsigned x2, unsigned y2);

void tile_wrap_x(struct circle **self, const struct world *w);

void tile_unwrap_x(struct circle **self, const struct world *w);

void tile_wrap_y(struct circle **self, const struct world *w);

void tile_unwrap_y(struct circle **self, const struct world *w);

void world_update_top_left(struct world *self);

void world_update_top(struct world *self);

void world_update_top_right(struct world *self);

void world_update_left(struct world *self);

void world_update_middle(struct world *self);

void world_update_right(struct world *self);

void world_update_bottom_left(struct world *self);

void world_update_bottom(struct world *self);

void world_update_bottom_right(struct world *self);

void world_reset_updates(struct world *self);

void world_move_circles(struct world *self);

void world_draw(struct world *self);

void world_clear(struct world *self);
