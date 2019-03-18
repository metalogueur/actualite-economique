%
% actuecon.cls
% Copyright 2018-2019 HEC Montréal
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3c
% of this license or (at your option) any later version.
% The latest version of this license is in
% https://www.latex-project.org/lppl/lppl-1-3c.txt
% and version 1.3c or later is part of all distributions of LaTeX
% version 2008/05/04 or later.
%
% This work has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this work is Benoit Hamel
% <benoit.2.hamel@hec.ca>.
%
% This work consists of the files actuecon.cls, template-en.tex,
% template-fr.tex, documentation-en.tex, documentation-fr.tex
% and the derived files documentation-en.pdf and documentation-fr.pdf.
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%% CLASSE DE DOCUMENT ACTUECON                                 %%
%%                                                             %%
%% Cette classe a été conçue afin de servir de gabarit pour    %%
%% la rédaction d'articles pour la revue Actualité économique. %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{actuecon}[2019/02/11 v1.1.1 Classe pour les articles de la revue Actualite economique]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ExecuteOptions{10pt} % Taille par défaut
\ProcessOptions
\LoadClass{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CHARGEMENT DES PACKAGES REQUIS PAR LA CLASSE %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Encodage des caractères en UTF-8
\RequirePackage[utf8]{inputenc}	
%% Utilisation des polices T1		
\RequirePackage[T1]{fontenc}
%% Citations au format auteur-année				
\RequirePackage{natbib}
%% Internationalisation						
\RequirePackage{babel}
%% Nécessaire pour hacker \maketitle						
\RequirePackage{etoolbox}
%% Mise en page					
\RequirePackage{geometry}
%% Entêtes et pieds de pages personnalisés					
\RequirePackage{fancyhdr}
%% Titres de section personnalisés					
\RequirePackage[raggedright]{titlesec}
%% Nécessaire pour hacker \maketitle (à insérer avant authblk)					
\RequirePackage{titling}
%% Nécessaire pour hacker \maketitle					
\RequirePackage[blocks,affil-it]{authblk}
%% Requis pour les équations
\RequirePackage{amsmath}
%% Polices de caractères pour les maths					
\RequirePackage{amsfonts}
%% Police Times avec symboles mathématiques
\RequirePackage{mathptmx}
%% Nécessaire pour les graphiques et images					
\RequirePackage{graphicx}
%% Descriptions de graphiques et tableaux personnalisées
\RequirePackage[format=plain,%
	labelsep=none,%
	textfont=sc,%
	aboveskip=12pt,%
	position=top,%
	justification=centering]{caption}
%% Utilisation des lettres grecques droites en mode mathématiques
\RequirePackage{upgreek}
%% Suppression des lignes orphelines
\RequirePackage[defaultlines=2,all]{nowidow}
%% Révision des manuscrits
\RequirePackage{changes}
%% Gestion des césures
\RequirePackage{hyphenat}

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% MISE EN PAGE / LAYOUT %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Format de page
\geometry{papersize={6.25in,9.5in},
	nomarginpar,
	includehead,
	nofoot,
	hdivide={0.875in,*,0.875in},
	vdivide={63pt,*,0.7917in},
	headsep=0.25in,
	headheight=9pt}
%% Indentation des premières lignes de paragraphes			
\setlength{\parindent}{15pt}
%% Espacement entre les paragraphes
\setlength{\parskip}{6pt}
%% Indentation des équations
\setlength{\mathindent}{15pt}
%% Espacement entre l'auteur et son affiliation
\setlength{\affilsep}{0pt}
%% Espacement entre les références bibliographiques
\setlength{\bibsep}{2pt}
%% Espacement entre les notes de bas de pages
\setlength{\footnotesep}{.8\baselineskip}

%% Reformatage de la taille de caractères \normalsize
\makeatletter
\g@addto@macro\normalsize{%
	\setlength\abovedisplayskip{0pt}
	\setlength\belowdisplayskip{0pt}
	\setlength\abovedisplayshortskip{0pt}
	\setlength\belowdisplayshortskip{0pt}
}
\makeatother

%% Formatage de la taille de caractères pour l'auteur
\renewcommand{\Authfont}{\fontsize{10}{12}\selectfont}

%% Formatage des captions maison
\DeclareCaptionFormat{actuecon}{#1#2\leavevmode \\[6pt]#3}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PERSONNALISATION DES ENTÊTES ET DES PIEDS DE PAGES %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\pagestyle{fancy}
\fancyhf{}
%% Entêtes
\fancyhead[RO,LE]{\thepage}
\fancyhead[CE]{\fontsize{7.5}{9}\selectfont\MakeUppercase{L'Actualité économique}}
\fancyhead[CO]{\fontsize{7.5}{9}\selectfont\MakeUppercase{\AEINTtitre}}
%% Pieds de pages
\renewcommand{\headrulewidth}{0pt}
\fancyfoot{}
\renewcommand{\footnoterule}{\noindent\rule[4pt]{48pt}{0.5pt}}

%%%%%%%%%%%%%%%%%%%%%%%%%%
%% OPTIONS DES PACKAGES %%
%%%%%%%%%%%%%%%%%%%%%%%%%%

%% [graphicsx] Répertoire des images
\graphicspath{{img}}

%% [babel] Caractères « et » sont les guillemets
\frenchbsetup{%
	og=«, fg=»                     
}

%% Formatage des entêtes de tableaux et figures (anglais)
\renewcommand{\figurename}{\MakeUppercase{\figurename}}
\renewcommand{\tablename}{\MakeUppercase{\tablename}}

%% [babel] Mise en forme de labels
\addto\captionsfrench{%
	\renewcommand{\figurename}{\MakeUppercase{Graphique}}
	\renewcommand{\tablename}{\MakeUppercase{Tableau}}
	\renewcommand{\refname}{BIBLIOGRAPHIE}
}
\addto\captionsenglish{%
	\renewcommand{\figurename}{\MakeUppercase{Figure}}
	\renewcommand{\tablename}{\MakeUppercase{Table}}
	\renewcommand{\refname}{BIBLIOGRAPHIE}
}

%%%%%%%%%%%%%%%%%%%%%%%%
%% HACK DE \maketitle %%
%%%%%%%%%%%%%%%%%%%%%%%%

%% Personnalisation de la section du titre de l'article
\pretitle{\vspace{-42pt}
	\AEentetePageTitre%
	\begin{center}%
		\fontsize{14}{16}\selectfont}
\posttitle{\par\vspace{24pt}%
	\end{center}}

\makeatletter
%% patch \maketitle so that it doesn't center
\patchcmd{\@maketitle}{center}{flushleft}{}{}
\patchcmd{\@maketitle}{center}{flushleft}{}{}
%% patch the patch by authblk so that the author block is flush left
\def\maketitle{{%
		\renewenvironment{tabular}[2][]
		{\begin{flushleft}}
			{\end{flushleft}}
		\AB@maketitle}}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%
%% COMMANDES INTERNES %%
%%%%%%%%%%%%%%%%%%%%%%%% 

%% Titre de l'article (pour l'entête)
\newcommand{\AEINTtitre}{}
%% Volume de la revue (pour l'entête)
\newcommand{\AEINTvolume}{}
%% Numéro de la revue (pour l'entête)
\newcommand{\AEINTnumero}{}
%% Date de parution de la revue (pour l'entête)
\newcommand{\AEINTdate}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% COMMANDES PERSONNALISÉES %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Titre de l'article
\newcommand{\AEtitre}[3]{%
	\renewcommand{\AEINTtitre}{#1}
	\title{\MakeUppercase{#2}#3}%
}

% Volume de la revue
\newcommand{\AEvolume}[1]{%
	\renewcommand{\AEINTvolume}{#1}
}

% Numéro de la revue
\newcommand{\AEnumero}[1]{%
	\renewcommand{\AEINTnumero}{#1}
}

% Date de parution de la revue
\newcommand{\AEdateParution}[1]{%
	\renewcommand{\AEINTdate}{#1}
}

% Entête de la page titre
\newcommand{\AEentetePageTitre}{%
	\noindent{\fontsize{8}{10}\selectfont L'Actualité économique, Revue d'analyse économique, vol.~\AEINTvolume, n\textsuperscript{o}~\AEINTnumero, \AEINTdate}\\[9pt] % 9 + 6 + 16 = 31
}

% Section Introduction de l'article
\newcommand{\AEintroduction}{%
	\setcounter{secnumdepth}{0}
	\titleformat{\section}%
	{\fontsize{10}{12}\selectfont\scshape}%
	{}{0pt}{}
	\titlespacing{\section}{0pt}{0pt}{0pt}
	\section{Introduction}
}

% Section Conclusion de l'article
\newcommand{\AEconclusion}{%
	\setcounter{secnumdepth}{0}
	\titleformat{\section}%
	{\fontsize{10}{12}\selectfont\scshape}%
	{}{0pt}{}
	\titlespacing{\section}{0pt}{3.5mm}{0pt}
	\section{Conclusion}
}

% Sections de développement de l'article
\newcommand{\AEsectionsDeveloppement}{%
	\setcounter{secnumdepth}{3}
	\titleformat{\section}%
	{\fontsize{10}{12}\selectfont\scshape}%
	{\thesection.}{6pt}{}
	\titlespacing{\section}{0pt}{3.5mm}{0pt}
	\titleformat{\subsection}%
	{\fontsize{10}{12}\selectfont\itshape}%
	{{\normalfont\thesubsection}}{6pt}{}
	\titlespacing{\subsection}{0pt}{6pt}{0pt}
	\titleformat{\subsubsection}%
	{\fontsize{10}{12}\selectfont\itshape}%
	{{\normalfont\thesubsubsection}}{6pt}{}
	\titlespacing{\subsubsection}{0pt}{6pt}{0pt}
}

% Section des annexes
\newcommand{\AEannexe}{%
	\titleformat{\section}{\filcenter\scshape}{}{}{}
	\titlespacing{\section}{0pt}{3.5mm}{0pt}
	\section{ANNEXE}
	\AEsectionsDeveloppement
	\appendix
}

\newcommand{\AEappendix}{%
	\titleformat{\section}{\filcenter\scshape}{}{}{}
	\titlespacing{\section}{0pt}{3.5mm}{0pt}
	\section{APPENDIX}
	\AEsectionsDeveloppement
	\appendix
}

% Section Bibliographie de l'article
\newcommand{\AEbibliographie}{%
	\titleformat{\section}{\filcenter\scshape}{}{}{}
	\titlespacing{\section}{0pt}{3.5mm}{0pt}
}

% Défition des réviseurs du manuscrit
\newcommand{\AEreviseur}[2]{%
	\definechangesauthor[name={#1}, color=red]{#2}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ENVIRONNEMENTS PERSONNALISÉS %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Résumé français
\newenvironment{AEresume}%
{\fontsize{9}{11}\selectfont\noindent\textsc{Résumé} -- }%
{\par}

% Résumé anglais
\newenvironment{AEabstract}%
{\fontsize{9}{11}\selectfont\noindent\textsc{Abstract} -- }%
{\par}
