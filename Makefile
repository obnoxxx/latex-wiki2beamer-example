
SHELL=/bin/sh

BASE := pres
SOURCE := $(BASE).wiki
TEX_SOURCE := $(BASE).tex
TARGET := $(BASE).pdf
PRES_FILES=$(wildcard pres.*)

GENERATED=$(patsubst $(SOURCE),  , $(PRES_FILES))



.SUFFIXES: .tex .pdf .wiki

PRES=pres.pdf


.DEFAULT_GOAL := all




.wiki.tex:
	wiki2beamer $< > $@



.tex.pdf:
	@pdflatex $<
	@pdflatex $<

.PHONY: info

info:
		@echo          source: $(SOURCE)
		@echo          target: $(TARGET)
		@echo generated files: $(GENERATED)


.PHONY: all
all: pdf

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
check:checkmake 

.PHONY: checkmake
checkmake:
	checkmake Makefile

.PHONY: test
	test: check


