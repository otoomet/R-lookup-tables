SOURCES = $(wildcard *.rmd)
HTML = $(patsubst %.rmd, %.html, $(SOURCES))

%.md: %.rmd
	Rscript -e "knitr::knit('$<', quiet=FALSE)"

%.html: %.md
	Rscript -e "rmarkdown::render('$<', output_format=\"all\")"

all: $(HTML)

clean:
	rm -vf $(TEX) *.rmd~ && rm -rf metastore_db && rm python_results.csv
# -v : verbose
# -f: ignore non-existent files
