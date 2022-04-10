ASYS = $(wildcard *.asy)
ASY_PNGS = $(patsubst %.asy, %.png, $(ASYS))

## run in parallel using 50% of available threads
PARALLEL := $(shell expr $(shell nproc) / 2 )
$(info using $(PARALLEL)-fold parallelism)
MAKEFLAGS += -j$(PARALLEL)

all: $(ASY_PNGS)

%.png: %.asy
	asy -f png $<
