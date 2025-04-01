
SHELL=/bin/sh

SOURCE=pres.wiki
TEX_SOURCE=pres.tex
PRES_FILES=$(wildcard pres.*)

GENERATED=$(patsubst $(SOURCE),  , $(PRES_FILES))



.SUFFIXES: .tex .pdf .wiki

PRES=pres.pdf





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
	@rm -f $(GENERATED)

.PHONY: all

all: pres


.PHONY: check
check:check.Makefile

.PHONY: check.Makefile
check.Makefile:
	checkmake Makefile

.PHONY: test
	test: check


