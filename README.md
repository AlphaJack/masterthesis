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

An elegant [LaTeX](https://www.latex-project.org/) template for your thesis and presentation.

## Final results

Sane typesetting defaults, drop caps and a touch of color make the reading more enjoyable, both on screens and paper:

<p align="middle">
  <img align="top" src="/example/picture-digital-inside.png" width="32%"/>
  <img align="top" src="/example/picture-printed-inside.jpeg" width="60%"/>
</p>  

Ideal for every major:

![](/example/picture-printed-outside.jpeg)
  
The simplicity of the accompanying presentation will keep the audience focused:

![](example/picture-digital-presentation.png)

Find example PDFs inside the [example](/example) folder.

## Requirements

To use this template, you will need:

- a comprehensive LaTeX distribution such as [MiKTeX](https://miktex.org/) (for Windows), [MacTeX](https://tug.org/mactex/) (for MacOS), or [TeXLive](https://tug.org/texlive/) (for Linux)
- a LaTeX or code editor, like [TeXStudio](https://www.texstudio.org/)
- a reference manager like [Jabref](https://www.jabref.org/)
- [`make`](https://www.gnu.org/software/make/manual/make.html) to start compilation workflows ([Windows installation steps](https://stackoverflow.com/a/32127632))

Once you installed them, clone this repo or extract its [.zip archive](https://github.com/AlphaJack/masterthesis/archive/refs/heads/master.zip).

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
├── masterthesis.cls                # layout of the thesis document
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
├── .gitignore                      # prevents git from saving temporary files
├── .hidden                         # prevents many linux file managers from showing temporary files
├── LICENSE                         # license file
├── Makefile                        # allows to build the thesis via `make` commands
├── README.md                       # explain objective
├── USAGE-PRESENTATION.md           # explain usage of presentation
└── USAGE-THESIS.md                 # explain usage of thesis
```

If needed, files inside [extra](/extra) should be copied to the main folder and run with LuaLaTeX:

```bash
#
make part
```

## PDF generation

There are three ways to generate the PDFs:

- `make`
- manually running the commands in [Makefile](/Makefile) from your shell
- using your LaTeX editor features (make sure it is using LuaLaTeX)

Here is  a list of the most useful `make` commands:

```bash
 # generate covers
make cover

 # generate thesis
make thesis

 # generate presentation
make presentation

 # deletes temporary files
make clean
```

## Content editing

To know what macros to use in your main thesis document, see [USAGE-THESIS.md](/USAGE-THESIS.md).
For the presentation, see [USAGE-PRESENTATION.md](/USAGE-PRESENTATION.md)
