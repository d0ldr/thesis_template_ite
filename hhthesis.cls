% [vero] Based On:
%% ntnuthesis.cls - a LaTeX class for theses at NTNU
%%
%% CC-BY CoPCSE@NTNU, 2019
%%
%% Partly merged, partly based on, and partly a simplification of
%% various previous thesis templates by Simon McCallum, Ivar Farup,
%% Kjetil Ørbekk an others, by CoPCSE@NTNU.
%%
%% 2026: The separate project plan, half-time report and thesis classes have
%% been merged into one class. Select the report type with one of the class
%% options  plan | midterm (alias: halftime) | final  (default: final).

%% IDENTIFICATION

\xdef\hhthesisdate{2026/10/23}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hhthesis}
 [\hhthesisdate\space
   CC-BY examiners at HH-ITE 2026]


%% CLASS OPTIONS
% Package for some reason needed before the options
\RequirePackage{pdfpages}                   % including pdf files

\RequirePackage{eso-pic} % needed to put logo on right place

\newcommand*{\subtitle}[1]{\gdef\@subtitle{#1}%
}
\newcommand*{\@subtitle}{}

\newcommand*{\authorone}[1]{\gdef\@authorone{#1}%
}
\newcommand*{\@authorone}{Missing author}

\newcommand*{\authortwo}[1]{\gdef\@authortwo{#1}%
}
\newcommand*{\@authortwo}{}

\newcommand*{\authorthree}[1]{\gdef\@authorthree{#1}%
}
\newcommand*{\@authorthree}{}

\definecolor{hhlpr}{RGB}{65,114,176}

\newcommand*{\program}{}
\newcommand*{\pcredits}{}
\newcommand*{\major}{}
\newcommand*{\mcredits}{}
\newcommand*{\course}{}
\newcommand*{\logotype}{hh-logga-SVE}

\newif\if@isenglish
\@isenglishtrue

% Report type (mode): plan, midterm or final
\newif\ifplan
\newif\ifmidterm
\newif\iffinal
\def\hh@mode{final}
\DeclareOption{plan}{\def\hh@mode{plan}}
\DeclareOption{midterm}{\def\hh@mode{midterm}}
\DeclareOption{halftime}{\def\hh@mode{midterm}}
\DeclareOption{final}{\def\hh@mode{final}}

% Template hints: the green "(Sv: ...)" boxes and the instructions environment.
% Option nohints hides them, e.g. to see the real length of your own text.
\newif\ifhh@hints
\hh@hintstrue
\DeclareOption{nohints}{\hh@hintsfalse}

% Body text is ragged right (left aligned) like the HH Word template.
% Option justified gives justified text instead.
\newif\ifhh@justified
\DeclareOption{justified}{\hh@justifiedtrue}


% British
\newif\ifcapitalize
\DeclareOption{british}{
    \@isenglishtrue
    \capitalizetrue
    \def\papername{Paper}
    \newcommand{\HH}{{H}almstad {U}niversity}
    \AtBeginDocument{
        \renewcommand{\lstlistingname}{Code listing}
        \renewcommand{\lstlistlistingname}{Code Listings}
        \crefname{listing}{Code listing}{Code listings}
        \crefname{paper}{Paper}{Papers}
        \addto\captionsbritish{
            \renewcommand{\contentsname}{Contents}
            \renewcommand{\listfigurename}{Figures}
            \renewcommand{\listtablename}{Tables}
            \renewcommand{\glossaryname}{Glossary}
            \renewcommand{\acronymname}{Acronyms}
        }
    }
}

% English (same as American, but babel option "english")
\DeclareOption{english}{
    \@isenglishtrue
    \capitalizetrue
    \def\papername{Paper}
    \newcommand{\HH}{{H}almstad {U}niversity}
    \AtBeginDocument{
        \renewcommand{\lstlistingname}{Code listing}
        \renewcommand{\lstlistlistingname}{Code Listings}
        \crefname{listing}{Code listing}{Code listings}
        \crefname{paper}{Paper}{Papers}
        \addto\captionsenglish{
            \renewcommand{\contentsname}{Contents}
            \renewcommand{\listfigurename}{Figures}
            \renewcommand{\listtablename}{Tables}
            \renewcommand{\glossaryname}{Glossary}
            \renewcommand{\acronymname}{Acronyms}
        }
    }
}

% American
\DeclareOption{american}{
    \@isenglishtrue
    \capitalizetrue
    \def\papername{Paper}
    \newcommand{\HH}{{H}almstad {U}niversity}
    \AtBeginDocument{
        \renewcommand{\lstlistingname}{Code listing}
        \renewcommand{\lstlistlistingname}{Code Listings}
        \crefname{listing}{Code listing}{Code listings}
        \crefname{paper}{Paper}{Papers}
        \addto\captionsamerican{
            \renewcommand{\contentsname}{Contents}
            \renewcommand{\listfigurename}{Figures}
            \renewcommand{\listtablename}{Tables}
            \renewcommand{\glossaryname}{Glossary}
            \renewcommand{\acronymname}{Acronyms}
        }
    }
}

% Svenska
\DeclareOption{swedish}{
    \@isenglishfalse
    \capitalizefalse
    \def\papername{Artikel}
    \newcommand{\HH}{{H}ögskolan i {H}almstad}
    \AtBeginDocument{
        \renewcommand{\lstlistingname}{Kodlista}
        \renewcommand{\lstlistlistingname}{Kodlistor}
        \crefname{listing}{kodlista}{kodlistor}
        \crefname{equation}{ekvation}{ekvationer}
        \crefname{table}{tabell}{tabeller}
        \crefname{figure}{figur}{figurer}
        \crefname{section}{avsnitt}{avsnitt}
        \crefname{chapter}{kapitel}{kapitel}
        \crefname{appendix}{bilaga}{bilagor}
        \crefname{paper}{artikel}{artiklar}
        \renewcommand{\appendixname}{Bilaga}
        \addto\captionsswedish{
            \renewcommand{\appendixname}{Bilaga}
            \renewcommand{\glossaryname}{Ordlista}
            \renewcommand{\acronymname}{Akronymer}
        }
    }
}
\DeclareOption{tacda}{
    \if@isenglish
        \renewcommand{\logotype}{hh-logga-ENG}
        \renewcommand*{\course}{Bachelor Thesis}
        \renewcommand*{\program}{Computer Science and Engineering}
        \renewcommand*{\pcredits}{300 credits}
        \renewcommand*{\major}{Computer Science and Engineering}
        \renewcommand*{\mcredits}{15 credits}
    \else
        \renewcommand*{\course}{Kandidatuppsats}
        \renewcommand*{\program}{Civilingenjör i datateknik}
        \renewcommand*{\pcredits}{300 hp}
        \renewcommand*{\major}{Datateknik}
        \renewcommand*{\mcredits}{15 hp}
\fi
}

\DeclareOption{tacis}{
        \if@isenglish
           \renewcommand{\logotype}{hh-logga-ENG}
            \renewcommand*{\course}{Bachelor Thesis}
            \renewcommand*{\program}{Intelligent Systems}
            \renewcommand*{\pcredits}{300 credits}
            \renewcommand*{\major}{Electrical Engineering}
            \renewcommand*{\mcredits}{15 credits}
        \else
            \renewcommand*{\course}{Kandidatuppsats}
            \renewcommand*{\program}{Civilingenjör i intelligenta system}
            \renewcommand*{\pcredits}{300 hp}
            \renewcommand*{\major}{Elektroteknik}
            \renewcommand*{\mcredits}{15 hp}
        \fi
}

% Option for master thesis TACIS.ELDE:
\DeclareOption{tacis.elde}{
        \if@isenglish
           \renewcommand{\logotype}{hh-logga-ENG}
            \renewcommand*{\course}{Master's Thesis}
            \renewcommand*{\program}{Intelligent Systems}
            \renewcommand*{\pcredits}{300 credits}
            \renewcommand*{\major}{Electrical Engineering}
            \renewcommand*{\mcredits}{30 credits}
        \else
            \renewcommand*{\course}{Examensarbete}
            \renewcommand*{\program}{Civilingenjör i intelligenta system}
            \renewcommand*{\pcredits}{300 hp}
            \renewcommand*{\major}{Elektroteknik}
            \renewcommand*{\mcredits}{30 hp}
        \fi
}

\DeclareOption{tgdat}{
        \if@isenglish
            \renewcommand{\logotype}{hh-logga-ENG}
            \renewcommand*{\course}{Degree Project}
            \renewcommand*{\program}{Computer Engineer}
            \renewcommand*{\pcredits}{180 credits}
            \renewcommand*{\major}{Computer Science and Engineering}
            \renewcommand*{\mcredits}{15 credits}
        \else
            \renewcommand*{\course}{Examensarbete}
            \renewcommand*{\program}{Dataingenjör}
            \renewcommand*{\pcredits}{180 hp}
            \renewcommand*{\major}{Datateknik}
            \renewcommand*{\mcredits}{15 hp}
        \fi
}
\DeclareOption{tgelt}{
        \if@isenglish
            \renewcommand{\logotype}{hh-logga-ENG}
            \renewcommand*{\course}{Degree Project}
            \renewcommand*{\program}{Electrical Engineer}
            \renewcommand*{\pcredits}{180 credits}
            \renewcommand*{\major}{Electrical Engineering}
            \renewcommand*{\mcredits}{15 credits}
        \else
            \renewcommand*{\course}{Examensarbete}
            \renewcommand*{\program}{Elektroingenjör}
            \renewcommand*{\pcredits}{180 hp}
            \renewcommand*{\major}{Elektroteknik}
            \renewcommand*{\mcredits}{15 hp}
        \fi
}
\DeclareOption{tgmek}{
        \if@isenglish
            \renewcommand{\logotype}{hh-logga-ENG}
            \renewcommand*{\course}{Degree Project}
            \renewcommand*{\program}{Mechatronic Engineer}
            \renewcommand*{\pcredits}{180 credits}
            \renewcommand*{\major}{Mechatronic Engineering}
            \renewcommand*{\mcredits}{15 credits}
        \else
            \renewcommand*{\course}{Examensarbete}
            \renewcommand*{\program}{Mekatronikingenjör}
            \renewcommand*{\pcredits}{180 hp}
            \renewcommand*{\major}{Mekatronik}
            \renewcommand*{\mcredits}{15 hp}
        \fi
}


\ProcessOptions

% The mode can be overridden from the command line by defining \hhmode before
% the document is read, e.g.  latexmk -usepretex='\def\hhmode{midterm}' thesis
% (used by "make all-modes")
\ifdefined\hhmode \let\hh@mode\hhmode \fi

% Set the mode switches from the selected option
\def\hh@tmp{plan}\ifx\hh@mode\hh@tmp \plantrue \fi
\def\hh@tmp{midterm}\ifx\hh@mode\hh@tmp \midtermtrue \fi
\def\hh@tmp{final}\ifx\hh@mode\hh@tmp \finaltrue \fi

% Name of the report type, printed on the title page (empty for the final thesis)
\newcommand*{\reporttype}{%
    \if@isenglish
        \ifplan Project Plan\fi
        \ifmidterm Half-time Report\fi
    \else
        \ifplan Projektplan\fi
        \ifmidterm Halvtidsrapport\fi
    \fi
}

% New version of title page, uses options
\AtBeginDocument{
    \begin{titlepage}
        \AddToShipoutPictureBG*{%
  \AtPageLowerLeft{\makebox[200mm][r]{%
        \raisebox{10mm}[0mm][0mm]{%
        \includegraphics[width=32mm]{\logotype}}
    }}}
    \newgeometry{top = 3mm, bottom = 9mm, left = 65pt, right = 3mm}
    \hfill\includegraphics[width = 141mm]{hh_header_final_beta} \\
    \begin{tabular}{l}
    \vspace{3mm} \\
    \fontsize{32pt}{0pt} \textcolor{hhlpr}{\fontfamily{bch}\selectfont \textbf{\course}} \\
    \vspace{10pt} \\
    \fontsize{24pt}{0pt} \fontfamily{lmss}\selectfont \program \ \pcredits \\
    \vspace{70mm} \\
    \parbox{.8\linewidth}{\fontsize{30pt}{30pt} \fontfamily{lmss}\selectfont \@title} \\
    \vspace{10pt} \\
    \fontsize{20pt}{0pt} \fontfamily{lmss}\selectfont \@subtitle \\
    \iffinal\else
    \vspace{10pt} \\
    \fontsize{20pt}{0pt} \textcolor{hhlpr}{\fontfamily{lmss}\selectfont \reporttype} \\
    \fi
    \vspace{30pt} \\
    \fontsize{20pt}{0pt} \fontfamily{lmss}\selectfont \major \  \mcredits \\
    \vspace{10pt} \\
    \fontsize{15pt}{0pt} \selectfont Halmstad \@date
     \vspace{10pt} \\
     \fontsize{15pt}{0pt} \selectfont \@authorone
     \vspace{10pt} \\
     \fontsize{15pt}{0pt} \selectfont \@authortwo
     \vspace{10pt} \\
     \fontsize{15pt}{0pt} \selectfont \@authorthree
    \end{tabular}

    \vfill
    \hfill %\includegraphics[width = 32mm]{\logotype} \hspace{4.5mm} %7.5-3

    \end{titlepage}
    }

%% CLASS FILE LOADING

\LoadClass[a4paper,12pt,openright,twoside]{report}

%% PACKAGE LOADING

\RequirePackage[T1]{fontenc}                % modern font encoding
\RequirePackage{newtxtext}                  % main font: Times (as the HH Word template)
\RequirePackage{newtxmath}                  % math font matching Times
\RequirePackage[scaled=.88]{berasans}       % sans serif font
\RequirePackage[scaled=.82]{DejaVuSansMono} % monospace font (for code)
\RequirePackage{listings}                   % code listings
\RequirePackage{etoolbox}                   % fixing list of listings spacing
\RequirePackage{babel}                      % language specifics
\RequirePackage{geometry}                   % page layout
\RequirePackage{enumitem}                   % customising list appearance
\RequirePackage{graphicx}                   % including figures
\RequirePackage{amsmath}                    % advanced math typesetting
\RequirePackage{siunitx}                    % numbers and SI units, e.g. \qty{3.2}{\milli\ampere}
\RequirePackage{comment}                    % mode dependent environments (see below)
\RequirePackage{titlesec}                   % heading layout
\RequirePackage[skip=6pt]{parskip}          % no indent, 6 pt between paragraphs
\RequirePackage{ragged2e}                   % ragged right text with hyphenation
\RequirePackage[                            % subfigures with captions within figures
    font=small,                             % and customisation of captions
    labelfont=bf,
    margin=\parindent
]{caption}
\RequirePackage[                           % and subfigures with captions within figures
    font=small,
    labelfont=bf,
    margin=\parindent
]{subcaption}
\RequirePackage{xcolor}                     % selecting text color
\RequirePackage{emptypage}                  % empty pages should be blank
\RequirePackage{csquotes}                   % recommended for biblatex
\RequirePackage[
    backend=biber,
    style=ieee,
    maxbibnames=99,
    minbibnames=3,
    maxcitenames=2,
    mincitenames=1,
    citestyle=numeric-comp,
    sorting=none,
    dashed=false
]{biblatex}                                 % for bibliography
\RequirePackage{csvsimple}                  % tables from csv files
\RequirePackage{booktabs}                   % better formatting of tables
\RequirePackage{gnuplottex}                 % for generating gnuplots on the fly
\RequirePackage{hyperref}                   % interactive cross references
\ifcapitalize
    \RequirePackage[capitalize,noabbrev]{cleveref}   % automatic cross references
\else
    \RequirePackage[noabbrev]{cleveref}
\fi
\RequirePackage[acronym]{glossaries}        % create a glossary and acronym list

\RequirePackage{blindtext}

%% MODE DEPENDENT CONTENT
%
% Commands (for short text, chapter files, headings):
%   \IfMode{plan,midterm}{used in plan and midterm}{used otherwise}
%   \onlyin{midterm,final}{text}             text only in the listed modes
%   \inputin{midterm,final}{chapters/file}   input a file only in the listed modes
%   \ifplan ... \fi, \ifmidterm ... \fi, \iffinal ... \fi   (plain TeX switches)
%
% Environments (for longer passages, may contain sections, figures and listings):
%   onlyplan, onlymidterm, onlyfinal, notplan, notmidterm, notfinal
%   NB: \begin{...} and \end{...} must each stand alone on their own line.

\newif\ifhh@modefound
\newcommand*{\hh@checkmode}[1]{%
    \def\hh@tmp{#1}%
    \ifx\hh@tmp\hh@mode \hh@modefoundtrue \fi
}
\newcommand{\IfMode}[1]{%
    \hh@modefoundfalse
    \forcsvlist{\hh@checkmode}{#1}%
    \ifhh@modefound
        \expandafter\@firstoftwo
    \else
        \expandafter\@secondoftwo
    \fi
}
\newcommand{\onlyin}[2]{\IfMode{#1}{#2}{}}
\newcommand{\inputin}[2]{\IfMode{#1}{\input{#2}}{}}

\ifplan    \includecomment{onlyplan}    \excludecomment{notplan}
\else      \excludecomment{onlyplan}    \includecomment{notplan}    \fi
\ifmidterm \includecomment{onlymidterm} \excludecomment{notmidterm}
\else      \excludecomment{onlymidterm} \includecomment{notmidterm} \fi
\iffinal   \includecomment{onlyfinal}   \excludecomment{notfinal}
\else      \excludecomment{onlyfinal}   \includecomment{notfinal}   \fi

%% TEMPLATE HINTS
%   \sv{Inledning}   Swedish heading name in a green box after an English heading
%   \hint{(if applicable)}  short red hint text, e.g. in a heading
%   \begin{instructions} ... \end{instructions}   instruction text from the template
% Both disappear with the class option nohints. Write your own text outside the
% instructions environments (or delete them when you no longer need them).
\DeclareRobustCommand{\sv}[1]{%
    \ifhh@hints\ \allowbreak\fcolorbox{green}{green!10}{(Sv: #1)}\fi
}
\DeclareRobustCommand{\hint}[1]{\ifhh@hints\textcolor{red}{#1}\fi}
% Keep the Swedish heading names out of the table of contents and PDF bookmarks
\pretocmd{\tableofcontents}{\let\hh@sv\sv\let\sv\@gobble}{}{}
\apptocmd{\tableofcontents}{\let\sv\hh@sv}{}{}
\pdfstringdefDisableCommands{\let\sv\@gobble\let\hint\@gobble}
\ifhh@hints \includecomment{instructions} \else \excludecomment{instructions} \fi

%% CUSTOMISATION

% Page layout and body text as in the HH Word template (mall-examensarbeten-uppsatser):
% A4, margins 3 cm left/right and 2.5 cm top/bottom, Times 12 pt,
% line spacing 1.15 (Word "multiple 1.15" = 15.9 pt baseline distance),
% 6 pt space after paragraphs, no paragraph indent, left aligned.
\geometry{left=3cm, right=3cm, top=2.5cm, bottom=2.5cm,
    footskip=20pt}                          % page number position as in Word
\linespread{1.095}                          % 14.5 pt * 1.095 = 15.9 pt
\raggedbottom
\emergencystretch=3em                      % avoid overfull lines, e.g. long headings in the contents
\ifhh@justified\else
    \setlength{\RaggedRightRightskip}{0pt plus 4em}
    \AtBeginDocument{\RaggedRight}
\fi
\frenchspacing

% Headings in Gill Sans (free clone GilliusADF), not bold, as in the Word template:
% chapter 18 pt, section 14 pt, subsection 12 pt. The spacing below is calibrated so
% that the distances to the body text match the Word template (measured in its PDF).
\newcommand*{\headingfont}{\fontfamily{GilliusADF-LF}\fontseries{m}\fontshape{n}\selectfont}
\titleformat{\chapter}[hang]
    {\raggedright\headingfont\fontsize{18}{27}\selectfont}{\thechapter}{0.6em}{}
\titleformat{\section}
    {\raggedright\headingfont\fontsize{14}{21}\selectfont}{\thesection}{0.6em}{}
\titleformat{\subsection}
    {\raggedright\headingfont\fontsize{12}{18}\selectfont}{\thesubsection}{0.6em}{}
\titleformat{\subsubsection}
    {\raggedright\headingfont\fontsize{12}{18}\selectfont}{\thesubsubsection}{0.6em}{}
\titlespacing*{\chapter}{0pt}{-24.7pt}{3pt}
\titlespacing*{\section}{0pt}{5.7pt}{7.8pt}
\titlespacing*{\subsection}{0pt}{7.1pt}{6.3pt}
\titlespacing*{\subsubsection}{0pt}{7.1pt}{6.3pt}

% Roman page numbers from the beginning of the document
\pagenumbering{roman}
\setcounter{page}{3}

% Switch to Arabic page numbering at the beginning of the first numbered chapter
\newif\iffirstchapter
\firstchaptertrue
\let\std@chapter\@chapter
\def\@chapter{
    \iffirstchapter
        \pagenumbering{arabic}
        \firstchapterfalse
    \fi
    \std@chapter
}


% Add unnumbered chapters to table of contents and headings
\let\std@schapter\@schapter
\def\@schapter#1{
    \std@schapter{#1}
    \addcontentsline{toc}{chapter}{#1}
    \def\ch@ptermark{#1}
}

% Dotted line and tighter vertical spacing for chapters in the table of contents
\def\l@chapter#1#2{\@dottedtocline{1}{0em}{1.5em}{\bf #1}{\bf #2}}

% Support for included papers (for compiled PhD theses)
\newcounter{paper}
\setcounter{paper}{0}
\def\thepaper{\Roman{paper}}
\newenvironment{paper}[2]
{
    \refstepcounter{paper}
    \def\include@papername{#1}
    \chapter*{\papername~\thepaper}
    \label[paper]{#2}
}{
    \cleardoublepage
    \includepdf[pages=-]{\include@papername}
}

% Allow for two versions of title and authors – full and short
\def\title#1{\def\@title{#1}\def\@shorttitle{#1}}
\def\shorttitle#1{\def\@shorttitle{#1}}
\def\author#1{\def\@author{#1}\def\@shortauthor{#1}}
\def\shortauthor#1{\def\@shortauthor{#1}}

% Headers and footers
\def\ps@hhheadings{%
    \let\@evenfoot\@empty
    \let\@oddfoot\@empty
    \def\@evenhead{\small\thepage}
    \def\@oddhead{\small\textit{\ch@ptermark}\hfil\thepage}
    \def\chaptermark##1{\def\ch@ptermark{\chaptername\ \thechapter: ##1}}
}
\pagestyle{hhheadings}

% Itemize and enumerate: tighter and with other symbols
\setlist[enumerate]{itemsep=0mm, topsep=5pt, partopsep=0mm, parsep=0mm}
\setlist[enumerate,1]{label=\arabic*., ref=\arabic*}
\setlist[enumerate,2]{label=\alph*., ref=\alph*}
\setlist[enumerate,3]{label=\roman*., ref=\roman*}
\setlist[itemize]{itemsep=0mm, topsep=5pt, partopsep=0mm, parsep=0mm}
\setlist[itemize,1]{label=$\bullet$}
\setlist[itemize,2]{label=$\circ$}
\setlist[itemize,3]{label=$-$}

% Make \fullcite show all authors irrespectively of maxcitenames
\preto\fullcite{\AtNextCite{\defcounter{maxnames}{99}}}

% Colour palette
\definecolor{thesisblue}{rgb}{.15, .15, .6}
\definecolor{thesisred}{rgb}{.4, .05, .15}
\definecolor{thesisgreen}{rgb}{.2, .3, .2}

% Formatting of code listings
\lstset{
    frame=single,
    basicstyle=\fontsize{9}{10}\ttfamily,
    keywordstyle=\color{thesisblue}\bfseries,
    stringstyle=\color{thesisred},
    commentstyle=\color{thesisgreen},
    identifierstyle=\color{black},
    numberstyle=\fontsize{7}{8}\selectfont,
    literate=
        {á}{{\'a}}1 {é}{{\'e}}1 {í}{{\'i}}1 {ó}{{\'o}}1 {ú}{{\'u}}1
        {Á}{{\'A}}1 {É}{{\'E}}1 {Í}{{\'I}}1 {Ó}{{\'O}}1 {Ú}{{\'U}}1
        {à}{{\`a}}1 {è}{{\`e}}1 {ì}{{\`i}}1 {ò}{{\`o}}1 {ù}{{\`u}}1
        {À}{{\`A}}1 {È}{{\'E}}1 {Ì}{{\`I}}1 {Ò}{{\`O}}1 {Ù}{{\`U}}1
        {ä}{{\"a}}1 {ë}{{\"e}}1 {ï}{{\"i}}1 {ö}{{\"o}}1 {ü}{{\"u}}1
        {Ä}{{\"A}}1 {Ë}{{\"E}}1 {Ï}{{\"I}}1 {Ö}{{\"O}}1 {Ü}{{\"U}}1
        {â}{{\^a}}1 {ê}{{\^e}}1 {î}{{\^i}}1 {ô}{{\^o}}1 {û}{{\^u}}1
        {Â}{{\^A}}1 {Ê}{{\^E}}1 {Î}{{\^I}}1 {Ô}{{\^O}}1 {Û}{{\^U}}1
        {Ã}{{\~A}}1 {ã}{{\~a}}1 {Õ}{{\~O}}1 {õ}{{\~o}}1
        {œ}{{\oe}}1 {Œ}{{\OE}}1 {æ}{{\ae}}1 {Æ}{{\AE}}1 {ß}{{\ss}}1
        {ű}{{\H{u}}}1 {Ű}{{\H{U}}}1 {ő}{{\H{o}}}1 {Ő}{{\H{O}}}1
        {ç}{{\c c}}1 {Ç}{{\c C}}1 {ø}{{\o}}1 {å}{{\r a}}1 {Å}{{\r A}}1
        {€}{{\euro}}1 {£}{{\pounds}}1 {«}{{\guillemotleft}}1
        {»}{{\guillemotright}}1 {ñ}{{\~n}}1 {Ñ}{{\~N}}1 {¿}{{?`}}1
}

% Ensure list of listings have additional spacing between chapters to match figures and tables
\pretocmd{\chapter}{\addtocontents{lol}{\protect\addvspace{10\p@}}}{}{}

% Settings for hyperref: setting all the links black for best printing. They will still be clickable in the PDF. Adds numbers to bookmarks
\hypersetup{
    colorlinks=true,
    linkcolor=black,        % internal links (change box color with linkbordercolor)
    citecolor=black,        % links to bibliography
    filecolor=black,        % file links
    urlcolor=black,         % external links
    bookmarksnumbered=true  % include chapter, section and subsection numbers in bookmarks
}

% Fix list of listings not rendering correctly for LaTeX generated by Sphinx, which uses literalblock instead of lstlisting
\let\l@literalblock\l@lstlisting

% Renew \lstlistoflistings command to avoid issues with incorrect headers for long lists
% Uses unnumbered chapter instead of a float like in the original source code.
% Based on source code for listings package https://ctan.uib.no/macros/latex/contrib/listings/listings.dtx line: 14635
\renewcommand*{\lstlistoflistings}{%
       \begingroup%
       \chapter*{\lstlistlistingname}%
       \parskip\z@\parindent\z@\parfillskip \z@ \@plus 1fil%
       \@starttoc{lol}%
       \endgroup%
       }%

% Print the lists of figures, tables and listings only when they have entries
% (e.g. no empty list of listings in the half-time report). Which lists are used
% is recorded in the .aux file, so this takes effect from the second compilation.
\pretocmd{\addcontentsline}{\hh@markused{#1}}{}{}
\newcommand*{\hh@markused}[1]{%
    \ifcsdef{hh@written@#1}{}{%
        \csgdef{hh@written@#1}{}%
        \protected@write\@auxout{}{\string\csgdef{hh@used@#1}{}}%
    }%
}
\newcommand*{\hh@iflistused}[2]{\ifcsdef{hh@used@#1}{#2}{}}
\let\hh@listoffigures\listoffigures
\let\hh@listoftables\listoftables
\let\hh@lstlistoflistings\lstlistoflistings
\renewcommand*{\listoffigures}{\hh@iflistused{lof}{\hh@listoffigures}}
\renewcommand*{\listoftables}{\hh@iflistused{lot}{\hh@listoftables}}
\renewcommand*{\lstlistoflistings}{\hh@iflistused{lol}{\hh@lstlistoflistings}}
