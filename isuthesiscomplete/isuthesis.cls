% isuthesis class based on isuthesis1file style file
% Revision 1.03 11/02/14 13:51:00  jastruss
% -- Joe Struss (2011/2/14)
% Revision 1.02 11/01/08 13:12:00  jastruss
% -- Joe Struss (2011/1/8)
%%
%% LaTeX document package `isuthesis', for use with LaTeX2e.
%% This is a package that is used with the report class to
%%   create a thesis at Iowa State University.
%%
%% COPYRIGHT 2011, by Joe Struss (jastruss@iastate.edu)
%%
%% Copying of part or all of any file in the iastatethesis class
%% is allowed under the following conditions only:
%% (1) You may freely distribute unchanged copies of the files. Please
%%     include the any or all documentation when you do so.
%% (2) You may modify a renamed copy of any file, but only for personal
%%     use or use within an organization.
%% (3) You may copy fragments from the files, for personal use or for use
%%     in a macro package for distribution, as long as credit is given
%%     where credit is due.
%%
%% You are NOT ALLOWED to take money for the distribution or use of
%% these files or modified versions or fragments thereof, except for
%% a nominal charge for copying etc.
%%

\def\fileversion{1.03}
\def\filedate{2011/02/14}
\typeout{%
  Document Class: isuthesis \filedate \space v\fileversion \space (Joe Struss)}


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{isuthesis}[2011/02/14]
%  Requires the Geometry Package

%  Thesis looks much like report
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions
\LoadClass{report}

%Added packages to style file for ease in use and downloading (JAS09)

%\usepackage{setspace}

%%%%
%% FILE:   setspace.sty in SYS2.TEX.PUB.ISULATEX.STYLES
%% AUTHOR: Erica M. S. Harris
%% DATE:   April 1990
%% DESCR:  LaTeX Document style option "setspace"
%%         Usage:  \documentstyle[...,setspace,...]{...}
%%         Based on the doublespace option created by Stephen Page.
%%
%%         This style option provides commands and environments for doing
%%         double and  one-and-a-half spacing based on pt size.
%%
%%         Single spacing is the default.
%%
%%         Three commands, \doublespacing, \onehalfspacing, and
%%         \singlespacing, are for use in the preamble to set the overall
%%         spacing for the document.  If a different spacing is required then
%%         the \setstretch{baselinestretch} command can be used in the
%%         preamble to set the baselinestretch appropriately.  The default
%%         spacing with this style option is single spacing.
%%
%%         Three environments, singlespace, onehalfspace, and doublespace,
%%         allow the spacing to be changed within the document.  Both the
%%         onehalfspace and doublespace environments are intended to increase
%%         the spacing, so the onehalfspace environment should not be used in
%%         a double spaced document.  If an increased spacing different from
%%         one-and-a-half or double spacing is required then the spacing
%%         environment can be used.  The spacing environment takes one
%%         argument which is the larger baselinestretch to use,
%%         e.g., \begin{spacing}{2.5}.
%%
%%         \footins is adjusted the same as \parskip - appears to work. Lose
%%         stretch parts but don't consider that to be crucial
%%
%%         Removed code for altering spacing before and after displayed
%%         equations - just looked too much.
%%
%% MODS:
%%
%% PLEASE REPORT ANY BUGS
%%
%%   Old Documentation follows:
%%         1. A new environment "singlespace" is provided, within which single
%%            spacing will apply.
%%            JFL - changed so that it works in regular text and so that
%%            vertical space before and after is correctly computed
%%         2. Double spacing is turned off within footnotes and floats (figures
%%            and tables).
%%         3. Proper double spacing happens below tabular environments and in
%%            other places where LaTeX uses a strut.
%%         4. Slightly more space is inserted before footnotes.
%%         5. JFL - fixes spacing before and after displayed math
%%
%%
%%    mods:   Jean-Francois Lamy
%%            lamy@ai.toronto.edu
%%            lamy@utai.uucp
%%
%% POSSIBLE BUGS:
%%    . Increasing struts may possibly cause some other obscure part of
%%      formatting to fall over.
%%    . \begin{singlespace}\begin{quote} produces the wrong spacing before
%%      the quote (extra glue is inserted).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\doublespacing{\ifcase \@ptsize \relax % 10pt
    \def\baselinestretch{1.667}
  \or % 11pt
    \def\baselinestretch{1.618}
  \or % 12pt
    \def\baselinestretch{1.655}
  \fi}

\def\onehalfspacing{\ifcase \@ptsize \relax % 10pt
    \def\baselinestretch{1.25}
  \or % 11pt
    \def\baselinestretch{1.213}
  \or % 12pt
    \def\baselinestretch{1.241}
  \fi}

\def\singlespacing{\def\baselinestretch{1}}

\def\setstretch#1{\renewcommand{\baselinestretch}{#1}}

%---Stretch the baseline BEFORE calculating the strut size. This improves
%   spacing below tabular environments etc., probably...
%   Comments are welcomed.

\def\@setsize#1#2#3#4{\@nomath#1 \let\@currsize#1 %
   \baselineskip #2 %
   \baselineskip\baselinestretch\baselineskip
   \parskip\baselinestretch\parskip
   \setbox\strutbox\hbox{\vrule height.7\baselineskip
      depth.3\baselineskip width\z@}%
   \skip\footins \baselinestretch\skip\footins
   \normalbaselineskip\baselineskip#3#4}

%---Increase the space between last line of text and footnote rule.
%\skip\footins 20pt plus4pt minus4pt

%---Reset baselinestretch within footnotes and floats.

\def\@xfloat#1[#2]{\ifhmode \@bsphack\@floatpenalty -\@Mii\else
   \@floatpenalty-\@Miii\fi\def\@captype{#1}\ifinner
      \@parmoderr\@floatpenalty\z@
    \else\@next\@currbox\@freelist{\@tempcnta\csname ftype@#1\endcsname
       \multiply\@tempcnta\@xxxii\advance\@tempcnta\sixt@@n
       \@tfor \@tempa :=#2\do
                        {\if\@tempa h\advance\@tempcnta \@ne\fi
                         \if\@tempa t\advance\@tempcnta \tw@\fi
                         \if\@tempa b\advance\@tempcnta 4\relax\fi
                         \if\@tempa p\advance\@tempcnta 8\relax\fi
         }\global\count\@currbox\@tempcnta}\@fltovf\fi
    \global\setbox\@currbox\vbox\bgroup
    \def\baselinestretch{1}\@normalsize
    \boxmaxdepth\z@
    \hsize\columnwidth \@parboxrestore}

\long\def\@footnotetext#1{\insert\footins{\def\baselinestretch{1}\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
   \edef\@currentlabel{\csname p@footnote\endcsname\@thefnmark}\@makefntext
    {\rule{\z@}{\footnotesep}\ignorespaces
      #1\strut}}}

% A single spaced quote (say) is done by surrounding singlespace with quote.
%
\def\singlespace{%
\vskip\baselineskip%
\def\baselinestretch{1}%
\ifx\@currsize\normalsize\@normalsize\else\@currsize\fi%
\vskip-\baselineskip}

\def\endsinglespace{\par}

%  spacing, doublespace and onehalfspace all are meant to INCREASE the
%  spacing (i.e. calling onehalfspace from within doublespace will not
%  produce a graceful transition between spacings)
%
\def\spacing#1{\par%
 \def\baselinestretch{#1}%
 \ifx\@currsize\normalsize\@normalsize\else\@currsize\fi}

\def\endspacing{\par%
 \vskip \parskip%
 \vskip \baselineskip%
 \endgroup%
 \vskip -\parskip%
 \vskip -\baselineskip%
 \begingroup}

% one and a half spacing is 1.5 x pt size
\def\onehalfspace{\ifcase \@ptsize \relax  % 10pt
     \spacing{1.25}
   \or % 11pt
     \spacing{1.213}
   \or % 12pt
     \spacing{1.241}
   \fi}
\let\endonehalfspace=\endspacing

% double spacing is 2 x pt size
\def\doublespace{\ifcase \@ptsize \relax % 10pt
    \spacing{1.667}
  \or % 11pt
    \spacing{1.618}
  \or % 12pt
    \spacing{1.655}
  \fi}
\let\enddoublespace=\endspacing
%%%%

% New Way of setting pages with Geometry
%  replaces most of the setlength commands below (JAS05 / JAS09)
\usepackage{geometry}
\geometry{letterpaper, left=1.25in, top=0.55in, right=1.02in, bottom=1in, includehead=true} 
% (JAS11) old values: top=1.22 and no includehead option

%\usepackage{isumacros}

%%%%
%% Subpackage: isumacros.sty for use with the isuthesis package.
%%
%% LaTeX document package `isuthesis', for use with LaTeX2e.
%% This is a package that is used with the report class to
%%   create a thesis at Iowa State University.
%%
%% COPYRIGHT 1997, by Joe Struss (jastruss@iastate.edu)
%%
%% Copying of part or all of any file in the isuthesis.sty package
%% including isumacros.sty, thesisreport.sty and isuthesis.sty
%% is allowed under the following conditions only:
%% (1) You may freely distribute unchanged copies of the files. Please
%%     include the any or all documentation when you do so.
%% (2) You may modify a renamed copy of any file, but only for personal
%%     use or use within an organization.
%% (3) You may copy fragments from the files, for personal use or for use
%%     in a macro package for distribution, as long as credit is given
%%     where credit is due.
%%
%% You are NOT ALLOWED to take money for the distribution or use of
%% these files or modified versions or fragments thereof, except for
%% a nominal charge for copying etc.
%%
%    ****************************************
%    *           INITIALIZATION             *
%    ****************************************
%
% Default initializations

%\ps@plain                          % 'plain' page style.
\pagenumbering{arabic}             % Arabic page numbers.
\onecolumn                         % Single column.
\if@twoside\else\raggedbottom\fi   % Ragged bottom unless twoside option.

%   ***********************************************
%   *    Local (Iowa State University) macros     *
%   ***********************************************

%\pagestyle{headings}

% singlespace environment
\def\singlespace{\vskip\baselineskip \def\baselinestretch{1}\@normalsize
      \vskip-\baselineskip}
\def\endsinglespace{\par}

% \@setsize modified to multiply \baselineskip by \baselinestretch
\def\@setsize#1#2#3#4{\@nomath#1\let\@currsize#1
  \baselineskip #2 \baselineskip\baselinestretch\baselineskip
  \setbox\strutbox\hbox{\vrule height.7
    \baselineskip depth.3\baselineskip width\z@}%
  \normalbaselineskip\baselineskip#3#4}

% Floats are singlespaced
\def\@xfloat#1[#2]{\ifhmode \@bsphack\@floatpenalty -\@Mii
   \else \@floatpenalty-\@Miii\fi\def\@captype{#1}
   \ifinner \@parmoderr\@floatpenalty\z@
   \else\@next\@currbox\@freelist{\@tempcnta
   \csname ftype@#1\endcsname
   \multiply\@tempcnta\@xxxii\advance\@tempcnta\sixt@@n
   \@tfor \@tempa :=#2\do
   {\if\@tempa h\advance\@tempcnta \@ne\fi
   \if\@tempa t\advance\@tempcnta \tw@\fi
   \if\@tempa b\advance\@tempcnta 4\relax\fi
   \if\@tempa p\advance\@tempcnta 8\relax\fi }
   \global\count\@currbox\@tempcnta}\@fltovf\fi
% Updated from \global\setbox\@currbox\vbox\bgroup to handle color package - JAS 1 Nov 06
   \global\setbox\@currbox\color@vbox\normalcolor\vbox\bgroup
%   \def\baselinestretch{1}\@normalsize % removed 12 Feb 90 - causing problems
                                        % with using different sized text and
                                        % footnotes in tabular in table.
   \baselineskip 14.5pt % Added 12 Feb 90
   \normalbaselineskip\baselineskip % Added 12 Feb 90
   \setbox\strutbox\hbox{\vrule height 0.7\baselineskip  % Added 12 Feb 90
        depth 0.3\baselineskip width \z@}
   \let\@currsize\normalsize % Added 13 Feb 90
   \def\baselinestretch{1}   % Added 13 Feb 90
%    \def\baselinestretch{1}\@setsize\normalsize{14.5pt}\xiipt\@xiipt
%   \boxmaxdepth\z@ % commented out 15 Dec 87
   \hsize\columnwidth \@parboxrestore}

% Footnotes are singlespaced
\long\def\@footnotetext#1{\insert\footins%
 {\def\baselinestretch{1}\footnotesize%
 \interlinepenalty\interfootnotelinepenalty%
 \splittopskip\footnotesep \splitmaxdepth%
 \dp\strutbox \floatingpenalty \@MM \hsize\columnwidth%
 \@parboxrestore \edef%
 \@currentlabel{\csname p@footnote\endcsname\@thefnmark}
 \@makefntext{\rule{\z@}{\footnotesep}\ignorespaces #1\strut}}}

% TABLE AND FIGURE CAPTIONS
% Same as \caption but calls \@isucaption instead

\def\isucaption{\refstepcounter\@captype
   \@dblarg{\@isucaption\@captype}}

% Width to be used for setting the caption. Can be set by the user.
\newdimen\captionwidth \captionwidth=\textwidth

% the was the#1 line was changed to put the word Figure or Table in lot/lof
\long\def\@isucaption#1[#2]#3{\par
  %\baselineskip 14.5 pt
  \addcontentsline {\csname ext@#1\endcsname}{#1}
  {\protect\numberline{\csname fnum@#1\endcsname}{\ignorespaces #2}}%was the#1
  \begingroup
    \@parboxrestore
    \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}
    \par\vspace{1.7ex}
  \endgroup}

% \isucontinuecaption allows easy captioning of continued tables and figures.
% No text supplied by user. Text is '(Continued)'. No ':' after table/figure
% number and current table/figure number is used without being stepped.
%\newif\if@continued \@continuedfalse
\def\isucontinuecaption{\@isucontinuecaption\@captype}
\def\@isucontinuecaption#1{\par %\baselineskip 14.5pt
      \begingroup
         \global\@continuedtrue
         \@parboxrestore
         \@makecaption{\csname fnum@#1\endcsname}{(Continued)}%
         \par \vspace{1.7ex}%
      \endgroup}

% \@makecaption{NUMBER}{TEXT} : Macro to make a figure or table caption.
%      NUMBER : Figure or table number--e.g., 'Figure 3.2'
%      TEXT   : The caption text.
%  Macro should be called inside a \parbox of right width, with \normalsize.
% changed 25 Jun 86 to fix according to Howard Trickey:
% instead of \unhbox\@tempboxa\par we do #1: #2\par
% We continue to use the old way in order to handle table footnotes on captions
% - if don't use \unhbox then footnotetext gets output twice and footnote  
% number once with the second value.

\long\def\@makecaption#1#2{ \vskip 10pt
    \newbox\@tempboxb
    \setbox\@tempboxa\hbox{#2}    % #2 is caption
    \setbox\@tempboxb\hbox{#1~~~} % #1 is Figure n.n: or Table n.n:
    \advance\captionwidth by -\wd\@tempboxb
% IF width of caption text > (\captionwidth - width of caption heading)
% THEN set caption text in a parbox
% ELSE set as is
% Complete caption is centered in both cases.
    \ifdim\captionwidth < \wd\@tempboxa
      \hbox to \hsize{\hfil\box\@tempboxb%   
             \parbox[t]{\captionwidth}{\unhbox\@tempboxa}\hfil}
   \else
      \hbox to \hsize{\hfil\box\@tempboxb\box\@tempboxa\hfil}
   \fi}

% SPECIAL CHAPT COMMAND (NORMAL)
% Special chapter command for outputting a chapter title without 'Chapter'
% and the number. Unlike \chapter* the title is included in the toc.
\def\specialchapt{\clearpage   % Start new page.
  \global\@topnum\z@             % Prevent figures from going to top of page.
  \@afterindenttrue              % Indent first paragraph.
  \@dblarg{\@specialchapt}}

\def\@specialchapt[#1]#2{
  \typeout{#2}
  \let\@tempchapapp=\@chapapp
  \addtocontents{toc}{\def\protect\@chapapp{}}
  \vspace*{15pt}{\centering\large\bfseries #2\par}      % change normalsize to large to (JAS11) 50 to 15
  \vspace*{40pt}                                        %   match chapter, JAS
  \addcontentsline{toc}{chapter}{#1}
  \addtocontents{toc}{\def\protect\@chapapp{\@tempchapapp}}}

% SPECIAL CHAPTER COMMAND (FOR USE WITH PARTS)
% Special chapter command for outputting a chapter title without 'Chapter'
% and the number. Unlike \chapter* the title is included in the toc.
\def\specialchapter{\clearpage   % Start new page.
  \global\@topnum\z@             % Prevent figures from going to top of page.
  \@afterindenttrue              % Indent first paragraph.
  \@dblarg{\@specialchapter}}

\def\@specialchapter[#1]#2{
  \typeout{#2}
  \let\@tempchapapp=\@chapapp
  \addtocontents{toc}{\def\protect\@chapapp{}}
  \vspace*{15pt}{\centering\large\bfseries #2\par}      % change normalsize to large to (JAS11) 50 to 15
  \vspace*{40pt}                                        %   match chapter, JAS
  \addcontentsline{toc}{chapter}{\protect\numberline{}#1} % added numberline, JAS
  \addtocontents{toc}{\def\protect\@chapapp{\@tempchapapp}}}

% SPECIAL PART COMMAND
% Puts part title out without 'Part' and part number. Enters title into table
% of contents at correct level.
\def\specialpart#1{\clearpage
    \global\@topnum\z@
    \@afterindenttrue
    \typeout{#1}
    \addcontentsline{toc}{specialpart}{#1}            % change normalsize to large to
    \vspace*{15pt}{\centering \Large \bf #1\par}      %  match part, JAS (JAS11) 50 to 15
    \vspace*{40pt}}

\newif\if@specialpart \@specialpartfalse
\def\l@specialpart#1#2{
    \if@specialpart \addvspace{4pt plus 2pt}
    \else \addvspace{2em plus 1pt}
          \global\@specialparttrue
    \fi
    \begingroup
       \@tempdima 5.75em \relax
       \rightskip\@tocrmarg
       \parfillskip -\rightskip
       \parindent\z@ \leftskip\@tempdima
       {\normalsize\bf\leavevmode
        \hbox{}\hskip -\leftskip #1\nobreak
        \leaders\hbox{$\m@th\mkern\@dotsep mu.\mkern\@dotsep mu$}\hfill
        \nobreak \hbox to \@pnumwidth{\hss #2}\par}
    \endgroup}

% SINGLE APPENDIX
%
\newif\if@singleappendix \@singleappendixfalse
\def\singleappendix{\par
    \@singleappendixtrue
    \def\@chapapp{APPENDIX}
    \def\thechapter{}
    \addtocontents{toc}{\def\protect\@chapapp{APPENDIX}}
    \setcounter{chapter}{0}
    \setcounter{section}{0}
    \def\theequation{A.\arabic{equation}}
    \def\thetable{A.\@arabic\c@table}
    \def\thefigure{A.\@arabic\c@figure}}

% SUPERSCRIPTS AND SUBSCRIPTS
% Declaration which causes superscripts and subscripts to be output at normal
% text size
\def\bigscript{
  \scriptfont0=\textfont0
  \scriptscriptfont0=\textfont0
  \scriptfont1=\textfont1
  \scriptscriptfont1=\textfont1
  \scriptfont2=\textfont2
  \scriptscriptfont2=\textfont2
  \scriptfont3=\textfont3
  \scriptscriptfont3=\textfont3
  \def\xiipt{\textfont\z@\twlrm
    \scriptfont\z@\twlrm \scriptscriptfont\z@\twlrm
  \textfont\@ne\twlmi \scriptfont\@ne\twlmi \scriptscriptfont\@ne\twlmi
  \textfont\tw@\twlsy \scriptfont\tw@\twlsy \scriptscriptfont\tw@\twlsy
  \textfont\thr@@\tenex \scriptfont\thr@@\tenex \scriptscriptfont\thr@@\tenex
  \def\unboldmath{\everymath{}\everydisplay{}\@nomath\unboldmath
            \textfont\@ne\twlmi
            \textfont\tw@\twlsy \textfont\lyfam\twlly
            \@boldfalse}\@boldfalse
  \def\boldmath{\@ifundefined{twlmib}{\global\font\twlmib\@mbi\@magscale1\global
          \font\twlsyb\@mbsy \@magscale1\global\font
           \twllyb\@lasyb\@magscale1\relax\@addfontinfo\@xiipt
                {\def\boldmath{\everymath
                  {\mit}\everydisplay{\mit}\@prtct\@nomathbold
                  \textfont\@ne\twlmib \textfont\tw@\twlsyb
                  \textfont\lyfam\twllyb\@prtct\@boldtrue}}}{}\@xiipt\boldmath}%
  \def\prm{\fam\z@\twlrm}%
  \def\pit{\fam\itfam\twlit}\textfont\itfam\twlit \scriptfont\itfam\egtit
     \scriptscriptfont\itfam\sevit
  \def\psl{\fam\slfam\twlsl}\textfont\slfam\twlsl
       \scriptfont\slfam\tensl \scriptscriptfont\slfam\tensl
  \def\pbf{\fam\bffam\twlbf}\textfont\bffam\twlbf
     \scriptfont\bffam\ninbf \scriptscriptfont\bffam\ninbf
  \def\ptt{\fam\ttfam\twltt}\textfont\ttfam\twltt
     \scriptfont\ttfam\nintt \scriptscriptfont\ttfam\nintt
  \def\psf{\fam\sffam\twlsf}\textfont\sffam\twlsf
      \scriptfont\sffam\tensf \scriptscriptfont\sffam\tensf
  \def\psc{\@getfont\psc\scfam\@xiipt{\@mcsc\@magscale1}}%
  \def\ly{\fam\lyfam\twlly}\textfont\lyfam\twlly
     \scriptfont\lyfam\egtly \scriptscriptfont\lyfam\sixly
   \@setstrut \rm}
} %end bigscript

% Singlespaced hanging paragraph environment for uncited bibliographies.
\def\hangpar{\par \def\baselinestretch{1}\@normalsize
    \raggedright \parindent=0pt \parskip=12pt
    \everypar{\hangindent=24pt \hangafter=1}}
\def\endhangpar{\par}

% Singlespaced hanging paragraph environment suitable for uncited
% bibliographies in sociology and anthropology.
\newif\if@firstdate \@firstdatetrue
\def\socbib{\par \def\baselinestretch{1}\@normalsize
    \raggedright \parindent=0pt \parskip=0pt
\newskip\socparskip \socparskip = 12pt
\newdimen\@datewidth \@datewidth = 60 pt
\newdimen\@stextwidth \@stextwidth=\textwidth
\advance \@stextwidth by -\@datewidth
\newskip\@socskip \@socskip=5pt plus 1pt minus 1pt
\newbox\@sdatebox
\def\@twodates##1[##2]{\global\setbox\@sdatebox=\vtop{%
              \hbox to \@datewidth{\kern 20 pt ##1\hfil}%
              \hbox to \@datewidth{\kern 20 pt ##2\hfil}%
              }\@socdate}
\def\@onedate##1{\global\setbox\@sdatebox=%
        \vtop{\hbox to \@datewidth{\kern 20pt ##1\hfil}}\@socdate}
\def\par{\egroup \egroup \endgraf \vskip\socparskip \@firstdatetrue}
\def\@socdate{\if@firstdate \endgraf \nopagebreak \@firstdatefalse \else %
         \egroup \egroup \endgraf \vskip\@socskip \fi%
         \hbox to \textwidth\bgroup%
                   \box\@sdatebox\vtop\bgroup\hsize\@stextwidth\ignorespaces}
\def\socdate##1{\@ifnextchar[{\@twodates{##1}}{\@onedate{##1}}}
}
\def\endsocbib{\egroup\egroup\endgraf\vskip\baselineskip}

% TITLEPAGE
% The titlepage environment inhibits output of page number, and starts roman
% page numbering.
\def\titlepage
   {\thispagestyle{empty}
    \pagenumbering{roman}}
\def\endtitlepage{\newpage}

\def\title#1{\gdef\@title{#1}}              \title{Unknown}
\def\author#1{\gdef\@author{#1}}            \author{Unknown}
\def\format#1{\gdef\@format{#1}}            \format{thesis}
\def\level#1{\gdef\@level{#1}}              \level{Master's}
\def\degree#1{\gdef\@degree{#1}}            \degree{MASTER OF ARTS}
\def\mprof#1{\gdef\@mprof{#1, Major Professor}} \def\@mprof{}
\def\submit#1{\gdef\@submit{#1}}            \submit{the graduate faculty}

\newcount\@deptnum  \@deptnum=1
\newcount\@majornum \@majornum=1
\def\@depart{}
\def\@deptone{}
\def\@depttwo{}
\def\@depttitle{}

\newcount\@numcomm
\def\committee#1{\@numcomm=#1}
\committee{0}

\newdimen\@signwidth \@signwidth=6cm

\def\@depmajmac#1#2#3#4{% department and major macro
  \ifcase\@deptnum \def\@depart{}
     \or \def\@depart{\@depttitle #1 \\}
     \else \def\@depart{\@depttitle #1\\ #2\\}\fi
  \ifcase\@majornum \def\@major{}
     \or \def\@major{\@majortitle #3}
     \else \def\@major{\@majortitle #3 \\  #4}\fi}

\newif\if@interdept \@interdeptfalse
\newif\if@interdeptm \@interdeptmfalse
\newcount\signdeptnum  \signdeptnum=1
\newcount\signmajornum \signmajornum=1

\def\interdept{\@interdepttrue}
\def\interdeptm{\@interdeptmtrue}

\def\dept#1{\gdef\@deptone{#1} \gdef\@depttwo{} \@deptnum=1
   \if@interdept\def\@depttitle{Interdepartmental Program: } \else
     \def\@depttitle{Department: }\fi}
\def\codepts#1#2{\gdef\@deptone{#1} \gdef\@depttwo{#2} \@deptnum=2
   \def\@depttitle{Departments: }\signdeptnum=2}
\def\major#1{\@majornum=1 \@depmajmac{\@deptone}{\@depttwo}{#1}{}
   \if@interdeptm\def\@majortitle{Interdepartmental Major: } \else
     \def\@majortitle{Major: }\fi}
\def\comajors#1#2{\@majornum=2 \signmajornum=2
   \@depmajmac{\@deptone}{\@depttwo}{#1}{#2}
   \def\@majortitle{Co-majors: }}

\def\signmajor#1{\def\@signmajor{#1}}
\signmajor{\ifnum\signmajornum=2 Co-major Professor \else 
Major Professor\fi} 
\def\signdept#1{\def\@signdept{#1}}
\signdept{\if@interdept For the Major Program \else 
\ifnum\@deptnum=2 For the Co-major Program \else 
For the Major Program\fi\fi}

\def\@depart{}
\def\@major{}

\def\minor#1{\def\@minor{\\Minor: #1}}
\def\@minor{}

\def\mprofs#1#2{\def\@mprofs{#1, Co-major Professor\\#2, Co-major Professor} 
\signmajornum=2} 
\def\@mprofs{}

\def\members#1{\def\@members{\\#1}}
\def\@members{}

\newcount\@linecount
\def\makelines#1#2{\@linecount=#1
   \loop\ifnum \@linecount > 0
   \advance \@linecount by -1
      \vskip 3pt
    \underline{\mbox{\hspace{\@signwidth}}}
%   \hrule width \@signwidth 
   \vskip -7pt #2 \vskip 4pt
   \repeat}
% allow major and department signature titles to be longer than
% the signature line width without complaints from TeX
%   \repeat \hbox to \@signwidth{#2\hss} \vskip 4pt}

\long\def\@signbox{
   \vfill
   \makelines{\@numcomm}{Committee Member}
   \makelines{\signmajornum}{\@signmajor}
   \if@interdeptm \makelines{1}{For the Interdeparmental Major} \fi
   \makelines{\signdeptnum}{\@signdept}
   %\makelines{1}{For the Graduate College}
   \hfill
   \par}

\def\copyyear#1{\gdef\@copyyear{\number#1}}
\copyyear{\year}
\def\notice{\gdef\@notice{Copyright
   \copyright\/ \@author,\ \@copyyear. All rights reserved.}}
\def\@notice{}

\def\supervisor#1{\gdef\@supervisor{#1}}
\def\@supervisor{}

\def\@titlefoot{\begin{center}Iowa State University\\
   Ames, Iowa\\ \@copyyear\  \\
   \@notice \end{center}}%Added \  after \@copyyear to avoid having \\ problem

% Old maketitle replaced by copy of makenosigtitle for PDF thesis - JAS 1 Nov 06
%\long\def\maketitle{\begin{titlepage}
% \vbox ensures whole title page stays on one page even if it becomes overfull
%  \vbox to \textheight{
%   \begin{center}
%   {\bfseries \@title}
%   \vskip 11pt
%   by \\
%   \vskip 11pt
%   \@author
%   \vskip 30pt
%   A \@format\ submitted to \@submit\ \\
%   in partial fulfillment of the requirements for the degree of\\
%   \@degree \\[2.5pt]
%   \vskip 41pt                   % Changed from 30pt to cover dept loss
%   \@depart
%   \@major
%   \@minor                      % No longer listed - Sept. 2001
%   \vskip 14pt
%   \begin{singlespace}
%   Program of Study Committee: \\
%   \@mprof 
%   \@mprofs
%   \@members
%   \end{singlespace}
%   \end{center}
%   \vfill
%   \vspace{14pt}
%   \vfill
%   \@titlefoot } % end of \vbox
%   \newpage
%   \vbox to \textheight{
%   \begin{center}
%   \begin{singlespace}
%   Graduate College\\
%   Iowa State University\\
%   \end{singlespace}
%   \vskip 41pt
   % Alteration for PDFVersion of isuthesis  - JAS 3/10/06
   %This is to certify that the 
   %\@level\  
   %\@format\ of\\
   %\@author\\
   %has met the \@format\ requirements of Iowa State University\\
%  \begin{singlespace}
%   NOTE:  \\
%   Electronic theses \\
%   will not contain \\
%   the signed thesis \\
%   approval page \\
%   here.\\
%   \end{singlespace} 
%   \vfill
   %\@signbox
   % End 3/10/06 alteration
%   \end{center}
%   }
%   \end{titlepage}
%}% end maketitle
% Old maketitle replaced by copy of makenosigtitle for PDF thesis - JAS 1 Nov 06

\long\def\maketitle{\begin{titlepage}
% \vbox ensures whole title page stays on one page even if it becomes overfull
  \vbox to \textheight{
   \begin{center}
   \vskip 28pt                   % Added to more evenly space page (JAS11)
   {\bfseries \@title}
   \vskip 14pt                    % Changed from 11pt to more evenly space page (JAS11)
   by \\
   \vskip 14pt                   % Changed from 11pt to more evenly space page (JAS11)
   \textbf{\@author}
   \vskip 41pt                  % Changed from 30pt to more evenly space page (JAS11)
   A \@format\ submitted to \@submit\ \\
   in partial fulfillment of the requirements for the degree of\\
   \@degree \\[2.5pt]
   \vskip 55pt                   % Changed from 30pt to cover dept loss
%   \@depart
   \@major
%   \@minor                     % No longer listed - Sept. 2001
   \vskip 41pt                    % Changed from 14pt to more evenly space page (JAS11)
  % \begin{singlespace}  % Elminated to more evenly space page (JAS11)
   Program of Study Committee: \\
   \@mprof 
   \@mprofs
   \@members
   %\end{singlespace}   % Eliminated to more evenly space page (JAS11)
   \end{center}
   \vfill
   \vspace{14pt}
   \vfill
   \@titlefoot } % end of \vbox
   \end{titlepage}
}% end maketitle

\long\def\makenosigtitle{\begin{titlepage}
% \vbox ensures whole title page stays on one page even if it becomes overfull
  \vbox to \textheight{
   \begin{center}
   {\bfseries \@title}
   \vskip 11pt
   by \\
   \vskip 11pt
   \textbf{\@author}
   \vskip 30pt
   A \@format\ submitted to \@submit\ \\
   in partial fulfillment of the requirements for the degree of\\
   \@degree \\[2.5pt]
   \vskip 41pt                   % Changed from 30pt to cover dept loss
%   \@depart
   \@major
%   \@minor                      % No longer listed - Sept. 2001
   \vskip 14pt
   \begin{singlespace}
   Program of Study Committee: \\
   \@mprof 
   \@mprofs
   \@members
   \end{singlespace}
   \end{center}
   \vfill
   \vspace{14pt}
   \vfill
   \@titlefoot } % end of \vbox
   \end{titlepage}
}% end makenosigtitle

\long\def\startabstract{
   \begin{center}
   {\bfseries \@title}
   \vskip 11pt
   \@author
   \vskip 11pt
   \begin{singlespace}
   \@mprof 
   \@mprofs \\
   Iowa State University
   \end{singlespace}
   \end{center}
}% end startabstract

\newcommand{\paperinfo}[1]{\vspace{-.4 in} \begin{center} A paper #1 \end{center} 
\vspace{.4 in}}

\newcommand{\paperauthor}[1]{\vspace{-.5 in} \begin{center} #1 \end{center} 
\vspace{.25 in}}

\def\alternatenum{%  command to set numbering down to subpara
   \setcounter{secnumdepth}{5}}

\def\alternate{%  command to set numbering down to subsection
   \setcounter{secnumdepth}{3}}

\def\alternatepart{%  command to number only parts
   \setcounter{secnumdepth}{0}
   \renewcommand{\thechapter}{}
   \makeatletter
   \renewcommand{\thefigure}{\@arabic\c@figure}
   \renewcommand{\theequation}{\arabic{equation}}
   \renewcommand{\thetable}{\@arabic\c@table}
   \makeatother
}

\def\alternatechap{%  command to number only parts and chapters
   \setcounter{secnumdepth}{0}
   \makeatletter
   \renewcommand{\thefigure}{\@arabic\c@figure}
   \renewcommand{\theequation}{\arabic{equation}}
   \renewcommand{\thetable}{\@arabic\c@table}
   \makeatother
}

\def\reset{% resets many chapter level counters
   \setcounter{chapter}{0}
   \setcounter{section}{0}
   \setcounter{subsection}{0}
   \setcounter{subsubsection}{0}
   \setcounter{paragraph}{0}
   \setcounter{subparagraph}{0}
   \setcounter{equation}{0}
   \setcounter{figure}{0}
   \setcounter{table}{0}
   \setcounter{footnote}{0}
   \setcounter{mpfootnote}{0}}

\def\nochap{% bizarre hack to not use a chapter number
   \makeatletter
   \renewcommand{\thefigure}{\@arabic\c@figure}
   \renewcommand{\theequation}{\arabic{equation}}
   \renewcommand{\thetable}{\@arabic\c@table}
   \makeatother
   \renewcommand{\thechapter}      {}    
   \renewcommand{\thesection}      {\arabic{section}}
   \renewcommand{\thesubsection}   {\thesection.\arabic{subsection}}
   \renewcommand{\thesubsubsection}{\thesubsection .\arabic{subsubsection}}
   \renewcommand{\theparagraph}    {\thesubsubsection.\arabic{paragraph}}
   \renewcommand{\thesubparagraph} {\theparagraph.\arabic{subparagraph}}
}%end nochap

\def\partnochap{% bizarre hack to not use a chapter number but use parts
   \makeatletter
   \renewcommand{\thefigure}{\@arabic\c@figure}
   \renewcommand{\theequation}{\arabic{equation}}
   \renewcommand{\thetable}{\@arabic\c@table}
   \makeatother
%   \renewcommand{\thepart}         {\roman{part}}
   \renewcommand{\thechapter}      {}    
   \renewcommand{\thesection}      {\thepart.\arabic{section}}
   \renewcommand{\thesubsection}   {\thesection.\arabic{subsection}}
   \renewcommand{\thesubsubsection}{\thesubsection .\arabic{subsubsection}}
   \renewcommand{\theparagraph}    {\thesubsubsection.\arabic{paragraph}}
   \renewcommand{\thesubparagraph} {\theparagraph.\arabic{subparagraph}}
}%end partnochap

% \isucontinuecaption allows easy captioning of continued tables and figures.
% No text supplied by user. Text is '(Continued)'. No ':' after table/figure
% number and current table/figure number is used without being stepped.
\newif\if@continued \@continuedfalse
\def\isucontinuecaption{\@isucontinuecaption\@captype}
\def\@isucontinuecaption#1{\par %\baselineskip 14.5pt
      \begingroup
         \global\@continuedtrue
         \@parboxrestore
         \@makecaption{\csname fnum@#1\endcsname}{(Continued)}%
         \par \vspace{1.7ex}%
      \endgroup}   

% The thesis office wants Chapters with a dotted leader
% (This redefinition borrowed from isuthes may not be a very
%  good idea but it seems to work.) - JAS, April 1996

\renewcommand{\l@chapter}[2]{\addpenalty{-\@highpenalty}
     \vskip 4pt plus 2pt
     {\bf \@dottedtocline{0}{0em}{1.5em}{\@chapapp#1}{#2}}}

% The following lines and a slight redefinition in isucaption allow
% the word Table and Figure to be placed before Table and Figure entries
% in the List of Tables and List of Figures

\renewcommand{\l@figure}{\@dottedtocline{1}{1.5em}{6em}}
\renewcommand{\l@table}{\@dottedtocline{1}{1.5em}{6em}}

% Resets chapter command so the word CHAPTER appears

\def\chaptertitle{% resets chaptername
   \renewcommand{\chaptername}{CHAPTER\ }}

% Resets part name so PART appears

\renewcommand{\partname}{PART\ }

% Resets appendix command so the word APPENDIX appears
% after unsetting chaptername

\def\appendixtitle{% resets appendixname
    \def\@chapapp{APPENDIX}
    \def\thechapter{}
    \addtocontents{toc}{\def\protect\@chapapp{APPENDIX\ }}
   \renewcommand{\appendixname}{APPENDIX\ }}

% Resets appendix command so the word APPENDIX appears
% after unsetting chaptername

\def\unappendixtitle{% resets appendixname
    \def\@chapapp{}
    \def\thechapter{}
    \addtocontents{toc}{\def\protect\@chapapp{}}
   \renewcommand{\appendixname}{}}
%%%%

%\usepackage{threeparttop}

%%%%
% Three part head and foot macros. 1/87
% Lance Berc
% Olsen & Associates	mcvax!unizh!olsen!lance@seismo.css.gov
% Seefeldstrasse 233
% CH-8008 Zurich

% How users can set the head and foot text.
\def\lhead#1{\gdef\@lhead{#1}} \def\lfoot#1{\gdef\@lfoot{#1}}
\def\chead#1{\gdef\@chead{#1}} \def\cfoot#1{\gdef\@cfoot{#1}}
\def\rhead#1{\gdef\@rhead{#1}} \def\rfoot#1{\gdef\@rfoot{#1}}

% Initialization of the head and foot text.
% By default the page number is at the center of the foot and everything
% else is empty.
% JAS - changed default page to chead
\def\@lhead{} \def\@lfoot{}
\def\@cfoot{} \def\@chead{{\normalfont \thepage}}  % (JAS11) Changed form \rm \thepage
\def\@rhead{} \def\@rfoot{}

% Put together a three part header or footer given the left, center and
% right text. The \lap commands put the text into an hbox of zero size,
% so overlapping text is not detected (it just overlaps).
\def\@threepart#1#2#3{\rlap{#1} \hfil {#2} \hfil \llap{#3}}

% Swap the notices on odd and even pages when twosided.
\def\ps@threepartheadings
    {
    \def\@oddhead{\@threepart{\@lhead}{\@chead}{\@rhead}}
    \def\@oddfoot{\@threepart{\@lfoot}{\@cfoot}{\@rfoot}}

    \if@twoside
	\def\@evenhead{\@threepart{\@rhead}{\@chead}{\@lhead}}
	\def\@evenfoot{\@threepart{\@rfoot}{\@cfoot}{\@lfoot}}
    \else
	\def\@evenhead{\@threepart{\@lhead}{\@chead}{\@rhead}}
	\def\@evenfoot{\@threepart{\@lfoot}{\@cfoot}{\@rfoot}}
    \fi
    }

% Default page style
\ps@threepartheadings
%%%%


% Protects added (JAS05 / JAS09)
\renewcommand{\contentsname}
{\protect \centering \large TABLE OF CONTENTS } %JAS
\renewcommand{\listfigurename}
{\protect \centering \large LIST OF FIGURES}  %JAS
\renewcommand{\listtablename}
{\protect \centering \large LIST OF TABLES}    %JAS

%\renewcommand{\contentsname}{\centering 
%\large TABLE OF CONTENTS } %JAS
%\renewcommand{\listfigurename}{\centering \large LIST OF FIGURES}  %JAS
%\renewcommand{\listtablename}{\centering \large LIST OF TABLES}    %JAS

\renewcommand{\chaptername}{}             %JAS- remove Chapter?
\renewcommand{\appendixname}{}            %
\lineskip 1pt                             % old isuthes value
\renewcommand{\baselinestretch}{1.655}    % old isuthes value
\setcounter{secnumdepth}{0}

% Replaced by Geometry Package (JAS05 / JAS09)
%\setlength{\oddsidemargin}{0.25 in}
%\setlength{\evensidemargin}{0.25 in}
%\setlength{\textwidth}{6.2 in}           % allow for a little sloppiness (6.3)
%\setlength{\topmargin}{-.30 in}           % top margin to header (was -.35)
%\setlength{\textheight}{8.8 in}           % allow for a little sloppiness (8.9)

\pagestyle{threepartheadings}             % top page number
%\usepackage{thesisreport}                 % report alterations for isuthesis

%%%%
%% Subpackage: thesisreport.sty for use with the isuthesis package.
%%
%% LaTeX document package `isuthesis', for use with LaTeX2e.
%% This is a package that is used with the report class to
%%   create a thesis at Iowa State University.
%%
%% COPYRIGHT 1997, by Joe Struss (jastruss@iastate.edu)
%%
%% Copying of part or all of any file in the isuthesis.sty package
%% including isumacros.sty, thesisreport.sty and isuthesis.sty
%% is allowed under the following conditions only:
%% (1) You may freely distribute unchanged copies of the files. Please
%%     include the any or all documentation when you do so.
%% (2) You may modify a renamed copy of any file, but only for personal
%%     use or use within an organization.
%% (3) You may copy fragments from the files, for personal use or for use
%%     in a macro package for distribution, as long as credit is given
%%     where credit is due.
%%
%% You are NOT ALLOWED to take money for the distribution or use of
%% these files or modified versions or fragments thereof, except for
%% a nominal charge for copying etc.
%%
%Standard Report class changes;  JAS 10/95-3/96
%  Part -standard (change Huge and huge to Large
\renewcommand{\part}{\cleardoublepage
                 %\thispagestyle{plain} - remove to get rid of page #
                 \if@twocolumn
                     \onecolumn
                     \@tempswatrue  
                   \else
                     \@tempswafalse
                 \fi
                 \hbox{}\vfil
                 \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\partname \thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}
    {\centering
     \interlinepenalty \@M
     \reset@font
     \ifnum \c@secnumdepth >-2\relax
       \Large\bfseries \partname~\thepart
       \par
       \vskip 20\p@
     \fi
     \Large \bfseries #2\par}%
    \@endpart}
\def\@spart#1{%   
    {\centering
     \interlinepenalty \@M  
     \reset@font
     \Large \bfseries #1\par}%
    \@endpart}
\def\@endpart{\vfil\newpage
              \if@twoside
                \hbox{}%
                \thispagestyle{empty}%
                \newpage
              \fi
              \if@tempswa
                \twocolumn
              \fi} 

%  Chapter
\renewcommand{\chapter}{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{threepartheadings}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}

\def\@makechapterhead#1{%             % Heading for \chapter command.
  \vspace*{15\p@}%                    % Space at top of text page (JAS11) 50 to 15
  {\centering \reset@font \large\bfseries   % JAS, huge to large (removal and spaces)
    \ifnum \c@secnumdepth >\m@ne      % IF secnumdepth > -1
        \interlinepenalty\@M
        \if@singleappendix
           \thechapter
        \else
        \@chapapp \thechapter \fi \fi %   print 'Chapter' and number
    ~~~#1\par
    \nobreak                          % TeX penalty to prevent page break.
    \vskip 40pt}}                     % Space between title and tex.

\def\@makeschapterhead#1{%              Heading for \chapter* command
  \vspace*{15\p@}%                    % Space at top of page (JAS11) 50 to 15
  {\reset@font \centering \large \bfseries
    \interlinepenalty\@M
    ~~~#1\par\nobreak % JAS Huge to large, Title, TeX penalty to prevent page break
    \vskip 40\p@                      % Space between title and tex.
  }}

% Sections, subsections, subsubsections
\renewcommand{\section}{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\reset@font\large\bfseries}}
 % JAS: Large to large
\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                         {\reset@font\normalsize\bfseries \hskip 0.0 in}}
 % JAS: large to normalsize; added 0.0 cm \hskip
\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                             {\reset@font\normalsize\bfseries \hskip 0.25 in}}
 % JAS no change; added .25 in \hskip

% Paragraph and subparagraph (JAS -reformulation)
%   (basically the same as subsection and subsubsection)
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries \hskip 0.25 in}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\bfseries \hskip 0.25 in}}

%%%%

%\usepackage{indentfirst}                  % para. indent after sectionals

%%%%
\makeatletter
\let\@afterindentfalse\@afterindenttrue
\@afterindenttrue
\makeatother
%%%%

\widowpenalty=450                         % three times normal widow penalty
\clubpenalty=450                          % three times normal orphan penalty
