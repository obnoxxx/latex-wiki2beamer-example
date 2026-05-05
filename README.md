# latex-wiki2beamer-example
example latex/wiki2beamer presentation


# beamer-example

This project provides example an example to demonstrate how to create nice-looking pdf slide decks with
the [LaTeX](https://www.latex-project.org/) beamer document class. using the wiki2beamer preprocessor

The sorce file https://github.com/obnoxxx/latex-beamer-example/blob/main/pres.wiki has a markdown-like format
nd can be converted to a LaTeX source with the wiki2beamer tool.


This project is similar to its companion projects https://github.com/obnoxxx/latex-doc-example for text documents
and https://github.com/obnoxxx/latex-beamer-example for plain beamer slides.


## Building

On a system (e. g. Linux or MacOS) with LaTeX, wiki2beamer, and GNU make installed, the presentation pdf can be created from the
source file https://github.com/obnoxxx/latex-beamer-example/blob/main/pres.wiki like so:

```console

$ make pdf

```

or equivalently
```console

$ make pres
```

People who do not want to install the LaTeX tools on their system can use the
[buildbox](https://github.com/TheBuildBox/buildbox) project to render the slides in a container with a prebuilt container image.
Example:

```console

$ builbo -l latex -o fedora -b -s "make pres"

```



This assumes that the `builbo` cli from the buildbox project is available in the host's `PATH`


## Viewing

The resulting `pres.pdf` can be viewed  in and presented with  common PDF viewers, e. g. `evince`on Linux and `open` on macOS.


