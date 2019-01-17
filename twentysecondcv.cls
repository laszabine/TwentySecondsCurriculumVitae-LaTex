\ProvidesClass{twentysecondcv}[2015/02/28 CV class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%PACKAGES%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{array}
\RequirePackage[sfdefault]{ClearSans}
\RequirePackage[T1]{fontenc}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{marvosym}
\RequirePackage{parskip}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{sidecolor}{HTML}{E7E7E7}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB0B00}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{mainblue}{HTML}{0E5484}
\definecolor{cerulean}{HTML}{007BA7}
\definecolor{maingray}{HTML}{B9B9B9}
\definecolor{maindarkgray}{HTML}{B3B3B3}
\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{asidecolor}{sidecolor}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
  \colorlet{asidecolor}{sidecolor}
\fi


\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%%%%%%%%%%%%%%%%
% Profile left SideBar %
%%%%%%%%%%%%%%%%

\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}

\newcommand{\imsize}{\linewidth}
\newlength\imagewidth
\newlength\imagescale
\renewcommand{\imsize}{0.618\linewidth}
\pgfmathsetlength{\imagewidth}{5cm}%
\pgfmathsetlength{\imagescale}{\imagewidth/600}%

\newcommand{\profilesection}[2]{
  {
    \noindent
    \color{black!80}
    \Large
    #1
    \rule[0.15\baselineskip]{#2}{1pt}
    \vspace{1pt}
  }
}

%%% ==== these are the commands that [need to / can] be overwritten in the main document

\newcommand{\cvdate}[1]{\renewcommand{\givencvdate}{#1}}
\newcommand{\cvmail}[1]{\renewcommand{\givencvmail}{#1}}
\newcommand{\cvnumberphone}[1]{\renewcommand{\givennumberphone}{#1}}
\newcommand{\cvnumberphonealt}[1]{\renewcommand{\givennumberphonealt}{#1}}
\newcommand{\cvaddress}[1]{\renewcommand{\givencvaddress}{#1}}
\newcommand{\cvsite}[1]{\renewcommand{\givencvsite}{#1}}
\newcommand{\aboutme}[1]{\renewcommand{\givenaboutme}{  \justifying#1}}
\newcommand{\profilepic}[1]{\renewcommand{\givenprofilepic}{#1}}
\newcommand{\cvname}[1]{\renewcommand{\givencvname}{#1}}
\newcommand{\cvnameipa}[1]{\renewcommand{\givencvnameipa}{#1}}
\newcommand{\cvjobtitle}[1]{\renewcommand{\givencvjobtitle}{#1}}
\newcommand{\cvlastupdated}[1]{\renewcommand{\givenlastupdated}{#1}}
\newcommand\skills[1]{
  \renewcommand{\givenskill}{
    \noindent
    \begin{tikzpicture}
      \foreach [count=\i] \x/\y in {#1}
      {
        \draw[fill=maingray,maingray] (0,\i) rectangle (6,\i+0.4);
        \draw[fill=white,mainblue](0,\i) rectangle (\y,\i+0.4);
        \node[above right] at (0,\i+0.4) {\x};
      }
    \end{tikzpicture}
  }
}
\newcommand\skillstext[1]{
  \renewcommand{\giventextskill}{
    \begin{flushleft}
      \noindent
      \foreach [count=\i] \x/\y in {#1}
      {
        \x$ \star $\y
      }
    \end{flushleft}
  }
}

%%% ====

\newcommand{\givencvname}{REQUIRED!}
\newcommand{\givencvnameipa}{}
\newcommand{\givencvdate}{}
\newcommand{\givencvmail}{}
\newcommand{\givennumberphone}{}
\newcommand{\givennumberphonealt}{}
\newcommand{\givencvaddress}{}
\newcommand{\givenaboutme}{}
\newcommand{\givenprofilepic}{}
\newcommand{\givencvsite}{}
\newcommand{\givencvjobtitle}{}
\newcommand{\givenlastupdated}{}
\newcommand{\givenskill}{}
\newcommand{\giventextskill}{}

\newcommand*\icon[1]{%
  \tikz[baseline=(char.base)]{
    \node[shape=circle,draw,inner sep=1pt,fill=mainblue,mainblue,text=white] (char) {#1};
  }
}
\newcommand*\round[2]{
  \tikz[baseline=(char.base)]{
    \node[anchor=north west, draw,rectangle, rounded corners, inner sep=1.6pt, minimum size=5.5mm, text height=3.6mm, fill=#2,#2,text=white] (char) {#1};
  }%
  \hspace{0.1em}%
}

\newcommand{\makeprofile}
{
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=asidecolor, anchor=north, minimum width=9.90cm, minimum height=\paperheight+1cm] (box) at (-5cm,0.5cm){};
  \end{tikzpicture}

  \begin{textblock}{6}(0.5, 0.2)
    \vspace{3em}
    \begin{flushleft}
      \hspace{13pt}
      % TODO: this should not be commented out, but dependent on the emptiness of \givenprofilepic
      % \begin{tikzpicture}[x=\imagescale,y=-\imagescale]
      %     \clip (600/2, 567/2) circle (567/2);
      %
      %         \node[anchor=north west, inner sep=0pt, outer sep=0pt] at (0,0) {\includegraphics[width=\imagewidth]{\givenprofilepic}};
      % \end{tikzpicture}

      {\Huge\color{mainblue}\givencvname}
      {\large\color{gray}\givencvnameipa}

      \begin{flushright}
        {\Large\color{black!80}\givencvjobtitle}
      \end{flushright}
      \renewcommand{\arraystretch}{1.6}
      \begin{tabular}{p{0.5cm} @{\hskip 0.5cm}p{5cm}}
        \ifthenelse{\equal{\givencvdate}{}}{}{
          \textsc{\Large\icon{\Info}}     & \givencvdate \\}
        \ifthenelse{\equal{\givencvmail}{}}{}{
          \textsc{\large\icon{
            % @
            % \Letter
            \MVAt
          }}                              & \href{mailto:\givencvmail}{\givencvmail} \\}
        \ifthenelse{\equal{\givencvsite}{}}{}{
          \textsc{\large\icon{\Mundus}}   & \href{\givencvsite}{\textcolor{cerulean}\givencvsite} \\}
        \ifthenelse{\equal{\givennumberphone}{}}{}{
          \textsc{\Large\icon{\Telefon}}  & \href{tel:\givennumberphone}{\givennumberphone} \\}
        \ifthenelse{\equal{\givennumberphonealt}{}}{}{
          \textsc{\Large\icon{\Telefon}}  & \href{tel:\givennumberphonealt}{\givennumberphonealt} \\}
        \ifthenelse{\equal{\givencvaddress}{}}{}{
          \textsc{\Large\icon{\Letter}}   & \givencvaddress \\}
      \end{tabular}

      % TODO: display only when value is not empty
      % \profilesection{About me}{3.2cm}
      % \givenaboutme

      \profilesection{Programming skills}{5cm}
      \givenskill
      \giventextskill
      % TODO: put back in? but make prettier
      % \noindent
      % {\scriptsize (*)[The skill scale is from 0 (Fundamental Awareness) to 6 (Expert).]}

      \vspace{2em}

      % TODO: get data from main file !!!
      \profilesection{Languages}{5cm}
      \begin{tabular}{>{\itshape }p{1.7cm} p{5cm}}
        Native & German (Austrian Standard G.) \newline Bavarian \\
        Good & English (C2) \newline French (C1) \newline Turkish (B1) \newline Latin (4 years) \\
        Basic & ASL, Mandarin Chinese, \newline Persian, Russian, \newline SerBoCroatian,  Spanish \\
        Fieldwork & Koromfe, Kyrgyz, Nepali \\
      \end{tabular}

    \end{flushleft}

    \vspace{6.5cm} % TODO: make flexible (\vfill doesn't seem to work)
    \begin{center}
      {\scriptsize
        Last updated on \givenlastupdated. \\ % TODO: display only if not empty
        Layout adapted from \href{https://github.com/spagnuolocarmine/TwentySecondsCurriculumVitae-LaTex/}{Carmine Spagnuolo}.
      }
    \end{center}
  \end{textblock}
  \vspace{-10pt}
}


%%%%%%%%%%%%%%%%
% Section Color box %
%%%%%%%%%%%%%%%%
\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
   \round{#1#2#3}{
      \ifcase\value{colorCounter}%
        maingray\or%
        mainblue\or%
        maingray\or%
        mainblue\else%
        maingray\fi%
    }%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par%\vspace{\parskip}
  {%
    \hspace{0.01pt}%
    \LARGE\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{.9\parskip}
}

\renewcommand{\subsection}[1]{
  \par\vspace{.5\parskip}%
  {%
  \large\color{headercolor} #1%
  }
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List twenty environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{twenty}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\color{headercolor}}
\newcommand{\twentyitem}[4]{%
  \hspace{5pt}#1&\parbox[t]{11.5cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize#3}\\%
    #4\vspace{\parsep}%
  }\\}

%%%%%%%%%%%%%%%%%%%%%%%%%
% Small twenty List environment %
%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\tabcolsep}{0pt}
\newenvironment{twentyshort}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\color{headercolor}}
\newcommand{\twentyitemshort}[2]{%
  \hspace{5pt}#1&\parbox[t]{11.5cm}{%
    \textbf{#2}%
  }\\}


%%%%%%%%%%%%
% Page Setting %
%%%%%%%%%%%%

\RequirePackage[left=7.3cm,top=0.1cm,right=0.5cm,bottom=0.2cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}
