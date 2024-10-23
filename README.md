<!--
// ┌───────────────────────────────────────────────────────────────┐
// │ Contents of README.md                                         │
// ├───────────────────────────────────────────────────────────────┘
// │
// ├──┐Masterthesis
// │  ├── Final results
// │  ├── Requirements
// │  ├──┐File structure
// │  │  ├── Thesis
// │  │  ├── Presentation
// │  │  └── Other files
// │  ├── PDF generation
// │  └── Content editing
// │
// └───────────────────────────────────────────────────────────────
-->

# Masterthesis

An elegant LaTeX template for your thesis and presentation

## Final results

Sane typesetting standards, drop caps and a touch of color make the reading more enjoyable, both on screens and paper:

<p align="middle">
  <img align="top" src="/example/picture-digital-inside.png" width="32%"/>
  <img align="top" src="/example/picture-printed-inside.jpeg" width="60%"/>
</p>  

100% of this template users graduated with the highest honors:

![](/example/picture-printed-outside.jpeg)
  
The simplicity of the accompanying presentation will keep the audience focused:

![](example/picture-digital-presentation.png)

Find example PDFs inside the [example](/example) folder

## Requirements

- a comprehensive [LaTeX](https://www.latex-project.org/) distribution such as [TeXLive](https://tug.org/texlive/) (to load required packages)
- [`biber`](https://biblatex-biber.sourceforge.net/) (to build the bibliography)
- a LaTeX or text editor (to edit files)
- [`make`](https://www.gnu.org/software/make/manual/make.html) (to start compilation workflows, optional)
- [`TeXtidote`](https://sylvainhalle.github.io/textidote/) for spellchecking (optional)

## File structure

### Thesis

These files can be used to generate `thesis.pdf`

```bash
├── chapters/                       # folder for structured document content
│   └── 1.tex                       #     content of first chapter
├── pages/                          # folder for single pages, lists, references and variables
│   ├── acknowledgements.tex        #     people that have professionally helped and supported you
│   ├── acronyms.tex                #     list of acronyms
│   ├── bibliography.tex            #     layout of bibliography
│   ├── colophon.tex                #     notes about typesetting
│   ├── committee.tex               #     empty page for signatures
│   ├── copyright.tex               #     simple copyright notice
│   ├── dedication.tex              #     dedication to someone special
│   ├── lists.tex                   #     layout of content, list of figures, list of tables, etc.
│   ├── placeholder.tex             #     standard placeholder text
│   ├── references.bib              #     bibtex database of bibliographical references
│   ├── title.tex                   #     layout of title
│   └── variables.tex               #     contains university, author and thesis details
├── pictures/                       # folder for pictures
├── masterthesis.cls                # layout of thesis document
└── thesis.tex                      # main structure of the thesis document
```

### Presentation

These files are used to generate `presentation.pdf`

```bash
├── chapters/                       # folder for structured document content
│   └── slides.tex                  #     content of slides
├── pages/                          # folder for single pages, lists, references and variables
│   ├── references.bib              #     bibtex database of bibliographical references
│   └── variables.tex               #     contains university, author and thesis details
├── beamerthememasterthesis.sty     # layout of presentation
└── presentation.tex                # main structure of the presentation
```

### Other files

Other files have many purposes:

```bash
├── examples/                       # folder containing example PDF outputs
├── extra/                          # folder for files that generate other PDFs
│   ├── digital-cover.tex           #     layout of cover for digital reading
│   ├── part.tex                    #     quickly compile a part of the content
│   ├── printed-cover.tex           #     layout of front cover for relief printing
│   └── printed-spine.tex           #     layout of cover spine for relief printing
├── pages/                          # folder for single pages, lists, references and variables
│   └── words.txt                   #     dictionary of new words to ignore while performing the spellcheck
├── .gitignore                      # prevents git from saving temporary files
├── .hidden                         # prevents many linux file managers from showing temporary files
├── .textidote                      # spellcheck options
├── LICENSE                         # license file
├── Makefile                        # allows to build the thesis via `make` commands
├── README.md                       # explain objective
├── USAGE-PRESENTATION.md           # explain usage of presentation
└── USAGE-THESIS.md                 # explain usage of thesis
```

If needed, files inside [extra](/extra) should be copied to the main folder and run with LuaLaTeX:

```bash
lualatex part.tex
```

## PDF generation

There are three ways to generate the PDFs:

- `make`
- manually running the commands in [Makefile](/Makefile) from your shell
- using your LaTeX editor features (make sure it is using LuaLaTeX)

Here is  a list of the most common `make` commands:

```bash
 # generate thesis
make thesis

 # generate presentation
make presentation

 # generate an HTML report of latex or grammar mistakes
make spellcheck

 # deletes temporary files
make clean
```

## Content editing

To know what macros to use in your main thesis document, see [USAGE-THESIS.md](/USAGE-THESIS.md).
For the presentation, see [USAGE-PRESENTATION.md](/USAGE-PRESENTATION.md)
