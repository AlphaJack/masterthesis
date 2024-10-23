<!--
# ┌───────────────────────────────────────────────────────────────┐
# │ CONTENTS OF USAGE-THESIS.md                                   │
# ├───────────────────────────────────────────────────────────────┘
# │
# ├──┐USAGE OF THESIS BOOK
# │  ├── OPTIONS AND VARIABLES
# │  ├──┐STRUCTURE
# │  │  ├── COVERS
# │  │  ├── FRONTMATTER, MAINMATTER, BACKMATTER
# │  │  └── SECTIONS
# │  ├──┐CONTENT
# │  │  ├──┐TEXT
# │  │  │  ├── COMMENTS
# │  │  │  └── PLACEHOLDER
# │  │  ├──┐IMAGES
# │  │  │  ├── NORMAL SIZE
# │  │  │  └── BIG SIZE
# │  │  ├──┐TABLES
# │  │  │  └── FORCE POSITIONING
# │  │  ├── LISTS
# │  │  ├── QUOTES
# │  │  ├── CODE
# │  │  ├── ACRONYMS
# │  │  └──┐HYPERLINKS
# │  │     ├── REFERENCES
# │  │     ├── FIGURES, TABLES AND HEADINGS
# │  │     └── FOOTNOTES
# │  └──┐INDIVIDUAL PAGES
# │     ├── TITLE PAGE
# │     ├── DEDICATION
# │     ├── ABSTRACT
# │     ├── ACKNOWLEDGEMENTS
# │     ├── COMMITTEE
# │     ├── COPYRIGHT
# │     ├── TABLE OF CONTENTS
# │     ├── BIBLIOGRAPHY
# │     └── COLOPHON
# │
# └───────────────────────────────────────────────────────────────
-->

# USAGE OF THESIS BOOK

## OPTIONS AND VARIABLES

To set your thesis metadata, colors and logos, edit the file [](/variables.tex)

To load the `masterthesis` class:

```latex
 \documentclass[options]{masterthesis}
```

Valid options are:

- all the default book class options (e.g. `12pt`, `a4paper`, `draft`)
- `twoside` if you want to double-side print your PDF as a two-faced book
- `asymmetric` if you want to single-side print your PDF as a two-faced book (the left side will be empty)
- none of the options above if you want to read your thesis one page at the time, such as ebook or stapled pages
- `wip` to add a draft watermark on each page, and disable aesthetic improvements that would slow down compilation time
- `wip2` to further reduce compilation time

Inside the [Extra](/extra) folder you can see different layout options and choose the best one for you.

## STRUCTURE

### COVERS

These commands will split in half a landscape A3 into two potrait A4.

To add a front cover at the beginning of the document:

```latex
\addFrontCover{pages/cover-digital}
```

To add a back cover at the end of the document:

```latex
\addBackCover{pages/cover-digital}
```

### FRONTMATTER, MAINMATTER, BACKMATTER

To define the frontmatter at the beginning of the book:

```latex
\frontmatter
```

To define the mainmatter at the begin of the first chapter:

```latex
\mainmatter
```

To define the appendix part at the beginning of the first appendix

```latex
\appendix
\part{Appendices}
```

To define the backmatter after the last appendix, before the bibliography:

```
\backmatter
```

### SECTIONS

To add a chapter:

```latex
\chapter{Chapter Title in Title Case}
\startChapter{F}{irst} words
```

These chapters appear as unnumbered in frontmatter, but are still present in the TOC.

To add an unnumbered chapter that does not appear in the TOC:

```latex
\chapter*{Chapter Title in Title Case}
\startChapter{F}{irst} words
```

To add a numbered sections:

```latex
\section{Section Title in Title Case}
\startSection{F}{irst} words
```

The procedure is similar for the other nesting levels:

```latex
\part{Title of part}
\chapter{Title of chapter}
\section{Title of section}
\subsection{Title of subsection}
\subsubsection{Title of subsubsection}
```

## CONTENT

### TEXT

To add text:

```latex
Simply write in sentence case.
Write one sentence per line to make it more readable
   
Paragraphs should be spaced by an empty line between them.
```

To emphasize text:

```latex
The concept of \emph{emphasis} is great
```

To write numbers:

```latex
This number is big: \num{69420666}.
```

#### COMMENTS

To ignore large portions of content without deleting them:

```latex
This text appears

%This text doesn't appear

\begin{ignore}
 This
 text
 doesn't
 appear
 either
\end{ignore}
```

#### PLACEHOLDER

To add a "work in progress" placeholder text:

```latex
\section{To complete}

\placeholder
```

### IMAGES

#### NORMAL SIZE

To add a single image:

```latex
\begin{outerImage}
 \innerImageOne{filename}{Short name}
\end{outerImage}
```

To add two images in the same row:

```latex
\begin{outerImage}
 \innerImageTwoH
 {filename1}{Short name 1}
 {filename2}{Short name 2}
 {labelid}{Short image set name}
\end{outerImage}
```

To add two images on top of each other:

```latex
\begin{outerImage}
 \innerImageTwoV
 {filename1}{Short name 1}
 {filename2}{Short name 2}
 {labelid}{Short image set name}
\end{outerImage}
```

To add three images in the same row:

```latex
\begin{outerImage}
 \innerImageTwoH
 {filename1}{Short name 1}
 {filename2}{Short name 2}
 {filename3}{Short name 3}
 {labelid}{Short image set name}
\end{outerImage}
```

To add three images on top of each other:

```latex
\begin{outerImage}
 \innerImageTwoV
 {filename1}{Short name 1}
 {filename2}{Short name 2}
 {filename3}{Short name 3}
 {labelid}{Short image set name}
\end{outerImage}
```

<!-- %{Long description about \subref{filename1} and \subref{filename2}} -->

#### BIG SIZE

To add a single landscape image that takes a dedicated page, and has a caption on the side:

```latex
\begin{outerImage}
 \innerImageRotated{filename}{Short name}
\end{outerImage}
```

To add a single landscape image that takes a dedicated page, and has a caption and a source specified on the side:

```latex
\begin{outerImage}
 \innerImageRotatedSource{filename}{Short name}{Source}
\end{outerImage}
```

To add a single portrait image that takes a dedicated page, and has a caption below:

```latex
\begin{outerImage}
 \innerImageTall{filename}{Short name}
\end{outerImage}
```

### TABLES

To add a table:

```latex
\begin{outerTable}
 \caption[Short name]{Long description of the table}
 \label{labeltext}
 \begin{innerTable}{colspec={Xlr}}
  Head A  & Head B  & Head C \\
  Cell A1 & Cell B1 &     10 \\
  Cell A2 & Cell B2 &   1000 \\
 \end{innerTable}
\end{outerTable}
```

To reference a cell or row in a table:

```latex
\begin{outerTable}
 \caption[Short name]{Long description of the table}
 \label{labeltext}
 \begin{innerTable}{colspec={lX}}
  Company & Industry \\
  \iddef{C1} & Consulting \\
  \iddef{C2} & Fashion manufacturing \\
 \end{innerTable}
\end{outerTable}

Among the interviewed companies, \idref{C1} gave the most insightful answers.
```

To add a rotated table (landscape):

```latex
\begin{outerTableRotated}
	\caption[Short name]{Long description of the table}
	\label{labeltext}
	\begin{innerTableRotated}{colspec={rX[2]lrX[1]}}
      ID         & Title                           & Authors                        & Year                          & Journal name \\
      A1         & very very very long title       & very long list of authors      & 2024                          & very very very very long journal name \\
      A1         & very very very long title       & very long list of authors      & 2024                          & very very very very long journal name \\
      A1         & very very very long title       & very long list of authors      & 2024                          & very very very very long journal name \\ 
	\end{innerTableRotated}
\end{outerTableRotated}
```

#### FORCE POSITIONING

To force the positioning of all figures and tables before a certain point (e.g. a new section):

```latex
% figure
% table

\FloatBarrier

\section{New Section}
```

### LISTS

To add a numbered list:

```latex
\begin{enumerate}
 \item First level 1
 \begin{enumerate}
  \item Second level 1
  \item Second level 2
  \begin{enumerate}
   \item Third level 1
  \end{enumerate}
 \end{enumerate}
 \item First level 2
\end{enumerate}
```

To add an unnumbered list:

```latex
\begin{itemize}
 \item First level 1
 \begin{itemize}
  \item Second level 1
  \item Second level 2
  \begin{itemize}
   \item Third level 1
  \end{itemize}
 \end{itemize}
 \item First level 2
\end{itemize}
```

To add research questions:

```latex
\begin{questions}
 \item Can we? \label{question-can}
 \item Should we? \label{question-should}
 \item How do we? \label{question-how}
\end{questions}

To answer \ref{question-how}, we do the following.
```

### QUOTES

To add an inline quote:

```
According to nobody, \textquote{Text in quote. This will be an inline quote}.
```

To add a standalone indented quote:

```latex
According to nobody,
\begin{displayquote}
 Text in quote.
 This will be a separate quote
\end{displayquote}
```

### CODE

To add a code block:

```latex
\begin{code}
  code = "this
   is code"
  
  de = germany
\end{code}
```

To add a code snippet:

```latex
We will compare \snippet{R} with \snippet{python}

```

### ACRONYMS

To add a list of acronyms:

```latex
\chapter{List of Acronyms}

% the optional argument should be set to the longest acronym to set the spacing
\begin{acronym}[AI]
 \acro{AI}{Artificial Intelligence}
 \acro{ML}{Machine Learning}
\end{acronym}
```

To use an acronyms:

```latex
We will now understand better the differences between \ac{AI} and \ac{ML}. \Ac{AI} is ...

```

### HYPERLINKS

#### REFERENCES

To cite a reference in your bibliography file with (this style, 2023):

```latex
Paragraph \autocite{KEY} text.
```

To cite a reference in your bibliography file in the middle of the text:

```latex
As seen by \textcite{KEY}, text.
```

#### FIGURES, TABLES AND HEADINGS

To mention a figure, table, or section specifying its type:

```latex
As seen on \cref{target}
```

To mention with a capital first letter:

```latex
\Cref{target} offers an overview of
```

To mention a figure, table, or section specifying its name:

```latex
See \nameref{literature-review} for details.

\section{Sistematic Literature Review}
\label{literature-review}
```

To reference the source of an image or table:

```latex
\begin{outerImage}
 \innerImageOne{filename}{Short name}
 % add this
 \source{\textcite{SOMEONE2023}}
\end{outerImage}
```

#### FOOTNOTES

To add a footnote:

```latex
Paragraph text\footnote{Footnote text}.
```

## INDIVIDUAL PAGES

### TITLE PAGE

To add a title page:

```latex
\input{pages/title}
```

### DEDICATION

To add a dedication:

```latex
\input{pages/dedication}
```

### ABSTRACT

To add an abstract:

```latex
\input{pages/abstract}
```

### ACKNOWLEDGEMENTS

To add an acknowledgements page:

```latex
\input{pages/acknowledgements}
```

### COMMITTEE

To add a signature page for the dissertation committee:

```latex
\input{pages/committee}
```

### COPYRIGHT

To add a copyright page:

```latex
\input{pages/copyright}
```

### TABLE OF CONTENTS

To add table of contents (TOC), list of figures (LOF), list of tables (LOT) and list of acronyms (LOA):

```latex
\input{pages/lists}
```

### BIBLIOGRAPHY

To select a bibliography file, add to the preamble:

```latex
\addbibresource{references.bib}
```

To insert the bibliography, add to the document body:

```latex
\input{pages/bibliography}
```

### COLOPHON

To add a colophon page:

```latex
\input{pages/colophon}
```
