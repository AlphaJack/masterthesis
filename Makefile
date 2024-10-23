# ┌───────────────────────────────────────────────────────────────┐
# │ Contents of Makefile                                          │
# ├───────────────────────────────────────────────────────────────┘
# │
# ├── FLAGS
# ├──┐COMMANDS
# │  ├── DEFAULT
# │  ├── MULTIPLE FILES + CLEAN
# │  ├── SINGLE FILES + CLEAN
# │  └── BASE COMMANDS
# │
# └───────────────────────────────────────────────────────────────

# ################################################################ FLAGS

# compilation software
engine=lualatex
# options for biber compilation
flagsBib=--quiet
# options for all latex compilations
#flagsBase=--interaction=nonstopmode --file-line-error --recorder
flagsBase=--interaction=nonstopmode --file-line-error
# options for intermediate latex compilations
flagsDraft=--draftmode
# options for the final latex compilation
#flagsFinal=--synctex=1
flagsFinal=
# options for log filter
#flagsLog=--full-log
flagsLog=

# ################################################################ COMMANDS

# ################################ DEFAULT

.DEFAULT_GOAL := thesis

# ################################ MULTIPLE FILES + CLEAN

all: thesis-only presentation-only end

# ################################ SINGLE FILES + CLEAN

cover: cover-digital cover-printed cover-printed-spine end
presentation: presentation-only end
thesis: thesis-only end
part: part-only end
end: clean success

# ################################ BASE COMMANDS

presentation-only:
	# 2 passes are needed for toc and correct positioning of background pictures
	$(engine) $(flagsBase) $(flagsDraft) "presentation.tex" | texlogfilter $(flagsLog)
	# uncomment biber if you have references
	#biber     $(flagsBib)                "presentation.bcf"
	$(engine) $(flagsBase) $(flagsFinal) "presentation.tex" | texlogfilter $(flagsLog)

thesis-only:
	# 1+1+2 passes are needed for proper hyperlinks and references destinations
	$(engine) $(flagsBase) $(flagsDraft) "thesis.tex" | grep -vE "(LaTeX Warning: Citation|LaTeX Warning: Empty bibliography|LaTeX Warning: Reference|Package acronym Warning:|Package biblatex Warning:|Package tagpdf Warning:|\(tagpdf\))" | texlogfilter $(flagsLog)
	biber     $(flagsBib)                "thesis.bcf"
	$(engine) $(flagsBase) $(flagsDraft) "thesis.tex" | grep -vE "(Package tagpdf Warning:|\(tagpdf\))" | texlogfilter $(flagsLog)
	$(engine) $(flagsBase) $(flagsFinal) "thesis.tex" | grep -vE "(Package tagpdf Warning:|\(tagpdf\))" | texlogfilter $(flagsLog)

part-only:
	$(engine) $(flagsBase) $(flagsFinal) "extra/part.tex" | texlogfilter $(flagsLog)

cover-digital:
	$(engine) $(flagsBase) $(flagsFinal) "extra/cover-digital.tex" | texlogfilter $(flagsLog)
	mv cover-digital.pdf pages/

cover-printed:
	$(engine) $(flagsBase) $(flagsFinal) "extra/cover-printed.tex" | texlogfilter $(flagsLog)
	mv cover-printed.pdf pages/

cover-printed-spine:
	$(engine) $(flagsBase) $(flagsFinal) "extra/cover-printed-spine.tex" | texlogfilter $(flagsLog)
	mv cover-printed-spine.pdf pages/

clean:
	git clean -Xfdq

success:
	echo "[OK] The operation completed successfully"
