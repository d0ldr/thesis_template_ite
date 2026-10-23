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

Write in the same files the whole course. When it is time for the next report,
change `plan` → `midterm` → `final` and the template adds or removes the parts needed.

## What each mode contains

| Part | plan | midterm | final |
|---|:-:|:-:|:-:|
| Report type on title page | Project Plan | Half-time Report | – |
| Abstract, Sammanfattning, Preface | | | x |
| Lists of figures/tables/listings, acronyms | | x | x |
| Introduction | x | x | x |
| Technical Background | | x | x |
| Method (reproducibility intro in midterm/final) | x | x | x |
| Implementation | | | x |
| Results | | Preliminary | x |
| Discussion, Conclusion | | | x |
| Execution Plan with timetable | x | x | |
| – Follow-up of the project plan | | x | |
| – Chosen area of technical background, UtExpo | x | | |
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

## Building

- **Overleaf:** upload the folder (or the zip). `.latexmkrc` makes Overleaf build the glossary/acronym list.
- **Locally:** `latexmk thesis` or `make`. Requires `pdflatex`, `biber` and `makeglossaries`
  (`-shell-escape` is needed for `gnuplottex`).

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
