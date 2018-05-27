#include <stdbool.h>
#include <stddef.h>

extern float asinf(float n);
extern float sinf(float n);
extern float cosf(float n);
extern float sqrtf(float n);
extern float fabsf(float n);

void *memset(void *_mem, int byte, unsigned len)
{
	unsigned char *mem = _mem;
	while (len--)
		mem[len] = byte;
	return mem;
}

static void *next_block_start = (void *)64;

static void *ealloc(unsigned size)
{
	void *block = next_block_start;
	next_block_start += (size + 3) / size * size;
	return block;
}

static unsigned random_state;

static unsigned rotright(unsigned rot, unsigned amount)
{
	amount %= 32;
	return (rot >> amount) | (rot << (32 - amount));
}

static inline void seed_random(unsigned seed)
{
	random_state = seed;
}

static unsigned random(void)
{
	
	return random_state ^=
		rotright(random_state ^ (random_state * 31 - 1), random_state);
}

struct vec2d {
	float x, y;
};

struct neural_net {
	unsigned input, hidden, output;
};

typedef unsigned long nn_bitset;

static nn_bitset compute_neuron(unsigned num_weights,
	const signed char *weights,
	nn_bitset in_bits)
{
	int sum;
	while (num_weights--) {
		if (in_bits & (1 << num_weights))
			sum += (int)weights[num_weights];
	}
	return sum > 0;
}

static nn_bitset compute_layer(unsigned num_neurons,
	unsigned weights_per_neuron,
	const signed char *weights,
	nn_bitset in_bits)
{
	nn_bitset out_bits = 0;
	while (num_neurons--) {
		out_bits |= compute_neuron(weights_per_neuron, weights
		          + num_neurons * weights_per_neuron, in_bits)
			 << num_neurons;
	}
	return out_bits;
}

static nn_bitset neural_net_compute(const struct neural_net *self,
	const signed char *weights,
	nn_bitset in_bits)
{
	return compute_layer(self->output, self->hidden,
		weights + self->hidden* self->input,
		compute_layer(self->hidden, self->input, weights, in_bits));
}

#define NN_WEIGHTS_NUM(input, hidden, output) \
	((hidden) * (input) + (output) * (hidden))
#define NN_WEIGHTS_ARRAY(array, input, hidden, output) \
	signed char array[NN_WEIGHTS_NUM((input), (hidden), (output))]

struct circle;
struct circle_info {
	float radius, mass;
	bool (*update)(struct circle *self);
};

struct circle {
	struct circle *next;
	struct circle_info *info;
	struct vec2d position, speed;
	int health;
	bool has_updated;
	//NN_WEIGHTS_ARRAY(brain, 28, 26, 5);
};

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

static struct world *world_new(unsigned width, unsigned height, float tile_size)
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

static void world_put(struct world *self, struct circle *c)
{
	unsigned tile_x = c->position.x / self->tile_size,
	         tile_y = c->position.y / self->tile_size;
	struct circle **tile = world_get(self, tile_x, tile_y);
	c->next = *tile;
	*tile = c;
}

static struct circle **world_neighbor(struct world *self,
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

extern void jsDrawCircle(float x, float y, float radius);

extern void jsDrawLine(float x1, float y1, float x2, float y2);

extern void jsLogNum(int n);

static void circle_draw(const struct circle *self)
{
	jsDrawCircle(self->position.x, self->position.y, self->info->radius);
}

static float vec2d_length(const struct vec2d *self)
{
	return sqrtf(self->x * self->x + self->y * self->y);
}

static void vec2d_norm(struct vec2d *self)
{
	float length = vec2d_length(self);
	self->x /= length;
	self->y /= length;
}

static void vec2d_rotate(struct vec2d *self, float radians)
{
	float x = self->x;
	self->x = x * cosf(radians) - self->y * sinf(radians);
	self->y = x * sinf(radians) + self->y * cosf(radians);
}

static void bounce(struct circle *restrict self, struct circle *restrict other)
{
	struct vec2d from_center = {
		other->position.x - self->position.x,
		other->position.y - self->position.y
	};
	float angle = asinf(fabsf(from_center.x) / vec2d_length(&from_center));
	float self_y, other_y;
	if (from_center.x * from_center.y < 0)
		angle *= -1;
	vec2d_rotate(&self->speed, angle);
	vec2d_rotate(&other->speed, angle);
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
	vec2d_rotate(&self->speed, -angle);
	vec2d_rotate(&other->speed, -angle);
}

static void circle_dont_overlap(struct circle *restrict self,
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

static float circle_collide(struct circle *restrict self,
	struct circle *restrict other)
{
	float touch_dist = self->info->radius + other->info->radius;
	struct vec2d diff = {
		fabsf(self->position.x - other->position.x),
		fabsf(self->position.y - other->position.y)
	};
	float dist;
	if (diff.x <= touch_dist && diff.y < touch_dist
	 && (dist = vec2d_length(&diff)) < touch_dist) {
		bounce(self, other);
		return dist;
	} else
		return -1.0; /* Indicates collision; negative distances don't
		              * exist. */
}

#define array_length(arr) ( sizeof(arr) / sizeof(*(arr)) )

void neural_net_random(const struct neural_net *self, signed char *weights)
{
	for (unsigned i = 0;
		i < NN_WEIGHTS_NUM(self->input, self->hidden, self->output);
		++i)
	{
		weights[i] = (signed char)(random() & 255);
	}
}

static const struct neural_net brain = {
	.input = 28,
	.hidden = 26,
	.output = 5,
};

static unsigned num_circles;
static struct world *world;
void init(unsigned nc, unsigned seed, float world_x, float world_y) {
	static struct circle_info info;
	info.radius = 6.24;
	info.mass = info.radius * info.radius;
	world = world_new(40, 20, 25.0);
	seed_random(seed);
	num_circles = nc;
	while (nc--) {
		struct circle *c = ealloc(sizeof(*c));
		c->info = &info;
		c->position.x = random() %
			(unsigned)(world->width * world->tile_size);
		c->position.y = random() %
			(unsigned)(world->height * world->tile_size);
		c->speed.x = ((float)(random() % 2000) - 1000.0) / 300.0;
		c->speed.y = ((float)(random() % 2000) - 1000.0) / 300.0;
		world_put(world, c);
		circle_draw(c);
		//jsLogNum(asinf(c->position.y));
		//neural_net_random(&brain, c->brain);
	}
}

bool circle_is_updated(const struct circle *self)
{
	unsigned long marked = (unsigned long)self->info;
	return marked & 1;
}

void circle_set_updated(struct circle *self)
{
	unsigned long mark = (unsigned long)self->info;
	self->info = (void *)(mark | 1);
}

void circle_finish_update(struct circle *self)
{
	unsigned long marked = (unsigned long)self->info;
	self->info = (void *)(marked & ~1);
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

int wrap_int(int i, int range)
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
	jsLogNum(1337);
	jsLogNum(x);
	jsLogNum(y);
	int nx = wrap_int(x, self->width),
	    ny = wrap_int(y, self->height);
	jsLogNum(nx);
	jsLogNum(ny);
	return world_get(self, nx, ny);
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
		circle_dont_overlap(self, other, distance);
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

#define LIST_FOR_EACH(list, item) \
	for ((item) = *(list);			\
			 (item) != NULL;	\
			 (item) = (item)->next)

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
/*	unsigned i;
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
	}*/
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
		/*		jsDrawLine(
					c->position.x,
					c->position.y,
					(float)x * self->tile_size,
					(float)y * self->tile_size
				);*/
			}
		}
	}
}

void step_circles(void)
{
	jsLogNum(3333);
	world_update_top_left(world);
	world_update_top(world);
	world_update_top_right(world);
	world_update_left(world);
	world_update_middle(world);
	world_update_right(world);
	world_update_bottom_left(world);
	world_update_bottom(world);
	world_update_bottom_right(world);
	world_move_circles(world);
	world_reset_updates(world);
	world_draw(world);
}

int main(void)
{
	return 42;
}
