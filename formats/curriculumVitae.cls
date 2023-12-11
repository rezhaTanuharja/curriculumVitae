% =============================================================================
% formats/curriculumVitae.cls
%
% This is a modular and extensible document class for curriculum vitae.
%
% Rezha Adrian Tanuharja -- rezha.tanuharja@outlook.com
% =============================================================================

% ----- create a new class based on the document class article ----------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{formats/curriculumVitae}[2023/12/11 v2.0 CV]

\LoadClass{article}

% ----- facilitate different stylings -----------------------------------------

\newcommand{\styling}{consultant}

\DeclareOption{consultant}{
  \renewcommand{\styling}{consultant}
}

\DeclareOption{analyst}{
  \renewcommand{\styling}{analyst}
}

\ProcessOptions\relax

\input{formats/includes/packages}

% ----- general formatting ----------------------------------------------------

\geometry{%
  paper={a4paper},                        % most common printing paper size
  vmargin={10mm,10mm},                    % smaller top and bottom whitespace
  hmargin={10mm,10mm}                     % smaller left and right whitespace
}

\pagestyle{empty}                         % remove page numbers
\setlength{\parindent}{0pt}               % remove indentations

\newlength{\nominalGap}                   % all gaps are multiples of this
\setlength{\nominalGap}{1.0em}            % set nominal gap to one line

\newlength{\bulletGap}                    % gap between lines in a bullet list
\setlength{\bulletGap}{-0.2\nominalGap}   % make gap tighter

\newcommand{\inlineSep}{, }

% ----- hyperlinks formatting -------------------------------------------------

\hypersetup{%
  colorlinks=false,                       % remove default link color
  linkcolor=black,                        % color link black, like normal text
  pdfborder={0 0 0}                       % remove border around links
}

% ----- command to print list -------------------------------------------------

\newcommand{\printList}[2][\vspace{\nominalGap}]{%
  \def\listsep{\def\listsep{#1}}%
  \renewcommand{\do}[1]{\listsep ##1}%
  \dolistloop{#2}%
}

% ----- sections formatting ---------------------------------------------------

\input{formats/\styling/general}
\input{formats/\styling/heading}
\input{formats/\styling/education}
\input{formats/\styling/experience}
\input{formats/\styling/skills}
