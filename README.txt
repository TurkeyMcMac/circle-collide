Simulates colliding circles, more will come. This is very early in development.

Emscripten required to compile:
emcc -s WASM=1 -s SIDE_MODULE=1 circle-collide.c -s BINARYEN_TRAP_MODE=clamp -o circle-collide.wasm -O3
