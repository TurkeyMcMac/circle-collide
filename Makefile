executable = main.wasm
c-flags = $(CFLAGS) -O3 -s WASM=1 -s SIDE_MODULE=1 -s BINARYEN_TRAP_MODE=clamp
CC=emcc

wast-dest = $(patsubst %.wasm, %.wast, $(executable))

object-files = $(patsubst src/%.c, .intermediate/%.o, $(wildcard src/*.c))
dependencies = $(patsubst %.o, %.d, $(object-files))

all: $(executable)

$(executable): .intermediate $(object-files) 
	$(CC) $(c-flags) -o $(executable) $(object-files)
	wasm-dis $(executable) > $(wast-dest)

.intermediate:
	mkdir .intermediate

.intermediate/%.o: src/%.c
	$(CC) $(c-flags) -MMD -c $< -o $@

-include $(dependencies)

clean:
	rm -rf .intermediate $(executable)
