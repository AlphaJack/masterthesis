% ################################################################ LICENSE
%
% masterthesis
%
% Copyright >= 2023 Jack Coleman
%
% This work may be distributed and/or modified under the conditions of
% the LaTeX Project Public License, either version 1.3c of this license
% or (at your option) any later version. The latest version of this
% license is in
%    http://www.latex-project.org/lppl.txt
% and version 1.3c or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
%
% The Current Maintainer of this work is Jack Coleman.
%
% This work consists of the files present in the repo.
%
% See README.md for a detailed list of files and their usage
%
% See LICENSE for a copy of the license
%
% ################################################################ CONTENTS

% ┌───────────────────────────────────────────────────────────────┐
% │ CONTENTS OF masterthesis.cls                                  │
% ├───────────────────────────────────────────────────────────────┘
% │
% ├── LICENSE
% ├── CONTENTS
% ├──┐CLASS
% │  ├── TOGGLES
% │  ├── OPTIONS
% │  └── DEFAULTS
% ├── ENGINE
% ├── PACKAGES
% ├──┐COMMANDS
% │  ├── TEXT
% │  ├── TABLES
% │  └──┐IMAGES
% │     ├──┐SMALL SIZE
% │     │  ├── SINGLE IMAGE
% │     │  ├── HORIZONTALLY ALIGNED IMAGES
% │     │  └── VERTICALLY ALIGNED IMAGES
% │     └──┐LARGE SIZE
% │        ├── HORIZONTAL ORIENTATION
% │        └── VERTICAL ORIENTATION
% ├──┐STYLE
% │  ├── TOC DEPTH
% │  ├──┐GEOMETRY
% │  │  ├── COVER
% │  │  └──┐BODY
% │  │     ├── TWOSIDE
% │  │     ├── ASYMMETRIC
% │  │     ├── ONESIDE
% │  │     └── GLOBAL
% │  ├── LENGTHS
% │  ├── ACRONYM
% │  ├── CAPTION
% │  ├──┐CSQUOTES
% │  │  ├── GLOBAL
% │  │  └── BLOCK
% │  ├── XCOLORS
% │  ├── EMPTYPAGE
% │  ├──┐ENUMITEM
% │  │  ├── GLOBAL
% │  │  ├── ENUMERATE
% │  │  ├── ITEMIZE
% │  │  └── RESEARCH QUESTIONS
% │  ├──┐FANCYHDR
% │  │  ├── DEFINING MARKS
% │  │  ├──┐DEFINING STYLES
% │  │  │  ├── FRONTMATTER
% │  │  │  ├── MAIN MATTER
% │  │  │  └── CHAPTER PAGES
% │  │  ├── DEFINING RULES
% │  │  └── APPLYING RULES
% │  ├── FLOATBARRIER
% │  ├── FONTSPEC
% │  ├──┐FOOTNOTES
% │  │  ├── XCOLOR
% │  │  ├── FOOTMISC
% │  │  └── FOOTNOTEBACKREF
% │  ├── HYPERREF
% │  ├── LETTRINE
% │  ├── LSTLISTING
% │  ├── NOINDENTAFTER
% │  ├── SIUNITX
% │  ├── TABULARRAY
% │  ├──┐TITLESEC
% │  │  ├── FORMAT
% │  │  └── SPACING
% │  ├── TITLETOC
% │  ├── TOCBIBIND
% │  ├── TODONOTES
% │  ├── TOTALCOUNT
% │  ├── ZREF-CLEVER
% │  ├── WATERMARK
% │  └── WIP2 CLASS OPTION
% ├──┐PAGES
% │  ├── COVER
% │  └── PLACEHOLDER
% │
% └───────────────────────────────────────────────────────────────

% ################################################################ CLASS

\NeedsTeXFormat{LaTeX2e}[2022-11-01]
\ProvidesClass{masterthesis}[2024.10.19 Modern LuaLaTeX thesis class]

% ################################ TOGGLES

% used for toggles
\RequirePackage{etoolbox}

% according to your desired output (book or PDF), and your book layout (content on both pages or only on the right page),
% this class provides two toggles to activate three modes:
%
% a PDF for digital reading or stapled pages that you read one page at the time,
% and thus benefit from simmetric margins when scrolling
% this is the default mode
%
% ╔═══════════╗
% ║ HEADER    ║
% ║ --------- ║
% ║ text text ║
% ║ text text ║
% ║ text text ║
% ║ text text ║
% ║     3     ║
% ╚═══════════╝
%
% a normal book that is printed on both sides
% this mode requires the "twoside" option in the \documentclass command
%
\newtoggle{twoside}
%
% ╔═══════════╤═══════════╗
% ║ HEADER    │    HEADER ║
% ║ --------- │ --------- ║
% ║ text text │ text text ║
% ║ text text │ text text ║
% ║ text text │ text text ║
% ║ text text │ text text ║
% ║ 2         │         3 ║
% ╚═══════════╧═══════════╝
%
% a book that is printed on one side, and when binsws has content only on the right side
% may be required by your institution or to reach the minimum number of pages needed for binding
% this mode requires the "asymmetric" option in the \documentclass command
%
\newtoggle{asymmetric}
%
% ╔═══════════╤═══════════╗
% ║           │    HEADER ║
% ║           │ --------- ║
% ║           │ text text ║
% ║           │ text text ║
% ║           │ text text ║
% ║           │ text text ║
% ║           │         3 ║
% ╚═══════════╧═══════════╝

% use this class options to add a draft watermark at the top of each page
% and reduce compilation time by not loading certain aesthetic commands
% but remember to remove it fwhen you compile the final version of your thesis
% we are not using the standard "draft" class option as we still want to see images in early thesis versions
\newtoggle{wip}

% use this class option to further reduce compilation time,
% but consider it will redefine some commands with dummy versions
% search for "\iftoggle{wip2}" below to get the complete list of affected commands
\newtoggle{wip2}

% ################################ OPTIONS

\DeclareOption{oneside}{
 \togglefalse{twoside}
 \togglefalse{asymmetric}
}
\DeclareOption{twoside}{
 \toggletrue{twoside}
 \togglefalse{asymmetric}
}
\DeclareOption{asymmetric}{
 \togglefalse{twoside}
 \toggletrue{asymmetric}
}
\DeclareOption{wip2}{
 \toggletrue{wip2}
}
\DeclareOption{wip}{
 \toggletrue{wip}
}
% if someone wants to use the draft mode, we also enable the other draft options
\DeclareOption{draft}{
 \toggletrue{wip2} 
 \toggletrue{wip}
}

% ################################ DEFAULTS

% pass all unknown options to the book class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

% process all invoked options, activating the relative toggles
\ProcessOptions\relax

% printed layout, openright only matters for books printed on both sides
\iftoggle{twoside}{
 \PassOptionsToClass{twoside,openright}{book}
}{
 \PassOptionsToClass{oneside,openany}{book}
}

% load the book class
\LoadClass{book}

% ################################################################ ENGINE

% lualatex check
% https://tex.stackexchange.com/a/6716/213962
\ifcsname directlua\endcsname
 % then lualatex is being used
\else
 \ClassError{masterthesis}{LuaLaTeX is not being used}{Use LuaLaTeX, not XeLaTeX or pdfLaTeX!}
 \stop
\fi

% ################################################################ PACKAGES

% loaded in alphabetical order, except when load order is important

% localized terms, hyphenation and typographic rules
\RequirePackage[italian,american]{babel}

% break long urls
% must be loaded before biblatex
\RequirePackage{xurl}

% bibliography generator powered by biber
% must be loaded after babel
\RequirePackage[backend=biber,backref,ibidtracker=constrict,parentracker=true,sorting=nyt,style=apa]{biblatex}

% customized quotes
% required by babel
\RequirePackage{csquotes}

% localized date in watermark
\RequirePackage[style=iso]{datetime2}

% blind text
\iftoggle{wip}{\RequirePackage{lipsum}}{}

% create proper empty pages
\iftoggle{twoside}{\RequirePackage{emptypage}}{}

% custom itemize and enumerate lists
\RequirePackage{enumitem}

% header and footer
\RequirePackage{fancyhdr}

% fonts
\RequirePackage{fontspec}

% hanged and spaced footnotes
\iftoggle{wip}{}{\RequirePackage[hang]{footmisc}}

% better footnote punctuation kerning and comma separator for multiple footnotes
% proper usage: text\footnote{foot text}.
\iftoggle{wip}{}{\RequirePackage{fnpct}}

% layout and margins
\RequirePackage{geometry}

% better word spacing and typographic improvements
% must be loaded before setspace
% it doubles compilation time, so it's only loaded for the final version of the thesis
\iftoggle{wip}{}{\RequirePackage{microtype}}

% line spacing
% must be loaded before hyperref for correct footnote links
% must be loaded before footmisc for correct spacing
\RequirePackage{setspace}

% format chapter and section titles
% must be loaded before hyperref 
\RequirePackage[newparttoc]{titlesec}

% format toc
% must be loaded before hyperref
% must be loaded after titlesec
\RequirePackage{titletoc}

% faster compilation and bookmark creation, loads hyperref
% still requires two passes after biber, but it's way faster
\RequirePackage{bookmark}

% math font
\RequirePackage{amsmath}
\RequirePackage[math-style=ISO,bold-style=ISO]{unicode-math}
\iftoggle{wip}{}{\RequirePackage{lualatex-math}}

% output also the reference type when cross referencing (Figure 1.1 instead of 1.1)
% must be loaded after hyperref
% must be loaded after amsmath and glossaries
% replaces cleveref
\RequirePackage{zref-clever}

% list of acronyms
% must be loaded after hyperref and cleveref/zref-clever
\RequirePackage[printonlyused,withpage]{acronym}

% backref links in footnotes
% must be loaded after hyperref
\iftoggle{wip}{}{\RequirePackage{footnotebackref}}

% large first letter (drop cap) at the beginning of chapters or sections
\RequirePackage{lettrine}

% better line breaking
% slow down compilation
\iftoggle{wip}{}{\RequirePackage{linebreaker}}

% format monospaced text, used through lstlisting environment
\RequirePackage{listings}

% prevent line breaks in lettrine and code blocks
\RequirePackage{needspace}

% remove indentation after environments
\RequirePackage{noindentafter}

% allow to insert white pages before chapters and parts
\iftoggle{twoside}{\RequirePackage{nextpage}}{}

% control float positioning via \FloatBarrier
\RequirePackage{placeins}

% hyphenation in table cells
\RequirePackage{ragged2e}

% rotated tables
\RequirePackage{rotating}

% format numbers
\RequirePackage{siunitx}

% easily place and label more pictures in the same figure or table, loads caption
\RequirePackage{subcaption}

% better tables
\RequirePackage{tabularray}

% toc, lof and lot in toc
\RequirePackage{tocbibind}

% add todo in the document and collect them in a dedicated list, loads tikz
\iftoggle{wip}{
 \RequirePackage[textwidth=15mm]{todonotes}
}{
 \RequirePackage{tikz}
}

% store the total number of tables and figures
% used to display list of tables and figures only if they are effectively present
\RequirePackage{totalcount}

% colors
\RequirePackage{xcolor}

% add and splits cover from external PDF
% must be loaded after xcolor
\RequirePackage{pdfpages}

% resize images if they exceed size
% must be placed after xcolor and pgfornament
\RequirePackage{adjustbox}

% ################################################################ COMMANDS

% ################################ TEXT

% empty \lipsum[1] if package is not loaded
\ProvideDocumentCommand{\lipsum}{o}{}

% environment used to comment out many lines of code
\NewDocumentEnvironment{ignore}{+b}% +=multiple paragraphs in body, b=body in #1
{}% before
{}% after

% used to emphasize text in a paragraph using the italic font
\renewcommand{\emph}[1]{\textit{#1}}

% used to emphasize text at the beginning of a list, using the bold font and a colon
\newcommand{\startItem}[1]{\textbf{#1:}}

% used to emphasize technical terms, using the monospaced font
\newcommand{\snippet}[1]{\lstinline{#1}}

% ################################ TABLES

% define a cell in a table, useful for IDs
\newcommand{\iddef}[1]{\Hy@raisedlink{\hypertarget{#1}{}}#1}

% reference a cell in a table, useful for IDs
\newcommand{\idref}[1]{\hyperlink{#1}{#1}}

% ################################ IMAGES

% images can be added using an environment (outerImage) to wrap a layout command (innerImageOne, ...)

% outerImage is a figure environment with
% - float positioning with preference top > bottom > dedicated page
% - centered content

\newenvironment{outerImage}{
 \begin{figure}[htbp]
  \centering
  }{
 \end{figure}
}

% ################ SMALL SIZE

% these images are positioned in a normal page with text below or above them
% always use these commands inside a outerImage envionment

% ######## SINGLE IMAGE

\newcommand{\innerImageOne}[2]{
 % arguments: 1 image id (no spaces), 2 image name
 % not using captionbox as caption text starts from image, which can be less than \figuremaxwidth long
 \adjustimage{width=\figuremaxwidth,max height=\figuremaxheight}{#1}
 \caption{#2}
 \label{#1}
}

% ######## HORIZONTALLY ALIGNED IMAGES

\newcommand{\innerImageTwoH}[6]{
 % arguments: 1 figure id (no spaces), 2 figure short name, 3 figure long description caption, 4 left image name (no spaces), 5 left image caption text, 6 right image name (no spaces), 7 right image caption text
 % remove \centering if most subcaptions are more than one line long
 \subcaptionbox{\centering #2\label{#1}}{\adjustimage{width=0.48\figuremaxwidth,max height=\figuremaxheight}{#1}}%
 \hfill
 \subcaptionbox{\centering #4\label{#3}}{\adjustimage{width=0.48\figuremaxwidth,max height=\figuremaxheight}{#3}}%
 %\caption[#6]{#6. #7}
 \caption{#6}
 \label{#5}
}

\newcommand{\innerImageThreeH}[8]{
 % arguments: 1 figure id (no spaces), 2 figure short name, 3 figure long description caption, 4 left image name (no spaces), 5 left image caption text, 6 right image name (no spaces), 7 right image caption text
 % remove \centering if most subcaptions are more than one line long
 \subcaptionbox{\centering #2\label{#1}}{\adjustimage{width=0.32\figuremaxwidth,max height=\figuremaxheight}{#1}}%
 \hfill
 \subcaptionbox{\centering #4\label{#3}}{\adjustimage{width=0.32\figuremaxwidth,max height=\figuremaxheight}{#3}}%
 \hfill
 \subcaptionbox{\centering #6\label{#5}}{\adjustimage{width=0.32\figuremaxwidth,max height=\figuremaxheight}{#5}}%
 \caption{#8}
 \label{#7}
}

% ######## VERTICALLY ALIGNED IMAGES

\newcommand{\innerImageTwoV}[6]{
 % arguments: 1 figure id (no spaces), 2 figure short name, 3 figure long description caption, 4 top image name (no spaces), 5 top image caption text, 6 bottom image name (no spaces), 7 bottom image caption text
 % remove \centering if most subcaptions are more than one line long
 \subcaptionbox{\centering #2\label{#1}}{\adjustimage{width=\figuremaxwidth,max height=\figuremaxheight}{#1}}%
 \vspace{\baselineskip}
 \subcaptionbox{\centering #4\label{#3}}{\adjustimage{width=\figuremaxwidth,max height=\figuremaxheight}{#3}}%
 %\caption[#6]{#6. #7}
 \caption{#6}
 \label{#5}
}

\newcommand{\innerImageThreeV}[8]{
 % arguments: 1 figure id (no spaces), 2 figure short name, 3 figure long description caption, 4 left image name (no spaces), 5 left image caption text, 6 right image name (no spaces), 7 right image caption text
 % remove \centering if most subcaptions are more than one line long
 \subcaptionbox{\centering #2\label{#1}}{\adjustimage{width=\figuremaxwidth,max height=8\baselineskip}{#1}}%
 \vspace{\baselineskip}
 \subcaptionbox{\centering #4\label{#3}}{\adjustimage{width=\figuremaxwidth,max height=8\baselineskip}{#3}}%
 \vspace{\baselineskip}
 \subcaptionbox{\centering #6\label{#5}}{\adjustimage{width=\figuremaxwidth,max height=8\baselineskip}{#5}}%
 \caption{#8}
 \label{#7}
}

% ################ LARGE SIZE

% these images are positioned in a dedicated page
% always use these commands inside a outerImage envionment

% ######## HORIZONTAL ORIENTATION

% long landscape images, you need to rotate your head or book
% https://tex.stackexchange.com/a/57531/213962
\newcommand{\innerImageRotated}[2]{
 % arguments: 1 image id (no spaces), 2 image name
 \begin{adjustbox}{
   addcode={\begin{minipage}{\figuremaxheightrotated}}{\caption{#2}\label{#1}\end{minipage}},
   rotate=90,
   %textareacenter
  }
  % using \adjincludegraphics because \adjustimage throws error
  % should be a bit less than textwidth, since there is also the caption
  \adjincludegraphics[
   % bad results if \textheight entirely
   width=\figuremaxheightrotated,
   % leave space for caption and space between
   max height=\textwidth-2\baselineskip
  ]{#1}
 \end{adjustbox}
}

% long landscape images with source, use inside outerImage
\newcommand{\innerImageRotatedSource}[3]{
 % arguments: 1 image id (no spaces), 2 image name, 3 source
 \begin{adjustbox}{
   addcode={\begin{minipage}{\figuremaxheightrotated}}{\caption{#2}\label{#1}\source{#3}\end{minipage}},
   rotate=90,
   %textareacenter
  }
  \adjincludegraphics[
   width=\figuremaxheightrotated,
   max height=\textwidth-4\baselineskip
  ]{#1}
 \end{adjustbox}
}

% ######## VERTICAL ORIENTATION

% tall portrait images
\newcommand{\innerImageTall}[2]{
 % arguments: 1 image id (no spaces), 2 image name
 \adjustimage{width=\figuremaxwidth,max height=\textheight-2\baselineskip}{#1}
 \caption{#2}
 \label{#1}
}

% ################################################################ STYLE

% ################################ TOC DEPTH

% possible section separators
\newcommand{\headingLevels}{4}
\setcounter{secnumdepth}{\headingLevels}

% sections visible in toc
\setcounter{tocdepth}{\headingLevels}

% sections opened in PDF bookmarks
\bookmarksetup{
 numbered,
 open,
 openlevel=1
}

% ################################ GEOMETRY

% must be placed before setting lengths and configuring fancyhdr

% \geometry papersize or paperwidth have no effect here
% if needed, \geometry{papersize={209.6mm,279.4mm}} should be used in thesis.tex preamble, outside of the class file

\geometry{
 %showframe,
 heightrounded
}

% margins are stored in a variable so they can be also read by /pages/title.tex
% the same names are used for /contrib/cover.tex and /contrib/cover-bw.tex
\newlength{\outermargin}
\newlength{\innermargin}
\newlength{\abovemargin}% \topmargin is already defined
\setlength{\outermargin}{40mm}
\setlength{\innermargin}{30mm}
\setlength{\abovemargin}{40mm}

% ################ COVER

\newgeometry{
 top=\abovemargin,
 right=\innermargin,
 bottom=\abovemargin,
 left=\innermargin,
}

\savegeometry{CoverPage}

% ################ BODY

% ######## TWOSIDE

% use different margins for odd and even pages if two sides is specified
\iftoggle{twoside}{
 \newgeometry{
  top=\abovemargin,
  outer=\outermargin,
  bottom=\abovemargin,
  inner=\innermargin,
  %includehead, skip length before head
  %includefoot  skip length after foot
 } % end twoside geometry
}{ % end twoside true
% ######## ASYMMETRIC
 \iftoggle{asymmetric}{
  \newgeometry{
   top=\abovemargin,
   right=\outermargin,
   bottom=\abovemargin,
   left=\innermargin
  } % end asymmetric geometry
 }{ % end asymmetric true
% ######## ONESIDE
  \newgeometry{
   top=\abovemargin,
   right=\innermargin,
   bottom=\abovemargin,
   left=\innermargin
  }% end oneside geometry
 }% end asymmetric false
}% end twoside false

% ######## GLOBAL

\savegeometry{Body}

% ################################ LENGTHS

% 12pt font \baselineskip = 17.99446pt = 6.32436mm
% 1mm = 2.8453pt

% global 1.25 line spacing
\onehalfspacing

% move floats that are higher than this percentage to a dedicated float page
% (e.g. two images of \figuremaxheight)
% https://tex.stackexchange.com/a/28068/213962
\renewcommand\floatpagefraction{0.80}
\renewcommand\topfraction{0.90}

% https://tex.stackexchange.com/a/568459/213962
\setlength{\textfloatsep}{\baselineskip}

% difference between the \textwidth and the maximum width of figures
% storing this value in a variable also used by caption
\newlength{\figuremargin}
\setlength{\figuremargin}{0mm}

% maximum width of figures and tables
\newlength{\figuremaxwidth}
\setlength{\figuremaxwidth}{\textwidth-2\figuremargin}

% maximum height for small images, the ones surrounded by text, and not in a dedicated page
\newlength{\figuremaxheight}
\setlength{\figuremaxheight}{13\baselineskip}% ~ 70mm

% maximum height for large images, the ones taking a dedicated page
\newlength{\figuremaxheightrotated}
\setlength{\figuremaxheightrotated}{\textheight}

% background image for cover and title pages
\newlength{\bgfigurewidth}

% fancyhdr
\setlength{\headheight}{6mm}

% try to align the last line of every page to the end of the text area
% by stretching the spaces between paragraphs
% unfortunately it is not easy to have all the lines aligned,
% but this system gets the best results
% https://tex.stackexchange.com/q/134081/213962
% https://latexref.xyz/_005cflushbottom.html
% https://ctan.org/pkg/returntogrid
% https://ctan.org/pkg/gridset
\flushbottom
\setlength{\parskip}{0mm plus 1mm}

% without \flushbottom
% ╔═══════════╤═══════════╗
% ║ HEADER    │    HEADER ║
% ║ --------- │ --------- ║
% ║ ▒▒▒▒▒▒▒▒▒ │ text text ║ <-- aligned at top
% ║ ▒▒▒▒▒▒▒▒▒ │ text text ║ <-- loss of alignment because of the picture
% ║ text text │ text text ║     however, line spacing is consistent
% ║           │ text text ║
% ║ 2         │         3 ║
% ╚═══════════╧═══════════╝
%

% with \flushbottom
% ╔═══════════╤═══════════╗
% ║ HEADER    │    HEADER ║
% ║ --------- │ --------- ║
% ║ ▒▒▒▒▒▒▒▒▒ │ text text ║ <-- aligned at top
% ║ ▒▒▒▒▒▒▒▒▒ │ text text ║
% ║           │ text text ║ <-- stretch line spacing if needed
% ║ text text │ text text ║ <-- aligned at bottom
% ║ 2         │         3 ║
% ╚═══════════╧═══════════╝
%

% on pages dedicated to floats, figures are placed at the bottom and not vertically centered
% https://tex.stackexchange.com/a/28565/213962
\setlength{\@fpbot}{0mm}
\setlength{\@fptop}{0mm plus 1fil}

% ################################ ACRONYM

% disable hyperlink color
% https://tex.stackexchange.com/a/73068
\AtBeginDocument{%
 \renewcommand*{\AC@hyperlink}[2]{%
  \begingroup
   \hypersetup{hidelinks}%
   \hyperlink{#1}{#2}%
  \endgroup
 }
}

% ################################ CAPTION

% caption
\captionsetup{
 format=hang,
 labelfont=bf,
 margin={\figuremargin,\figuremargin},
 % don't center if the caption has only one line of content
 singlelinecheck=false,
 % don't invert margins if twoside is specified
 oneside
}

% subcaption
\captionsetup[subfigure]{
 labelsep=colon
}

% used for figures and tables taken from other publications
\newcommand{\source}[1]{\caption*{\textbf{Source:} #1}}

% ################################ CSQUOTES

% ################ GLOBAL

% define new style
% https://tex.stackexchange.com/a/641634/213962
\DeclareQuoteStyle{italic}% style name
 [\itshape]% mark style
 [\itshape]% text style
 {\textquotedblleft}% opening outer mark
 {\textquotedblright}% closing outer mark
 {\textquoteleft}% inner opening mark
 {\textquoteright}% inner closing mark

% apply new style to all quotes, inline and block
%\setquotestyle{italic}

% ################ BLOCK

% adust margins for for displayquote
% https://tex.stackexchange.com/a/468294/213962
\renewenvironment*{displayquote}
 {\begingroup\setlength{\leftmargini}{\parindent}\csq@getcargs{\csq@bdquote{}{}}} % before
 {\csq@edquote\endgroup}% after

% displayquote environment can be used to force a blockquote even for little text
\renewcommand{\mkbegdispquote}[2]{\openautoquote}
\renewcommand{\mkenddispquote}[2]{\closeautoquote#1#2}

% ################################ XCOLORS

% overridden in variables file with:
%\definecolor{PrimaryColor}{HTML}{9B0014}
%\colorlet{LinkColor}{PrimaryColor}

% primary
\definecolor{LinkColor}{HTML}{000000}
\definecolor{NumberColor}{HTML}{000000}
% secondary
\definecolor{TitleColor}{HTML}{000000}
\definecolor{HeaderColor}{HTML}{000000}
\definecolor{FooterColor}{HTML}{000000}
\definecolor{FootnoteColor}{HTML}{000000}
% used in presentation, not in the book
\definecolor{PresentationPrimaryColor}{HTML}{000000}
\definecolor{PresentationSecondaryColor}{HTML}{000000}

% ################################ EMPTYPAGE

% avoid empty pages with oneside option
\iftoggle{twoside}{}{
 \renewcommand{\cleardoublepage}{\clearpage}
}

% ################################ ENUMITEM

% ################ GLOBAL

% all levels
\setlist{
 leftmargin=*,
 nosep,
}

% first level
\setlist[1]{
 labelindent=\parindent,
 topsep=0.5\baselineskip,
 % avoid floats to be placed between items
 % https://tex.stackexchange.com/a/488227/213962
 before=\needspace{5\baselineskip}%
}

% ################ ENUMERATE

\setlist[enumerate]{label*=\arabic*.}

% ################ ITEMIZE

\renewcommand{\labelitemi}{\(\bullet\)}
\renewcommand{\labelitemii}{\(\circ\)}
\renewcommand{\labelitemiii}{\(\bullet\)}
\renewcommand{\labelitemiv}{\(\circ\)}

% ################ RESEARCH QUESTIONS

% custom list
% depth of two levels, first number, then lowercase (e.g. RQ1, RQ1a, RQ1b, RQ2)
% https://tex.stackexchange.com/a/547871/213962
% https://tex.stackexchange.com/a/116103/213962
\newlist{questions}{enumerate}{2}

% to use \ref instead of \cref or \zcref => RQ1, RQ1a, uncomment the following
%\setlist[questions,1]{label={\bfseries RQ\arabic*.},ref=RQ\arabic*}
% clever cross-referecing can be performed via \cref or \zcref
\setlist[questions,1]{
 labelindent=0mm,
 label={\bfseries RQ\ \arabic*.},
 ref=\arabic*
}

\setlist[questions,2]{
 label={\bfseries\alph*.},
 ref=\thequestionsi\alph*
}

% ################################ FANCYHDR

% defining marks allow to customize the running heads at the top of most pages
% there are different styles according to the oneside/twoside/asymmetric option

% ################ DEFINING MARKS

% new latex marks that replace \markboth, \leftmark and \rightmark
% with \NewMarkClass, \InsertMark and \LastMark 
\NewMarkClass{chapter}%       Title of first chapter
\NewMarkClass{section}%       Title of first section of first chapter
\NewMarkClass{chapternumber}% 1
\NewMarkClass{sectionnumber}% 1.1

% used at every \chapter
\renewcommand{\chaptermark}[1]{
 % #1 is the chapter name
 \InsertMark{chapter}{\textsc{#1}}
 \InsertMark{section}{\textsc{#1}}
 %\InsertMark{section}{\textsc{Synopsys}}
 \InsertMark{chapternumber}{\textsc{\thechapter}}
 \InsertMark{sectionnumber}{\textsc{\thechapter}}
}

% used at every \section
\renewcommand{\sectionmark}[1]{
 % #1 is the section name
 \InsertMark{section}{\textsc{#1}}
 \InsertMark{sectionnumber}{\textsc{\thesection}}
}

% ################ DEFINING STYLES

% ######## FRONTMATTER

% this style is used for chapters in frontmatter or backmatter
% that are longer than one page, e.g. toc, lot, lof, bibliography
% these chapters have no number associated, so no \LastMark{sectionnumber} is used
% these chapters are not organized in sections, so no \LastMark{section} is used

% two-sided book:
% ╔═══════════╤═══════════╗
% ║ C         │         C ║
% ║ --------- │ --------- ║
% ║           │           ║
% ║           │           ║
% ║           │           ║
% ║           │           ║
% ║ ii        │       iii ║
% ╚═══════════╧═══════════╝

% right-sided book:
% ╔═══════════╤═══════════╗
% ║           │         C ║
% ║           │ --------- ║
% ║           │           ║
% ║           │           ║
% ║           │           ║
% ║           │           ║
% ║           │       iii ║
% ╚═══════════╧═══════════╝

% one-sided pdf:
% ╔═══════════╗
% ║ C         ║
% ║ --------- ║
% ║           ║
% ║           ║
% ║           ║
% ║           ║
% ║     ii    ║
% ╚═══════════╝

\fancypagestyle{frontmatter}{
 \fancyhf{}
 \iftoggle{twoside}{% style for two-sided book
  % left pages
  \fancyhead[EL]{\HeaderFont\color{HeaderColor}\LastMark{chapter}}
  \fancyfoot[EL]{\thepage}
  % right pages, this prevents sections in bibliography like \InsertMark{section}{\textsc{Articles}}
  \fancyhead[OR]{\HeaderFont\color{HeaderColor}\LastMark{chapter}}
  \fancyfoot[OR]{\thepage}
 }{% style for right-sided book and one-sided pdf
  \fancyhead[L]{\HeaderFont\color{HeaderColor}\LastMark{chapter}}
  \iftoggle{asymmetric}{% style for right-sided book only
   \fancyfoot[R]{\thepage}
  }{%  style for one-sided pdf only
   \fancyfoot[C]{\thepage}
  }% end asymmetric
 }% end twoside
}% end fancypagestyle

% ######## MAIN MATTER

% for most pages of the mainmatter
% each chapter is numbered and organized in sections

% two-sided book:
% ╔═══════════╤═══════════╗
% ║ 1 C1      │  C1S1 1.1 ║
% ║ --------- │ --------- ║
% ║           │           ║
% ║           │           ║
% ║           │           ║
% ║           │           ║
% ║ 2         │         3 ║
% ╚═══════════╧═══════════╝

% right-sided book:
% ╔═══════════╤═══════════╗
% ║           │  C1S1 1.1 ║
% ║           │ --------- ║
% ║           │           ║
% ║           │           ║
% ║           │           ║
% ║           │           ║
% ║           │         3 ║
% ╚═══════════╧═══════════╝

% one-sided pdf:
% ╔═══════════╗
% ║ 1.1 C1S1  ║
% ║ --------- ║
% ║           ║
% ║           ║
% ║           ║
% ║           ║
% ║     2     ║
% ╚═══════════╝

% page numbers at the bottom of each page
\fancypagestyle{mainmatter}{
 \fancyhf{}
 \iftoggle{twoside}{% style for two-sided book
  % left pages
  \fancyhead[EL]{\HeaderFont\color{HeaderColor}\LastMark{chapternumber} \quad \LastMark{chapter}}
  \fancyfoot[EL]{\thepage}
  % right pages
  \fancyhead[OR]{\HeaderFont\color{HeaderColor}\LastMark{section} \quad \LastMark{sectionnumber}}
  \fancyfoot[OR]{\thepage}
 }{% style for right-sided book and one-sided pdf
  \fancyhead[L]{\HeaderFont\HeaderFont\color{HeaderColor}\LastMark{sectionnumber} \quad \LastMark{section}}
  \iftoggle{asymmetric}{% style for right-sided book only
   % all pages
   \fancyfoot[R]{\thepage}
  }{%  style for one-sided pdf only
   % all pages
   \fancyfoot[C]{\thepage}
  }% end asymmetric
 }% end twoside
}% end fancypagestyle

% ######## CHAPTER PAGES

% for pages where a new chapter or page starts

% two-sided book:
% ╔═══════════╤═══════════╗
% ║           │           ║
% ║           │           ║
% ║           │           ║
% ║           │           ║
% ║           │           ║
% ║           │           ║
% ║ 2         │         3 ║
% ╚═══════════╧═══════════╝

% right-sided book:
% ╔═══════════╤═══════════╗
% ║           │           ║
% ║           │           ║
% ║           │           ║
% ║           │           ║
% ║           │           ║
% ║           │           ║
% ║           │         3 ║
% ╚═══════════╧═══════════╝

% one-sided pdf:
% ╔═══════════╗
% ║           ║
% ║           ║
% ║           ║
% ║           ║
% ║           ║
% ║           ║
% ║     2     ║
% ╚═══════════╝

\fancypagestyle{chapterpage}{
 \fancyhf{}
 % hide rule
 \renewcommand{\headrulewidth}{0mm}
 \iftoggle{twoside}{% style for two-sided book
  % left pages, white before chapter starts
  \fancyfoot[LE]{\thepage}
  % right pages, where chapter starts
  \fancyfoot[RO]{\thepage}
 }{% else
  \iftoggle{asymmetric}{% style for right-sided book only
   \fancyfoot[R]{\thepage}
  }{%  style for one-sided pdf only
   \fancyfoot[C]{\thepage}
  }% end asymmetric
 }% end twoside
}% end fancypagestyle

% ################ DEFINING RULES

% redefine of \headrule and \footrule to use custom color
\def\headrule{%
 {%
  \if@fancyplain\let\headrulewidth\plainheadrulewidth\fi%
  \color{HeaderColor}\hrule\@height\headrulewidth\@width\headwidth%
  \vskip-\headrulewidth%
 }%
}%

% different from footnoterule, this is just above the page number
%\def\footrule{%
% {%
%  \if@fancyplain\let\footrulewidth\plainfootrulewidth\fi%
%  \color{FooterColor}\hrule\@width\headwidth\@height\footrulewidth%
% }%
%}%

% different frontmatter, mainmatter and backmatter styles
% https://tex.stackexchange.com/a/510514/213962

% frontmatter
\let\oldfrontmatter\frontmatter
\gdef\frontmatter{\oldfrontmatter\pagestyle{frontmatter}}

% mainmatter
\let\oldmainmatter\mainmatter
\gdef\mainmatter{\oldmainmatter\pagestyle{mainmatter}}

% backmatter
\let\oldbackmatter\backmatter
\gdef\backmatter{\oldbackmatter\pagestyle{frontmatter}}

% ################ APPLYING RULES

% cleanup any previous configuration
\fancyhf{}

% adjust fancyhdr lines thickness, default 0.4pt and 0pt
\renewcommand{\headrulewidth}{0.3mm}
%\renewcommand{\footrulewidth}{0mm}

% custom header height
%\setlength{\headheight}{10mm}

% default if no \frontmatter, \mainmatter or \backmatter is specified
\pagestyle{mainmatter}

% ################################ FLOATBARRIER

% force the positioning of each figure and table before the section ends
% if there is not enough space to start a new section, start it in the next page
% not adding in titleformat's "before title" because it generates bad spacing
\pretocmd{\chapter}{%
 \FloatBarrier%
}{}{}
\pretocmd{\section}{%
 \FloatBarrier%
 \needspace{7\baselineskip}%
}{}{}
\pretocmd{\subsection}{%
 \FloatBarrier%
 \needspace{5\baselineskip}%
}{}{}
\pretocmd{\subsubsection}{%
 \FloatBarrier%
 \needspace{4\baselineskip}%
}{}{}
\pretocmd{\paragraph}{%
 \FloatBarrier%
 \needspace{3\baselineskip}%
}{}{}

% ################################ FONTSPEC

% font used for numbered chapters
\NewDocumentCommand{\TitleNumberFont}{}{\normalfont}

% chapter and section titles
\NewDocumentCommand{\TitleFont}{}{\normalfont}

% page headers
\NewDocumentCommand{\HeaderFont}{}{\normalfont}

% lettrine drop cap
\NewDocumentCommand{\InitialsFont}{}{\normalfont}

% these fonts can be overridden by the user:
%\setmainfont{Minion 3}
%\setmonofont{Fira Code}
%\setmathfont{Libertinus Math}
%\setmathrm{Libertinus Math}
%\newfontfamily\TitleNumberFont{Tex Gyre Pagella}
%\newfontfamily\TitleFont{Minion 3}
%\newfontfamily\HeaderFont{Minion 3}
%\newfontfamily\InitialsFont{Minion 3}

% suggested fonts for math: tex gyre schola, libertinus math, stix two math (times new roman), garamond math (eb garamond)

% ################################ FOOTNOTES

% skip this code if it is not the final version
\iftoggle{wip}{}{

% ################ XCOLOR

% different from footrule, this is just above the footnotes
% redefine the original book.cls command applying color to all footnotes but keeping the original length
\renewcommand{\footnoterule}{%
 \kern-3\p@%
 % color for footnote line and text (except callout, which is set by hyperref)
 \color{FootnoteColor}
 % comment out for no rules
 %\hrule
 \hrule\@width0.5\columnwidth%
 \kern2.6\p@%
}

% ################ FOOTMISC

% smaller margin
%\renewcommand{\footnotemargin}{5mm}
\renewcommand{\footnotemargin}{0mm}

% ################ FOOTNOTEBACKREF

% makes the call-up (\@makefntext) a regular number instead of a superscript one
%\renewcommand\@makefntext[1]{%
% \renewcommand\@makefnmark{%
%  \mbox{{\normalfont\hyperref[\BackrefFootnoteTag]{\@thefnmark}}}%.%
% }%
% \BHFN@OldMakefntext{#1}%
%}% end renewcommand

}% end iftoggle

% ################################ HYPERREF

\hypersetup{
 % links in both toc titles and page numbers
 %linktoc=all,
 %linktoc=page,
 % links consistent with list of acronyms (only in toc titles)
 linktoc=section,
 % pdf will be opened with horizontal fit
 pdfstartview=Fit,
 % pdf will be opened with vertical fit
 %pdfstartview=FitV,
 pdfpagemode=UseOutlines,
 % colors
 % hyperlink and url colors
 colorlinks=true,
 % for black links, set everything to black:
 citecolor=LinkColor,
 filecolor=LinkColor,
 linkcolor=LinkColor,
 menucolor=LinkColor,
  urlcolor=LinkColor
}

% ################################ LETTRINE

\newcommand{\startChapter}[2]{
 % add an extra empty line to J and Q
 \expandafter\ifstrequal\expandafter{#1}{Q}{%then
  \def\lettrineDepth{1}%
 }{% else
  \expandafter\ifstrequal\expandafter{#1}{J}{%then
   \def\lettrineDepth{1}%
  }{% else
   \def\lettrineDepth{0}%
  }%
 }%
 \renewcommand*{\LettrineFontHook}{\InitialsFont\color{NumberColor}}%
 \lettrine[
  depth=\lettrineDepth,
  lines=3,
  findent=2mm,
  nindent=0mm,
  realheight=true
 ]{#1}{#2}
}

% no need for an extra line depth if it's only two lines big
\newcommand{\startSection}[2]{%
 % change font shape
 \needspace{3\baselineskip}
 % restore default color use \normalfont
 \renewcommand*{\LettrineFontHook}{\InitialsFont}%
 % print the word
 \renewcommand{\LettrineTextFont}{\scshape}
 \lettrine[
  lines=2,
  findent=2mm,
  nindent=0mm,
  realheight=true
 ]{#1}{#2}
}

% ################################ LSTLISTING

\iftoggle{wip}{}{
 \linebreakersetup{
  maxtolerance=90,
  maxemergencystretch=1mm,
  maxcycles=4
 }
}

% https://tex.stackexchange.com/a/50108/213962

% to avoid copying line numbers:
% https://tex.stackexchange.com/a/57160/213962

% for lstlisting environment
\lstset{
 basicstyle=\footnotesize\ttfamily,
 breaklines=true,
 breakatwhitespace=true,
 breakautoindent=true,
 % uncomment to enable indenting, value seems to have no effect
 breakindent=0mm,
 commentstyle=\color{SecondaryColor},
 keepspaces=true,
 morecomment=[l]{\#},
 xleftmargin=\parindent
 %numbers=left,
 %numberstyle=\tiny\color{SecondaryColor}\ttfamily,
 %numbersep=\parindent,
 %rulecolor=\color{SecondaryColor},
 %frame=leftline,
 %framerule=0.3mm
}

\lstnewenvironment{code}%
 {\needspace{5\baselineskip}}% before
 {}% after

% ################################ NOINDENTAFTER

% not using \NoIndentAfterCmd as they can't be placed in preable
\NoIndentAfterEnv{align}
\NoIndentAfterEnv{code}
\NoIndentAfterEnv{displayquote}
%\NoIndentAfterEnv{quote}
\NoIndentAfterEnv{enumerate}
\NoIndentAfterEnv{itemize}
\NoIndentAfterEnv{questions}
\NoIndentAfterEnv{questionsintermediate}
% only makes sense for [H] floats
%\NoIndentAfterEnv{outerImage}
%\NoIndentAfterEnv{outerTable}

% ################################ SIUNITX

% affects \num{12345.6789}
\sisetup{
 group-minimum-digits=4,
 % use text font instead of math font
 mode=match,
 propagate-math-font=true,
 reset-math-version=false,
 reset-text-family=false,
 reset-text-series=false,
 text-family-to-math=true,
 text-series-to-math=true
}

% ################################ TABULARRAY

% for easily wysiwyg tables:
% - https://www.latex-tables.com/index.html
% - https://www.latex-tables.com/ressources/tabularray.html

% outerTable is a table environment with
% - float positioning ``here''
% - centered content
% should contain caption, label and effective table

% for large tables (not covered by this thesis class):
% https://tex.stackexchange.com/q/635018

% define custom R column for right-aligned extensible column
\NewColumnType{R}[1][]{Q[r,co=1,#1]}

\newenvironment{outerTable}{
 \begin{table}[ht]
   }{
 \end{table}
}

% hidden column type, useful to comment out text. to use in colspec
% can be used only once per table
% https://tex.stackexchange.com/a/16607/213962
% https://texblog.org/2014/10/24/removinghiding-a-column-in-a-latex-table/
% bad looking if default colspec is set to XXXXXXXXXX
\NewColumnType{H}{>{\setbox0=\hbox\bgroup}c<{\egroup}@{}}

% hyphenation in left-aligned cells, better looking than no hyphenation
% https://tex.stackexchange.com/a/670732/213962
\RenewDocumentCommand\TblrAlignBoth{}{\justifying}
\RenewDocumentCommand\TblrAlignLeft{}{\RaggedRight}
\RenewDocumentCommand\TblrAlignCenter{}{\Centering}
\RenewDocumentCommand\TblrAlignRight{}{\RaggedLeft}

% load different addons
\UseTblrLibrary{siunitx}

% xparse, tabularray
\NewDocumentEnvironment{innerTable}{m+b}% m=mandatory specification as #1, +=multiple paragraphs in body, b=body in #2
{% begin before
 {% begin scope (for \centering)
  \centering
  \begin{innerInnerTable}{#1}% specifications
   #2% body
  \end{innerInnerTable}
 }% end scope
}% end before
{}% after

% new environment
\NewTblrEnviron{innerInnerTable}

% defaults, remove optional argument to affect all ``tblr''
\SetTblrInner[innerInnerTable]{
 width=\textwidth,
 baseline=T,
 hspan=minimal,
 vspan=even,
 stretch=1.3,
 % left-aligned cells, better looking than the justified default
 rows={halign=l},
 row{1}={font=\scshape},
 hline{1,Z}={0.6mm},
 hline{2}={0.3mm}
}

% ################################################################ ROTATED

% new environment
\NewTblrEnviron{innerInnerTableRotated}

\SetTblrInner[innerInnerTableRotated]{
 width=\figuremaxheightrotated,
 %height=\figuremaxwidth,
 baseline=T,
 hspan=minimal,
 vspan=even,
 %stretch=1.3,
 % how many rows are repeated for each table
 rowhead=1,
 rows={halign=l},
 row{1}={font=\scshape},
 hline{1,Z}={0.6mm},
 hline{2}={0.3mm},
 vline{1-Z}={0mm,transparent}
}

\newenvironment{outerTableRotated}{
 \begin{sidewaystable}[p]
 %\begin{landscape}
 %\begin{sideways}
}{
 \end{sidewaystable}
 %\end{landscape}
 %\end{sideways}
}

\NewDocumentEnvironment{innerTableRotated}{m+b}
{% begin before
 {% begin scope (for \centering)
  %\centering
  \begin{innerInnerTableRotated}{#1}% specifications
   #2% body
  \end{innerInnerTableRotated}
 }% end scope
}% end before
{}% after

% ################################ TITLESEC

% ################ FORMAT

% reduce title text width, without taking the full horizontal space before breaking
\newcommand{\partheadingstyle}[1]{%
 \parbox[b]{0.8\textwidth\relax}{\centering#1}%
}
\newcommand{\chapterheadingstyle}[1]{%
 \parbox[b]{0.8\textwidth\relax}{\raggedleft\scshape#1}%
}

% not currently used
\titleformat{name=\part}% command
 [display] % shape, "display" puts the label in a separate paragraph
 {\vspace{-3\baselineskip}\centering\fontsize{80}{80}\Huge\scshape\color{TitleColor}\TitleFont}% format
 {%
  \color{NumberColor} Part \thepart \\%
  \adjustimage{width=40mm}{decoration}
 } % label
 {0mm}% separator
 {\partheadingstyle} % before title
 [\thispagestyle{chapterpage}] % after title

% https://github.com/suchow/Dissertate
\titleformat{name=\chapter} % command
 [display] % shape
 {\raggedleft\Huge\color{TitleColor}\TitleFont} % format
 {\fontsize{80}{90}\bfseries\color{NumberColor}\TitleNumberFont\thechapter} % label
 {0mm} % separator
 {\chapterheadingstyle} % before title
 [\thispagestyle{chapterpage}] % after title

% used in frontmatter and backmatter
\titleformat{name=\chapter,numberless} % command
 [display] % shape
 {\raggedleft\Huge\color{TitleColor}\TitleFont} % format
 {} % label
 {0mm} % separator
 {\chapterheadingstyle} % before title
 [\thispagestyle{chapterpage}] % after title

\titleformat{name=\section} % command
 {\LARGE\color{TitleColor}\TitleFont\scshape}% format
 {}% label
 {0mm}% separator
 {\thesection\ }% before title

% used for split bibliography
\titleformat{name=\section,numberless} % command
 {\LARGE\color{TitleColor}\TitleFont\scshape} % format
 {} % label
 {0mm} % separator
 {} % before title

\titleformat{name=\subsection} % command
 {\Large\color{TitleColor}\TitleFont\scshape} % format
 {} % label
 {0mm} % separator
 {\thesubsection\ } % before title

\titleformat{name=\subsection,numberless} % command
 {\Large\color{TitleColor}\TitleFont\scshape} % format
 {} % label
 {0mm} % separator
 {} % before title

\titleformat{name=\subsubsection} % command
 {\large\color{TitleColor}\TitleFont\scshape} % format
 {} % label
 {0mm} % separator
 {\thesubsubsection\ } % before title

\titleformat{name=\subsubsection,numberless} % command
 {\large\color{TitleColor}\TitleFont\scshape} % format
 {} % label
 {0mm} % separator
 {} % before title

\titleformat{name=\paragraph} % command
 {\color{TitleColor}\TitleFont\scshape} % format
 {} % label
 {0mm} % separator
 {\theparagraph\ } % before title

\titleformat{name=\paragraph,numberless} % command
 {\color{TitleColor}\TitleFont\scshape} % format
 {} % label
 {0mm} % separator
 {} % before title

% ################ SPACING

% remove the default space before a chapter title
% https://tex.stackexchange.com/a/63393
% disabled because numberless version is set before textarea
% cannot add space before with pretocmd
\titlespacing*{\chapter}{0mm}{-23mm}{10mm}% right, before, after
\titlespacing*{\section}{0mm}{0.75\baselineskip}{0.25\baselineskip}
\titlespacing*{\subsection}{0mm}{0.75\baselineskip}{0.25\baselineskip}
\titlespacing*{\subsubsection}{0mm}{0.75\baselineskip}{0.25\baselineskip}
\titlespacing*{\paragraph}{0mm}{0.75\baselineskip}{0.25\baselineskip}

% ################################ TITLETOC

% add space before parts in toc
\titlecontents{part}
 [0mm]
 {\vspace{5mm}}% above code
 {\bfseries\large\thecontentslabel\enspace}% numbered entry format
 {}% numberless entry format
 {\bfseries\large\hfill\contentspage}% filler page format
 []% below code

% ################################ TOCBIBIND

% to hide table of contents (toc), list of figures (lof), list of tables (lot), search and uncomment "\RequirePackage{tocbibind}"
% to hide list of acronyms, search and replace "\chapter{List of Acronyms}" with "\chapter*{List of Acronyms}"
% to hide list of todos, search and uncomment "\todototoc"

% set heading for toc, lof, lot
\renewcommand{\tocetcmark}[1]{\InsertMark{chapter}{\textsc{#1}}}

% ################################ TODONOTES

% if package is not loaded, silence these commands

\iftoggle{wip}{
 \providecommand{\setuptodonotes}[1]{}
 \setuptodonotes{
  color=orange!70,
  bordercolor=orange!70,
  size=tiny
 }

 % don't silence, but turn into red margin notes
 \providecommand{\todo}[1]{\marginpar{\RaggedRight\color{NumberColor}\tiny\ttfamily #1}}
}{
 \providecommand{\todo}[1]{}
}

\providecommand{\todototoc}{}
\ProvideDocumentCommand{\listoftodos}{o}{}

% ################################ TOTALCOUNT

% define \totalCOUNTERs and \iftotalCOUNTERs
\DeclareTotalCounter{figure}
\DeclareTotalCounter{table}

% create todonotes counter if not existing
\ifcsname c@@todonotes@numberoftodonotes\endcsname
\else
 \newcounter{@todonotes@numberoftodonotes}
\fi
\DeclareTotalCounter{@todonotes@numberoftodonotes}

% ################################ ZREF-CLEVER

\zcsetup{
 nameinlink=false,
 % same format for nested research questions
 countertype={questionsii=questionsi}
}

% custom question environment
\zcRefTypeSetup{questionsi}{
 name-sg=RQ,
 name-pl=RQs,
 Name-sg=Research question,
 Name-pl=Research questions
}

% cleveref alternative for the aforementioned commands
% type, singular, plural
%\crefname{rq}{RQ}{RQ}
%\Crefname{rq}{Research question}{Research questions}
%\crefalias{questionsi}{rq}
%\crefalias{questionsii}{rq}

% replace cleveref commands with zref-clever ones
\providecommand{\cref}{}
\providecommand{\Cref}{}
\renewcommand{\cref}[1]{\zcref{#1}}
\renewcommand{\Cref}[1]{\zcref[S]{#1}}

% automatically assign a \zlabel for every \label
\renewcommand{\label}[1]{\zlabel{#1}}

% ################################ WATERMARK

% print poor's man watermark (no tikz needed) on every page
\iftoggle{wip}{
 % https://tex.stackexchange.com/a/18578/213962
 \newcommand{\watermarkText}{\large\ttfamily\color{HeaderColor}DRAFT \today}
 \newlength{\watermarkLength}
 \newlength{\watermarkStart}
 \settowidth{\watermarkLength}{\watermarkText}
 \setlength{\watermarkStart}{0.5\pagewidth-0.5\watermarkLength}
 \AddToHook{shipout/background}{\put(\watermarkStart,-20mm){\watermarkText}}
}{}

% ################################ WIP2 CLASS OPTION

% must be placed after zref because it redefines \cref and \Cref
\iftoggle{wip2}{
 % override commands with simpler verions
 \renewcommand{\autocite}[1]{(\textbf{#1})}
 \renewcommand{\textcite}[1]{\textbf{#1}}
 \renewcommand{\citetitle}[1]{(\textbf{#1})}
 \renewcommand{\citeauthor}[1]{\textbf{#1}}
 \renewcommand{\ac}[1]{\textbf{#1}}
 \renewcommand{\acf}[1]{\textbf{#1}}
 \renewcommand{\acl}[1]{\textbf{#1}}
 \renewcommand{\cref}[1]{\textbf{#1}}
 \renewcommand{\Cref}[1]{\textbf{#1}}
 \providecommand{\todo}[1]{}
 \renewcommand{\todo}[1]{\marginpar{\RaggedRight\footnotesize\color{NumberColor}\bfseries #1}}
 \setlength{\marginparwidth}{20mm}
}{}

% ################################################################ PAGES

% ################################ COVER

% split landscape A3 cover in two portrait A4
\newcommand{\addFrontCover}[1]{
 \pagenumbering{Roman}
 \begingroup
 \includepdf[pages=1,clip,trim=210mm 0 0 0]{#1}
 \cleardoublepage
 \endgroup
 \pagenumbering{arabic}
}

\newcommand{\addBackCover}[1]{
 \begingroup
 \includepdf[pages=1,clip,trim=0 0 210mm 0]{#1}
 \endgroup
}

% ################################ PLACEHOLDER

% add a work in progress text
\newcommand{\placeholder}{\input{pages/placeholder}}
