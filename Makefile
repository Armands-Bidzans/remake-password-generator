all: main

CC = clang
LLCC = llc
LINK = llvm-link
WASMLD = wasm-ld
W2W = wasm2wat
override CLINKWARNFLAGS += -Wno-incompatible-library-redeclaration
override CLINKFLAGS += -fwasm-exceptions -std=c2x -I./include -nostdinc -nostdlib -fno-stack-protector --target=wasm32 -emit-llvm -c -S
override LLCCFLAGS += -mcpu=generic -I=./include -exception-model=wasm -march=wasm32 -filetype=obj
override LINKFLAGS += -S
override WASMLDFLAGS += --no-entry --export-all --allow-undefined -z stack-size=8192
override W2WFLAGS += --enable-all

SRCS = $(shell find . -name '.ccls-cache' -type d -prune -o -type f -name '*.c' -print)
HEADERS = $(shell find . -name '.ccls-cache' -type d -prune -o -type f -name '*.h' -print)

main: $(SRCS) $(HEADERS)
	rm -rf out.ll
	$(CC) $(CLINKFLAGS) $(CLINKWARNFLAGS) -O3 $(SRCS)
	$(LINK) $(LINKFLAGS) -o out.ll *.ll
	$(LLCC) $(LLCCFLAGS) out.ll
	$(WASMLD) $(WASMLDFLAGS) --lto-O3 -O3 -o out.wasm out.o
	rm -rf out.wat
	$(W2W) $(W2WFLAGS) out.wasm -o out.wat

debug: $(SRCS) $(HEADERS)
	rm -rf out.ll
	mkdir debug
	$(CC) $(CLINKFLAGS) $(CLINKWARNFLAGS) -O0 $(SRCS)
	$(LINK) --debugger-tune=gdb $(LINKFLAGS) -o out.ll *.ll
	$(LLCC) --debugger-tune=gdb $(LLCCFLAGS) out.ll
	$(WASMLD) $(WASMLDFLAGS) --lto-O0 -O0 -o out.wasm out.o
	rm -rf out.wat
	$(W2W) $(W2WFLAGS) out.wasm -o out.wat

clean:
	rm -rf *.o *.s *.ll out.wat out.wasm