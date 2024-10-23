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

part: part-only end
presentation: presentation-only end
thesis: thesis-only end
end: clean success

# ################################ BASE COMMANDS

part-only:
	$(engine) $(flagsBase) $(flagsFinal) "part.tex" | texlogfilter $(flagsLog)

presentation-only:
	# 2 passes are needed for toc and correct positioning of background pictures
	$(engine) $(flagsBase) $(flagsDraft) "presentation.tex" | texlogfilter $(flagsLog)
	# uncomment if you have references
	#biber     $(flagsBib)                "presentation.bcf"
	$(engine) $(flagsBase) $(flagsFinal) "presentation.tex" | texlogfilter $(flagsLog)

thesis-only:
	# 1+1+2 passes are needed for proper hyperlinks and references destinations
	$(engine) $(flagsBase) $(flagsDraft) "thesis.tex" | grep -vE "(LaTeX Warning: Citation|LaTeX Warning: Empty bibliography|LaTeX Warning: Reference|Package acronym Warning:|Package biblatex Warning:|Package tagpdf Warning:|\(tagpdf\))" | texlogfilter $(flagsLog)
	biber     $(flagsBib)                "thesis.bcf"
	$(engine) $(flagsBase) $(flagsDraft) "thesis.tex" | grep -vE "(Package tagpdf Warning:|\(tagpdf\))" | texlogfilter $(flagsLog)
	$(engine) $(flagsBase) $(flagsFinal) "thesis.tex" | grep -vE "(Package tagpdf Warning:|\(tagpdf\))" | texlogfilter $(flagsLog)

clean:
	git clean -Xfd

success:
	echo "[OK] The operation completed successfully"
