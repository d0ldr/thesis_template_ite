SRCS=$(wildcard appendices/*)  $(wildcard chapters/*)  $(wildcard frontmatter/*)  $(wildcard csvtables/*)  $(wildcard figures/*)  $(wildcard listings/*)  $(wildcard papers/*)  hhthesis.cls  thesis.bib  glossary.tex  thesis.tex

MODES=plan midterm final

# Build thesis.pdf in the mode chosen in thesis.tex
thesis.pdf: $(SRCS)
	latexmk thesis

# Build plan.pdf, midterm.pdf and final.pdf regardless of the mode in thesis.tex
all-modes: $(addsuffix .pdf,$(MODES))

$(addsuffix .pdf,$(MODES)): %.pdf: $(SRCS)
	latexmk -jobname=$* -usepretex='\def\hhmode{$*}' thesis

clean:
	latexmk -C thesis
	$(foreach m,$(MODES),latexmk -C -jobname=$(m) thesis;)
	-@$(RM) $(wildcard *-gnuplottex*) $(wildcard *.gnuploterrors)
.PHONY: all-modes clean
