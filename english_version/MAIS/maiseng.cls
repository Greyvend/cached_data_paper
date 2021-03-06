%% MAIS custom style
%% Very early version: (c) ltwood, 2003
%% Modified and powered 7.03.09: (c) ltwood, 2009

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{maiseng}[2004/02/16 v1.4f 57 Standard LaTeX document class]
\LoadClass[12pt,twoside]{article}

\usepackage{fancyhdr}
\usepackage{ifpdf}
\usepackage{textcomp}

%% Language resources

\def\mybibname{\CYRL\cyri\cyrt\cyre\cyrr\cyra\cyrt\cyru\cyrr\cyra}
\def\myshortname{%%%
  \CYRM\cyro\cyrd\cyre\cyrl.
  \cyri{}
  \cyra\cyrn\cyra\cyrl\cyri\cyrz{}
  \cyri\cyrn\cyrf\cyro\cyrr\cyrm.
  \cyrs\cyri\cyrs\cyrt\cyre\cyrm.{}
}
\def\mylongname{%%%
  \CYRM\cyro\cyrd\cyre\cyrl\cyri\cyrr\cyro\cyrv\cyra\cyrn\cyri\cyre{}
  \cyri{}
  \cyra\cyrn\cyra\cyrl\cyri\cyrz{}
  \cyri\cyrn\cyrf\cyro\cyrr\cyrm\cyra\cyrc\cyri\cyro\cyrn\cyrn\cyrery\cyrh{}
  \cyrs\cyri\cyrs\cyrt\cyre\cyrm{}
}
\def\myrecname{\cyrp\cyro\cyrl\cyru\cyrch\cyre\cyrn\cyra}
\def\myvolname{\CYRT.}
\def\myUDCname{UDC}%\CYRU\CYRD\CYRK}

%% Custom Settings

\renewenvironment{abstract}{\vspace{-1cm}\small\quotation}{\endquotation}

%% ����� � ������� ��������
\renewcommand{\thesection}{\arabic{section}.}
\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}.}
\renewcommand{\thesubsubsection}{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}.}

%% �������� �������� ������ ����������
\renewcommand{\refname}{\mybibname}

%% ����� � ������ ����������
\makeatletter
\renewcommand{\@biblabel}[1]{#1.\hfill}
\makeatother

%% ����� � ������ � ������������� �������
\makeatletter
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1. #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1. #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\makeatother

%% Style Settings

\newcounter{firstpage}
\newcounter{lastpage}
\newcounter{volume}
\newcounter{tnumber}
\newcounter{year}

\setcounter{firstpage}{1}

\def\maistitleval{???}
\def\maisshorttitleval{???}
\def\maisauthorval{???}
\def\maisauthorcrval{???}
\def\maisdateval{???}
\def\maisydateval{???}
\def\maisUDCval{???}
\def\maistitlruval{???}
\def\maisauthorruval{???}
\def\maisruaffiliationval{???}
\def\maisaffiliationval{???}
\def\maisemailval{???}
\def\maisrefruval{???}
\def\maisauthorinformval{???}
\def\maiskeywordsval{???}
\def\maisrukeywordsval{???}

\def\maisvolume#1{\setcounter{volume}{#1}}
\def\maisnumber#1{\setcounter{tnumber}{#1}}
\def\maisyear#1{\setcounter{year}{#1}}
\def\firstpage#1{\setcounter{firstpage}{#1} \setcounter{page}{#1}}

\def\title#1{\def\maistitleval{#1}}
\def\shorttitle#1{\def\maisshorttitleval{#1}}
\def\author#1{\def\maisauthorval{#1}}
\def\authorcr#1{\def\maisauthorcrval{#1}}
\def\date#1{\def\maisdateval{#1}}
\def\ydate#1{\def\maisydateval{#1}}%
\def\UDC#1{\def\maisUDCval{#1}}
\def\rutitle#1{\def\maistitlruval{#1}}
\def\ruauthor#1{\def\maisauthorruval{#1}}
\def\affiliation#1{\def\maisaffiliationval{#1}}
\def\ruaffiliation#1{\def\maisruaffiliationval{#1}}
\def\email#1{\def\maisemailval{#1}}
\def\ruabstract#1{\def\maisrefruval{#1}}
\def\authorinform#1{\def\maisauthorinformval{#1}}
\def\keywords#1{\def\maiskeywordsval{#1}}
\def\rukeywords#1{\def\maisrukeywordsval{#1}}

\InputIfFileExists{mais.opt}{}{
  \maisvolume{0}
  \maisnumber{0}
  \maisyear{2000}
}

\ifpdf
 \topmargin=-1.3cm
 \else
  \topmargin=-0.7cm
 \fi
% ������ ��� pdf

\textheight=23cm
\textwidth=15.8cm
\headheight=12pt
\addtolength{\headheight}{\baselineskip}

\fancypagestyle{hdrpage}{\selectlanguage{russian}
  \fancyhead{}
  \fancyhead[L]{\footnotesize {\em\myshortname}~\myvolname\,{\bf\thevolume}, \textnumero,{\bf\thetnumber} (\theyear) \thefirstpage--\thelastpage
  \\ \copyright {\it \maisauthorcrval,} \maisydateval}
  \fancyfoot[C]{\thepage}
  \renewcommand{\headrulewidth}{0pt}
}

\fancypagestyle{plain}{
  \fancyhead{}
  \fancyhead[LE,RO]{\thepage}
  \fancyhead[RE]{\selectlanguage{russian} {\em\mylongname}~\myvolname\,{\bf\thevolume}, \textnumero\,{\bf\thetnumber} (\theyear)}
  \fancyhead[LO]{\maisshorttitleval}
  \fancyfoot{}
}
\pagestyle{plain}

\def\maketitle{
  \thispagestyle{hdrpage}
  \noindent \myUDCname~\maisUDCval
  \vskip 0pt \null
  \begin{center}
    {\Large\bf\maistitleval}
  \end{center}
  \vskip 8pt \null
  \centerline{\maisauthorval}
  \begin{center}
        {\em \maisaffiliationval}
  \end{center}
 \begin{center}
  {\em e-mail: \maisemailval}
  \end{center}
  %\centerline{\em e-mail: \maisemailval}
  \vskip -3pt
  \centerline{\em received~\maisdateval~\maisydateval}
  \vskip 6pt
  \begin{center}
    {{\bf Keywords:} \ \ \maiskeywordsval}
  \end{center}
  \vskip 28pt
}

\def\maismakefooter{
  \begin{center}
  {\large\bf
    {\selectlanguage{russian}\maistitlruval}
  }
  \end{center}
  \vskip 12pt \noindent
  \centerline{\selectlanguage{russian}\maisauthorruval}
  %\vskip 12pt \noindent
  \begin{center}
        {\em \selectlanguage{russian}\maisruaffiliationval}
  \end{center}
  \begin{center}
  {{\selectlanguage{russian}\bf �������� �����: \ }
    {\selectlanguage{russian}\maisrukeywordsval}
  }
  \end{center}
  \vskip 12pt \noindent
  {\par{\selectlanguage{russian}\maisrefruval}}
  \vskip 12pt \noindent
  \begin{center}
  {\selectlanguage{russian}{\bf �������� �� ������: \ }
    {\selectlanguage{russian}\maisauthorinformval}
  }
  \end{center}
}

\makeatletter
\def\lastpagelabel{
  \addtocounter{page}{-1}
  \immediate\write\@auxout{\string\setcounter{lastpage}{\thepage}}
  \addtocounter{page}{1}
}
\makeatother

\AtEndDocument{
  \maismakefooter
  \clearpage\lastpagelabel
}
\evensidemargin=0.5cm  %��� ������ � ps
\oddsidemargin=-0.3cm    %��� ������ � ps

