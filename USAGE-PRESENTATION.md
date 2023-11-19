<!--
# ┌───────────────────────────────────────────────────────────────┐
# │ CONTENTS OF USAGE-PRESENTATION.md                             │
# ├───────────────────────────────────────────────────────────────┘
# │
# ├──┐USAGE OF THESIS PRESENTATION
# │  ├── STRUCTURE
# │  └──┐CONTENT
# │     ├── SECTIONS
# │     ├──┐TEXT
# │     │  ├── LISTS
# │     │  ├── COLUMNS
# │     │  ├── NOTES
# │     │  ├── PLACEHOLDER
# │     │  └── REFERENCES
# │     ├── IMAGES
# │     └── TABLES
# │
# └───────────────────────────────────────────────────────────────
-->

# USAGE OF THESIS PRESENTATION

## STRUCTURE

To load the class, variables and layout:

```latex
% class
\documentclass[
 % comment out for 4:3
 aspectratio=169,
 % two columns of 0.5 do not exceed 1.0
 onlytextwidth,
 % align slides content to top by default
 t
]{beamer}

% variables
\input{pages/variables}
\title{\thesisTitle}
\author{\authorName}

% layout
\usetheme{masterthesis}
```

To add individual slides:

```latex
\begin{document}

% title page
\addTitleSlide

% table of contents
\addTocSlide

% main content slides
\input{chapters/slides}

% thank you
\addThankYouSlide

\end{document}
```

## CONTENT

### SECTIONS

To organize the presentation in sections:

```latex
\section{Title of first section}

% add frames belonging to section 1 here
```

### TEXT

To add a simple slide:

```latex
\begin{frame}{Title of this slide}
 This is normal text. This is \alert{important text}.
 \begin{block}{Definition}
  It is what it is.
 \end{block}
\end{frame}
```

#### LISTS

To add an unnumbered list:

```latex
\begin{frame}{Unnumbered list}
 \begin{itemize}
  \item First level
  \begin{itemize}
   \item Second level
  \end{itemize}
  \item First level
 \end{itemize}
\end{frame}
```

To add a numbered list:

```latex
\begin{frame}{Numbered list}
 \begin{enumerate}
  \item First level
  \begin{enumerate}
   \item Second level
  \end{enumerate}
  \item First level
 \end{enumerate}
\end{frame}
```

To make the items appear one by one (and stay):

```latex
\begin{frame}{Unnumbered progressive list}
 \begin{itemize}
  \item<1-> First item
  \item<2-> Second item
  \item<3-> Third item
 \end{itemize}
\end{frame}
```

To make the items appear one by one (and then disappear):

```latex
\begin{frame}{Unnumbered focused list}
 \begin{itemize}
  \item<1> First item
  \item<2> Second item
  \item<3> Third item
 \end{itemize}
\end{frame}
```

#### COLUMNS

To add a two-columns slide:

```latex
\begin{frame}{Two columns}
 \begin{outerColumns}
  \innerColumnsTwo{
   Text of the first column
  }{
   Text of the second column
  } 
 \end{outerColumns}
\end{frame}
```

To add a three-columns slide:

```latex
\begin{frame}{Three columns}
 \begin{outerColumns}
  \\innerColumnsThree{
   Text of the first column
  }{
   Text of the second column
  }{
   Text of the third column
  } 
 \end{outerColumns}
\end{frame}
```

To add a four-columns slide:

```latex
\begin{frame}{Four columns}
 \begin{outerColumns}
  \innerColumnsFour{
   Text of the first column
  }{
   Text of the second column
  }{
   Text of the third column
  }{
   Text of the four column
  } 
 \end{outerColumns}
\end{frame}
```


#### NOTES

To add a note that does not appear in the default slideshow, but on a separate note page:

```latex
\begin{frame}{Title of my frame}
 This text will appear in the presentation. \note{Explain why this note text will not appear}
\end{frame}
```

To generate a PDF with all notes of the presentation, after `\documentclass[...]{beamer}` add the following:

```latex
\setbeameroption{show only notes}
```

#### PLACEHOLDER

To add a placeholder slide:

```latex
\addPlaceholderSlide{ADD CONCLUSIONS}
```

#### REFERENCES

To enable references to others' works, make sure you are compiling the presentation with LuaLaTeX, biber and LuaLaTex again in this order (see Makefile).

Then, at the beginning of the document add the following:

```latex
\addbibresource{pages/references.bib}
```

To reference someone:

```latex
\begin{frame}{Title of this slide}
 This is normal text according to \textcite{SOMEONE2022}.
 This is not normal text \autocite{SOMEONEELSE2023}.
\end{frame}
```

To reference someone manually without using `\autocite` or `\textcite`:

```latex
\begin{frame}{Title of this slide}
 \begin{block}{Definition of X according to Ethan et al. (2021)}
  I don't know what X is
 \end{block}
 \nocite{ETHAN2021}
\end{frame}
```

To add a page with all the references:

```latex
\addReferencesSlide
```

### IMAGES

To add an image:

```latex
\begin{frame}[c]{Vertically-centered, all-frame image}
 \begin{outerImage}
  \innerImageOne{image-name}{Image caption}
 \end{outerImage}
\end{frame}
```

To add an image to the left of text:

```latex
\begin{frame}{Image Two}
 \begin{outerColumns}
  \innerColumnsTwo{
   \begin{outerImage}
    \innerImageOne{image-name}{Image caption}
   \end{outerImage}
  }{
   Other text
  } 
 \end{outerColumns}
\end{frame}
```

To add a series of images that replace each other:

```latex
\begin{frame}{Evolution of X}
 \begin{outerImage}
  \begin{overprint}
   \onslide<1>\innerImageOne{image-1}{X in 2000}
   \onslide<2>\innerImageOne{image-2}{X in 2020}
  \end{overprint}
 \end{outerImage}
\end{frame}
```

### TABLES

To add a table:

```latex
\begin{frame}{Table}
 \begin{outerTable}
  \caption{caption}
  \begin{innerTable}{lrr}
   Treatments  & Response 1 & Response 2\\
   Treatment 1 & 0.0003262 & 0.562 \\
   Treatment 2 & 0.0015681 & 0.910 \\
   Treatment 3 & 0.0009271 & 0.296 \\
  \end{innerTable}
 \end{outerTable}
\end{frame}
```
