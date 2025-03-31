
SHELL=/bin/sh

SOURCE=pres.wiki
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
pdf: clean $(PRES)
	$(Pzres): $(DEPS)


.PHONY: clean
show: pres
	@$(VIEWER) pres.pdf


clean:
	@rm -f $(generated)

