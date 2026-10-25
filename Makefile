SRCS=$(wildcard appendices/*)  $(wildcard chapters/*)  $(wildcard frontmatter/*)  $(wildcard csvtables/*)  $(wildcard figures/*)  $(wildcard listings/*)  $(wildcard papers/*)  hhthesis.cls  thesis.bib  glossary.tex  thesis.tex

MODES=plan midterm final

# Build thesis.pdf in the mode chosen in thesis.tex
thesis.pdf: $(SRCS)
	latexmk thesis

# Build plan.pdf, midterm.pdf and final.pdf regardless of the mode in thesis.tex
all-modes: $(addsuffix .pdf,$(MODES))

$(addsuffix .pdf,$(MODES)): %.pdf: $(SRCS)
	latexmk -jobname=$* -usepretex='\def\hhmode{$*}' thesis

JOBS=thesis $(MODES)

# Remove temporary build files but keep the PDFs, e.g.  make all-modes clean
clean:
	$(foreach j,$(JOBS),latexmk -c -jobname=$(j) thesis;)
	-@$(RM) $(foreach j,$(JOBS),$(j).bbl $(j).run.xml) comment.cut
	-@$(RM) $(wildcard *-gnuplottex*) $(wildcard *.gnuploterrors)

# Remove all generated files, including the PDFs
distclean: clean
	$(foreach j,$(JOBS),latexmk -C -jobname=$(j) thesis;)

.PHONY: all-modes clean distclean
