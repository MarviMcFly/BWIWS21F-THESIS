TEX = main

TIMESTAMP = $(shell date +%Y%m%d-%H%M%S)

BUILDDIR = build

RELEASE_FILE = .release.version
BUILD_FILE = .build.version

prepare:
	@mkdir -p $(BUILDDIR)
	@touch $(RELEASE_FILE)
	@touch $(BUILD_FILE)

build: prepare
	version=$$(cat $(BUILD_FILE) 2>/dev/null || echo 0); \
	version=$$((10#$${version} + 1)); \
	printf "%03d" $$version > $(BUILD_FILE);
	pdflatex -synctex=1 -interaction=nonstopmode -output-directory=./ $(TEX).tex
	
	@if [ -f "$(TEX).acn" ] || [ -f "$(TEX).glo" ]; then \
		makeglossaries -d ./ $(TEX);	\
	fi

	@if [ -f "$(TEX).bcf" ]; then \
		biber $(TEX); \
	fi
	
	pdflatex -synctex=1 -interaction=nonstopmode -output-directory=./ $(TEX).tex

	@version=$$(cat $(BUILD_FILE) 2>/dev/null || echo 0); \
	cp -f $(TEX).pdf $(BUILDDIR)/b$$version\_$(TEX).pdf

release: clean build
	version=$$(cat $(RELEASE_FILE) 2>/dev/null || echo 0); \
	version=$$((10#$${version} + 1)); \
	printf "%03d" $$version > $(RELEASE_FILE);
	cp -f $(TEX).pdf $(BUILDDIR)/r$version\_$(TEX).pdf

quick: prepare $(TEX).tex
	version=$$(cat $(BUILD_FILE) 2>/dev/null || echo 0); \
	version=$$((10#$${version} + 1)); \
	printf "%03d" $$version > $(BUILD_FILE);
	pdflatex -synctex=1 -interaction=nonstopmode -output-directory=./ $(TEX).tex

	@version=$$(cat $(BUILD_FILE) 2>/dev/null || echo 0); \
	cp -f $(TEX).pdf $(BUILDDIR)/b$$version\_$(TEX).pdf

clean:
	@rm -f $(TEX).{aux,log,toc,out,bbl,bcf,blg,acn,acr,alg,glg,glo,gls,ilg,ist,lof,lot,run.xml,synctex.gz}
	@rm -f $(TEX).pdf

cleanall: clean
	@rm -f $(TEX).pdf
	@rm -rf $(BUILDDIR)

reset: cleanall
	@rm -f $(RELEASE_FILE)
	@rm -f $(BUILD_FILE)

.PHONY: prepare build release clean cleanall cleancounter quick