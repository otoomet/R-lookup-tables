SOURCES = $(wildcard *.rmd)
HTML = $(patsubst %.rmd, %.html, $(SOURCES))

%.md: %.rmd
	Rscript -e "knitr::knit('$<', quiet=TRUE)"

%.html: %.md
	Rscript -e "rmarkdown::render('$<', output_format=\"all\")"

all: $(HTML)

clean:
	rm -vf $(TEX) *.rmd~ && rm -rf metastore_db
# -v : verbose
# -f: ignore non-existent files
