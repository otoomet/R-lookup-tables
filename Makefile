SOURCES = $(wildcard *.rmd)
HTML = $(patsubst %.rmd, %.html, $(SOURCES))
ASYS = $(wildcard asymptote/*.asy)
ASY_PNGS = $(patsubst %.ASY, %.PNG, $(ASYS))

## run in parallel using 50% of available threads
PARALLEL := $(shell expr $(shell nproc) / 2 )
$(info using $(PARALLEL)-fold parallelism)
MAKEFLAGS += -j$(PARALLEL)

%.md: %.rmd
	Rscript -e "knitr::knit('$<', quiet=FALSE)"

%.html: %.md
	Rscript -e "rmarkdown::render('$<', output_format=\"all\")"

%.png: %.asy
	asy -f png $<

asymptote.html: asymptote.md $(ASY_PNGS)

all: $(HTML)

clean:
	rm -vf $(TEX) *.rmd~ && rm -rf metastore_db && rm python_results.csv
# -v : verbose
# -f: ignore non-existent files
