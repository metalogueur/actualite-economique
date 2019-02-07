# actuecon : Journal Article Templates package for _L'Actualité économique_

This package has been created to provide authors with LaTeX templates
to write journal articles for [_L'Actualité économique_](http://expertise.hec.ca/actualiteeconomique/).

## License

Copyright 2018-2019 HEC Montréal

This work may be distributed and/or modified under the
conditions of the LaTeX Project Public License, either version 1.3c
of this license or (at your option) any later version.
The latest version of this license is in
<https://www.latex-project.org/lppl/lppl-1-3c.txt>
and version 1.3c or later is part of all distributions of LaTeX
version 2008/05/04 or later.

This work has the LPPL maintenance status `maintained'.

The Current Maintainer of this work is Benoit Hamel
<benoit.2.hamel@hec.ca>.

This work consists of the files actuecon.cls, template-en.tex,
template-fr.tex, documentation-en.tex, documentation-fr.tex
and the derived files documentation-en.pdf and documentation-fr.pdf.

## Included files

The package comes with the following files:

* actuecon.cls : document class file
* bibliographie.bib : references file
* econometrica.bst : english version of the bibliography style file
* econometrica-fr.bst : french version of the bibliography style file
* template-en.tex : english template file
* template-fr.tex : french template file
* doc/documentation-en.pdf : english version of the package documentation
* doc/documentation-fr.pdf : french version of the package documentation
* doc/documentation-en.tex : english version of the documentation source
* doc/documentation-fr.tex : french version of the documentation source

## Usage

Using the templates is pretty straightforward :

* You write your article in one of the template.tex files depending on
  the language;
* You insert your references in BibTeX format in the bibliographie.bib file;
* You save all your graphics and images in the img/ folder.

When writing your article, please follow these guidelines:

* Do not modify the options in the \documentclass command.
* Do not modify the source code in the actuecon.cls file.
* Make sure you do not reload already preloaded packages in your template.
* Do not override the preloaded packages' options.

For complete instructions on how to use this package, please read its
documentation.

## Bug report
Bug reports and feature requests can be posted on the package's
[official repository's issue page](https://github.com/metalogueur/actualite-economique/issues).