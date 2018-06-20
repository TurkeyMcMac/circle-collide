CIRCLE COLLIDE
--------------
This program simulates the collision of many circles. It also simulates the
evolution of their malleable minds. Over time, they will ideally become skilled
in killing their brethren with bullets.

The bulk of this program is written in C to be compiled to WebAssembly.
Therefore, emscripten is required for compilation. However, since WebAssembly
runs on a portable machine, a compiled binary (main.wasm) is also included.

Since WebAssembly is not yet mature, it's a bit annoying to get the browser to
accept it. Under linux, the solution seems to be to add "application/wasm  wasm"
under /etc/mime.types. I have not yet found a solution for Mac OS, and I haven't
even tried running it under Windows. If you know of a way to run WebAssembly in
a non-Linux environment, please add it to this README or something.
