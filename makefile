TEX = main

TIMESTAMP = $(shell date +%Y%m%d-%H%M%S)

BUILDDIR = build
TIMESTAMP = .timestamp

prepare:
	@mkdir -p $(BUILDDIR)
	@timestamp=$$(date +%Y%m%d-%H%M%S); \
	echo $$timestamp > $(TIMESTAMP); \

build: prepare
	pdflatex -synctex=1 -interaction=nonstopmode -output-directory=./ $(TEX).tex 
	
	@if [ -f "$(TEX).acn" ] || [ -f "$(TEX).glo" ]; then \
		makeglossaries -d ./ $(TEX);	\
	fi 

	@if [ -f "$(TEX).bcf" ]; then \
		biber $(TEX); \
	fi 
	
	pdflatex -synctex=1 -interaction=nonstopmode -output-directory=./ $(TEX).tex
	pdflatex -synctex=1 -interaction=nonstopmode -output-directory=./ $(TEX).tex

	@timestamp=$$(cat .timestamp); \
	cp -f $(TEX).pdf $(BUILDDIR)/$${timestamp}_$(TEX).pdf

release: clean build
	@timestamp=$$(cat .timestamp); \
	ln -sf $(BUILDDIR)/$${timestamp}_$(TEX).pdf $(BUILDDIR)/$(TEX).pdf

quick: clean prepare $(TEX).tex
	pdflatex -synctex=1 -interaction=nonstopmode -output-directory=./ $(TEX).tex
	cp -f $(TEX).pdf $(BUILDDIR)/$(TIMESTAMP)\_$(TEX).pdf

clean:
	@rm -f $(TEX).{aux,log,toc,out,bbl,bcf,blg,acn,acr,alg,glg,glo,gls,ilg,ist,lof,lot,log,run.xml,synctex.gz,tex.bbl,tex.blg,fls,fdb_latexmk,timestamp}
	@rm -f .timestamp
	@rm -f $(TEX).pdf

cleanall: clean
	@rm -f $(TEX).pdf
	@rm -rf $(BUILDDIR)
	@rm -rf $(TIMESTAMP)

.PHONY: prepare build release clean cleanall quick