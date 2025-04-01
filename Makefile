
SHELL=/bin/sh

SOURCE=pres.wiki
TEX_SOURCE=pres.tex
FILES=$(wildcard pres.*)

GENERATED=$(patsubst $(SOURCE),  , $(FILES))


.SUFFIXES: .tex .pdf .wiki

PRES=pres.pdf

DEPS="$(SOURCE) Makefile"




.wiki.tex:
	wiki2beamer $< > $@



.tex.pdf:
	@pdflatex $<
	@pdflatex $<

.PHONY: info

info:
		@echo generated files: $(GENERATED)

.PHONY: pres
pres: pdf
.PHONY: pdf
.PHONY: tex
tex: $(TEX_SOURCE)
$(TEX_SOURCE): $(WIKI_SOURCE)
pdf: clean $(PRES)

	$(PRES): $(TEX_SOURCE)


.PHONY: clean
show: pres
	@$(VIEWER) pres.pdf


clean:
	@rm -f $(generated)

