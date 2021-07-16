LFILE = README
IFILE = index

all: knith mv #open 

knith: $(LFILE).Rmd
	echo "rmarkdown::render('$(LFILE).Rmd',output_file='$(LFILE).html')" | R --no-save -q

knitr: $(LFILE).Rmd
	echo "rmarkdown::render('$(LFILE).Rmd',rmarkdown::md_document(variant='gfm'))" | R --no-save -q

mv: $(LFILE).html
	mv $(LFILE).html $(IFILE).html

open: $(IFILE).html
	xdg-open $(IFILE).html &

clean:
	rm -rf *.html README_cache 
