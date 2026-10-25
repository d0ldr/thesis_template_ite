# thesis_template_ite

LaTeX template for degree projects at the School of Information Technology (ITE),
Halmstad University. One template covers all three reports in the thesis course:

| Class option | Report | Sv |
|---|---|---|
| `plan` | Project plan | Projektplan |
| `midterm` (alias `halftime`) | Half-time report | Halvtidsrapport |
| `final` (default) | Final thesis | Examensarbete / slutrapport |

Choose the report, language and programme in the first line of `thesis.tex`:

```latex
\documentclass[english,tgmek,plan]{hhthesis}
```

- Language: `english` (or `british`/`american`) or `swedish`
- Programme: `tgelt`, `tgdat`, `tgmek`, `tacda`, `tacis`, `tacis.elde`
- Optional: `nohints` hides all template instructions and the green Swedish heading names
  (to see your own text and its real length); `justified` gives justified instead of left-aligned text

Write in the same files the whole course. When it is time for the next report,
change `plan` → `midterm` → `final` and the template adds or removes the parts needed.

## What each mode contains

| Part | plan | midterm | final |
|---|:-:|:-:|:-:|
| Report type on title page | Project Plan | Half-time Report | – |
| Abstract, Sammanfattning, Preface | | | x |
| Lists of figures/tables/listings, acronyms (each only if non-empty) | | x | x |
| Introduction | x | x | x |
| Technical Background | | x | x |
| Method (reproducibility intro in midterm/final) | x | x | x |
| Implementation | | | x |
| Results | | Preliminary | x |
| Discussion, Conclusion | | | x |
| Execution Plan with timetable | x | x | |
| – Follow-up of the project plan (with milestone table) | | x | |
| – Chosen area of technical background | x | | |
| – UtExpo (plan, then short update) | x | x | |
| Appendices | | x | x |

## Mode-dependent content in your own text

```latex
\inputin{midterm,final}{chapters/myfile}   % input a file only in some modes
\onlyin{final}{short text}                 % inline text only in some modes
\IfMode{midterm}{text if midterm}{text otherwise}
\ifplan ... \fi   \ifmidterm ... \fi   \iffinal ... \fi

\begin{onlymidterm}     % also: onlyplan, onlyfinal, notplan, notmidterm, notfinal
\section{...}           % may contain sections, figures, listings
\end{onlymidterm}
```

`\begin{...}` and `\end{...}` of the `only*`/`not*` environments must each be on a line of their own.

## Template hints

```latex
\section{Background\sv{Bakgrund}}     % Swedish name in a green box
\section{Deployment \hint{(if applicable)}}   % short red hint
\begin{instructions}
Instruction text from the template ...
\end{instructions}
Your own text goes outside the instructions environments.
```

All of these disappear with the class option `nohints`. The Swedish names are never shown in the table of contents.

## Layout

The body text follows the official HH Word template (`mall-examensarbeten-uppsatser.docx`), measured in its PDF:

| | Word template | LaTeX template |
|---|---|---|
| Margins | 3 cm left/right, 2.5 cm top/bottom | same |
| Body font | Times New Roman 12 pt | Times (newtx) 12 pt |
| Line spacing | 1.15 (15.9 pt between baselines) | 15.9 pt |
| Paragraphs | 6 pt after, no indent, left aligned | same |
| Headings | Gill Sans Std 18/14/12 pt, not bold | GilliusADF (free Gill Sans clone) 18/14/12 pt, numbered |
| Heading spacing | | calibrated to the Word PDF (within 0.1 pt) |

The title page, running headers and chapters starting on odd pages are kept from the previous LaTeX template.

## Building

- **Overleaf:** upload the folder (or the zip). `.latexmkrc` makes Overleaf build the glossary/acronym list.
- **Locally:** `latexmk thesis` or `make`. Requires `pdflatex`, `biber` and `makeglossaries`
  (`-shell-escape` is needed for `gnuplottex`).
- **All three reports at once:** `make all-modes` builds `plan.pdf`, `midterm.pdf` and `final.pdf`
  regardless of the mode set in `thesis.tex` (handy for checking the template before a course starts).
- **Cleaning up:** `make clean` removes all temporary build files but keeps the PDFs;
  `make distclean` also removes the PDFs. They can be combined, e.g. `make all-modes clean`.

## Files

```
thesis.tex          main file, choose mode here
hhthesis.cls        document class
frontmatter/        abstract, sammanfattning, preface (final only)
chapters/           all chapters, shared between the modes
appendices/
glossary.tex        glossary and acronyms
thesis.bib          references
figures/ csvtables/ listings/
```

Based on the NTNU thesis template by CoPCSE@NTNU (MIT licence, see `LICENSE.txt`).
