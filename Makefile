SRCS=$(wildcard appendices/*)  $(wildcard chapters/*)  $(wildcard frontmatter/*)  $(wildcard csvtables/*)  $(wildcard figures/*)  $(wildcard listings/*)  $(wildcard papers/*)  hhthesis.cls  thesis.bib  glossary.tex  thesis.tex

MODES=plan midterm final

# Build thesis.pdf in the mode chosen in thesis.tex
thesis.pdf: $(SRCS)
	latexmk thesis

# Build plan.pdf, midterm.pdf and final.pdf regardless of the mode in thesis.tex
all-modes: $(addsuffix .pdf,$(MODES))

$(addsuffix .pdf,$(MODES)): %.pdf: $(SRCS)
	latexmk -jobname=$* -usepretex="\def\hhmode{$*}" thesis

JOBS=thesis $(MODES)

# Each command is on its own line and no shell features are used, so the
# Makefile works both with a Unix shell and with cmd.exe on Windows.

# Remove temporary build files but keep the PDFs, e.g.  make all-modes clean
clean: $(addprefix clean-,$(JOBS))
clean-%:
	latexmk -c -jobname=$* thesis

# Remove all generated files, including the PDFs
distclean: $(addprefix distclean-,$(JOBS))
distclean-%:
	latexmk -C -jobname=$* thesis

.PHONY: all-modes clean distclean
