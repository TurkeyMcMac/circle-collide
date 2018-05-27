#include "circle.h"
#include "ealloc.h"
#include "memset.h"
#include "neural-net.h"
#include "random.h"
#include "vec2d.h"
#include "world.h"

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
	}
}

void step_circles(void)
{
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
