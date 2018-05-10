%%
%% This is file `sysuthesis.cls',
%% 
%% Copyright (C) 2015-2016 by Chen Guangzhi
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3a
%% of this license or (at your option) any later version.
%% The latest version of this license is in:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
%%
%% Author: 陈广智
%% Version: 1.0
%% Date:2016-01-03

\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{sysuthesis}[2016/01/05 1.0.0 The LaTeX template for thesis of Sun Yat-Sen University]
\typeout{Document Class `sysuthesis' v1.0.1 by Chen Guangzhi (2015/01/05)}

%%%%%%%%%%%%模板选项%%%%%%%%%%%%%%%%%%%
%\let\cleardoublepage\clearpage
\newif\ifmasterdegree\masterdegreetrue
\DeclareOption{doctor}{\masterdegreefalse} %学位论文选项
\newif\ifnocolorlinks\nocolorlinksfalse
\DeclareOption{nocolorlinks}{\nocolorlinkstrue} %设置带颜色的超链接
\newif\ifdoublecover\doublecoverfalse
\DeclareOption{doublecover}{\doublecovertrue}
\DeclareOption{printedition}{\doublecovertrue\nocolorlinkstrue}
\newif\ifstoneside\stonesidefalse
\DeclareOption{printoneside}{
  \PassOptionsToClass{openany}{scrbook}
  \stonesidetrue
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrbook}}
\ProcessOptions
\LoadClass[a4paper,12pt,captions=tableheading]{scrbook} %加载模板scrbook


\RequirePackage{doc}
\RequirePackage{keyval}
\RequirePackage{ifthen}

\RequirePackage{xltxtra}
\RequirePackage{graphicx}
% 确定浮动对象的位置，可以使用~H，强制将浮动对象放到这里（可能效果很差）
\RequirePackage{float}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{indentfirst}
\RequirePackage{makeidx} % 索引

\RequirePackage[nottoc]{tocbibind} % 将参考文献、索引、表格目录和图形
\RequirePackage[numbers,sort&compress]{natbib} % 修改引用参考文献格式

%%%处理表格%%%%%
\RequirePackage{array} % 扩展了 array 和 tabular 环境功能
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{multirow} % 表格中支持跨行
\RequirePackage{tabularx} % 固定宽度的表格
\RequirePackage{diagbox}% 表格中的反斜线
%%%%%%%%%%%%%%%%

%%%%%%%%%标题%%%%%%%%%%%%%
\RequirePackage{caption} % 定义图的标题格式：居中. 使用caption3.0
\DeclareCaptionFont{capFont}{\song\wuhao} % 表格名及图名用5号宋体
\DeclareCaptionLabelSeparator{twospace}{~~}
\captionsetup{%
  format=plain,%
  labelformat=simple,%
  justification=centering,%
  singlelinecheck=off,
  labelsep=twospace,% 去掉图标签后的冒号
  font={capFont},%
  figurename=图,%
  tablename=表,%
  listfigurename=插图目录,%
  listtablename=表格目录}
\RequirePackage[labelformat=simple]{subcaption} %支持\subcaptionbox
%%%%%%%%%%%%%%%%%%

%%%% Added by Chen Guangzhi 2016-01-07 %%%%%%%%
\renewcommand{\thefigure}{\thechapter-\arabic{figure}} %%该图序号为图2—1 ×××
\renewcommand{\thetable}{\thechapter-\arabic{table}} %%该表序号为表2—1 ×××
\renewcommand\theequation{\thechapter-\@arabic\c@equation} %%修改公式编号样式为 (1-6) etc.
\renewcommand{\thesubfigure}{(\alph{subfigure})}

%%%%%%%修改列表格式%%%%%%%
\RequirePackage{paralist}% 
\setdefaultenum{1)}{a)}{i.}{A.}
\setdefaultleftmargin{6ex}{}{}{}{}{}
%%%%%%%%%%%%

%%%%%%%处理中文的包%%%%%%%%%%%%%
\RequirePackage[slantfont,boldfont]{xeCJK} %运行斜体和粗体
\RequirePackage{CJKnumb}
\newlength\CJK@twochars
\def\CJK@spaceChar{\hspace{1em}}
\def\CJKindent{%
    \settowidth\CJK@twochars{\CJK@spaceChar\CJK@spaceChar}%
    \parindent\CJK@twochars}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{hyperref}

%%%%%%%%%文档开始和结束%%%%%%%%
\AtBeginDocument{\CJKindent{}%
    \InputIfFileExists{sysuthesis.cfg}   % 引入配置文件
    {\typeout{[sysuthesis]: Load sysuthesis.cfg successfully!}}%
    {\typeout{[sysuthesis]: Load sysuthesis.cfg failed!}}%
    \makeindex%
    \wuhao%
    \linespacing{\mainlineskip}
  }
\AtEndDocument{} %在最后封面添加内容
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%根据\masterdegree条件改变论文类型(硕士/博士)%%%%%%
%%%%%%%%%%%%Added by Cheng Guangzhi 2016-01-07%%%%%%%%%%%%%%%%
\newcommand{\@degree}{}
\ifmasterdegree
  \renewcommand{\@degree}{硕士}
\else
  \renewcommand{\@degree}{博士}
\fi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[top=2.5cm,bottom=2.5cm,left=2.9cm,right=2.3cm]{geometry} %版面设置
\RequirePackage[pagestyles, rm]{titlesec}
\RequirePackage{titletoc} % 设置目录
\hypersetup{bookmarksnumbered=true}%书签中章节编号

%%%%%%%%%%字体、字号、行间距设置%%%%%%%%%%%%%%%%%%%%%%%%%%
\defaultfontfeatures{Mapping=tex-text} % --- as em-dash
\setCJKmainfont{SimSun}  %设置正文字体为宋体
\setCJKmonofont{FangSong}
\setCJKsansfont{SimHei}
\setCJKfamilyfont{zhsong}{SimSun}
\newcommand{\song}{\CJKfamily{zhsong}} %宋体命令
\setCJKfamilyfont{zhhei}{SimHei}
\newcommand{\hei}{\CJKfamily{zhhei}}  %黑体命令
\setCJKfamilyfont{zhkai}{KaiTi}
\newcommand{\kai}{\CJKfamily{zhkai}}  %楷体命令
\setCJKfamilyfont{zhfs}{FangSong}
\newcommand{\fs}{\CJKfamily{zhfs}}    %仿宋命令
\setmainfont{Times New Roman}         % 英文默认Time New Roman
\newcommand{\chuhao}{\fontsize{42pt}{46pt}\selectfont}
\newcommand{\xiaochuhao}{\fontsize{36pt}{40pt}\selectfont}
\newcommand{\yichu}{\fontsize{32pt}{36pt}\selectfont}
\newcommand{\yihao}{\fontsize{28pt}{32pt}\selectfont}
\newcommand{\erhao}{\fontsize{21pt}{24pt}\selectfont}
\newcommand{\xiaoerhao}{\fontsize{18pt}{20pt}\selectfont}
\newcommand{\sanhao}{\fontsize{15.75pt}{18pt}\selectfont}
\newcommand{\xiaosanhao}{\fontsize{15pt}{16pt}\selectfont} %小三号 added by ChenGuangzhi 2016-01-97
\newcommand{\sihao}{\fontsize{14pt}{16pt}\selectfont}
\newcommand{\xiaosihao}{\fontsize{12pt}{14pt}\selectfont}
\newcommand{\wuhao}{\fontsize{10.5pt}{13pt}\selectfont}
\newcommand{\xiaowuhao}{\fontsize{9pt}{11pt}\selectfont}
\newcommand{\liuhao}{\fontsize{7.5pt}{9pt}\selectfont}
\newcommand{\xiaoliuhao}{\fontsize{6.5pt}{7.5pt}\selectfont}
\newcommand{\qihao}{\fontsize{5.5pt}{6.5pt}\selectfont}
\setlength{\parskip}{0pt}% 段距
\newcommand{\mainlineskip}{1.5}% 主行距1.5
%%%%%%Added by Chen Guangzhi 2016-01-08%%%%%%%%%%
\titlespacing{\chapter}{0pt}{1.5ex plus .05ex minus .01ex}{4ex plus .04ex} %章上方空一行，章节题目之间空两行
\titlespacing{\section}{0pt}{1.5ex plus .05ex minus .01ex}{2.6ex plus .04ex} %左起空2个(两个中文字24pt) 标题间距
\titlespacing{\subsection}{0pt}{1.2ex plus .05ex minus .01ex}{2ex plus .04ex}  %左起空2个(两个中文字24pt)
\titlespacing{\subsubsection}{0pt}{1ex plus .05ex minus .01ex}{1ex plus .01ex}
\newcommand{\linespacing}[1]{\linespread{#1}\selectfont}% 行距命令
\newcommand{\pozhehao}{\kern0.3ex\rule[0.8ex]{2em}{0.1ex}\kern0.3ex} %定义一个破折号 Added by ChenGuangzhi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\stcleardp}{%
  \ifstoneside
  \clearpage
  \else
  \cleardoublepage
  \fi
}

%%%%%%%%%%%%不设置超链接的颜色%%%%%%%%%%%%%%
\ifnocolorlinks
\hypersetup{colorlinks=false}
\else
\hypersetup{colorlinks=true}
\fi
\hypersetup{
  linkcolor=black,
  anchorcolor=black,
  citecolor=black,
  filecolor=magenta,
  menucolor=red,
  urlcolor=black
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpagestyle{sysustyle}{
%  \sethead[][{\song{}\xiaowuhao{}中山大学\@degree{}学位论文}][] % 偶数页
%  {}{{\song{}\xiaowuhao{}\chaptertitlename\quad\chaptertitle}}{} % 奇数页
\sethead[{\song{}\xiaowuhao{}\@title}][][{\song{}\xiaowuhao{}\chaptertitlename\quad\chaptertitle}] % 偶数页
{{\song{}\xiaowuhao{}\@title}}{}{{\song{}\xiaowuhao{}\chaptertitlename\quad\chaptertitle}} % 奇数页
\setfoot{}{\thepage}{}
\headrule
}
\newpagestyle{sysufrontstyle}{
\sethead[{\song{}\xiaowuhao{}\@title}][][{\song{}\xiaowuhao{}\chaptertitle}] % 偶数页
{{\song{}\xiaowuhao{}\@title}}{}{{\song{}\xiaowuhao{} \chaptertitle}} % 奇数页
\setfoot{}{\thepage}{}
\headrule
}
\newpagestyle{sysunolabelstyle}{
\sethead[{\song{}\xiaowuhao{}\@title}][][{\song{}\xiaowuhao{}\chaptertitlename\quad\chaptertitle}] % 偶数页
{{\song{}\xiaowuhao{}\@title}}{}{{\song{}\xiaowuhao{}\chaptertitlename\quad\chaptertitle}} % 奇数页
\setfoot{}{\thepage}{}
\headrule
}
\renewpagestyle{plain}{
  \setfoot{}{\thepage}{}
}
\renewcommand{\author}[2]{
  \def\@author{#1}
  \newcommand{\@authoreng}{#2}
}
\newcommand{\@titleeng}{}
\newcommand{\@subtitleeng}{}
\renewcommand{\title}[4]{
  \def\@title{#1}
  \renewcommand{\@subtitle}{#2}
  \renewcommand{\@titleeng}{#3}
  \renewcommand{\@subtitleeng}{#4}
}
\newcommand{\newtitleline}{\hfill\\%
  \hspace*{\fill}\hspace{0em}}
\newcommand{\@advisorname}{}
\newcommand{\@advisortitle}{}
\newcommand{\@advisornameeng}{}
\newcommand{\@advisortitleeng}{}
\newcommand{\advisor}[4]{
  \renewcommand{\@advisorname}{#1}
  \renewcommand{\@advisortitle}{#2}
  \renewcommand{\@advisornameeng}{#3}
  \renewcommand{\@advisortitleeng}{#4}
}

\newcommand{\@categorynumber}{}
\newcommand{\categorynumber}[1]{\renewcommand{\@categorynumber}{#1}}
\newcommand{\@secretlevel}{}
\newcommand{\secretlevel}[1]{\renewcommand{\@secretlevel}{#1}}
\newcommand{\@UDC}{}
\newcommand{\UDC}[1]{\renewcommand{\@UDC}{#1}}
\newcommand{\@studentid}{}
\newcommand{\studentid}[1]{\renewcommand{\@studentid}{#1}}


%%%%%%%%学科专业 (比如，计算机软件与理论)名称，含英文%%%%%%%%%%%%
\newcommand{\@majorlen}{8em}
\newcommand{\@major}{}
\newcommand{\@majoreng}{}
\newcommand{\major}[3][8em]{
  \renewcommand{\@majorlen}{#1}
  \renewcommand{\@major}{#2}
  \renewcommand{\@majoreng}{#3}
}
\newcommand{\@school}{}
\newcommand{\school}[1]{\renewcommand{\@school}{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%完成日期%%%%%%%%%%%%%%%
\newcommand{\@finishdate}{}
\newcommand{\finishdate}[1]{\renewcommand{\@finishdate}{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%对基金支持的感谢%%%%%%%%%%
\newif\ifsysuthesisthanks\sysuthesisthanksfalse
\newcommand{\sysuthesis@thanks}{}
\renewcommand{\thanks}[1]{\sysuthesisthankstrue\renewcommand{\sysuthesis@thanks}{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%定义SYSU标识%%%%%%%%%%
\newcommand{\sysuthesis}{%
  S\hspace{-0.3ex}\raisebox{-0.5ex}{Y}\hspace{-0.3ex}S\hspace{-0.3ex}U\hspace{0.1em}%
  \textsc{Thesis}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\maketitle}{
  %
  % 设置书签
  % Note: The `CJKbookmarks' option should only be used for bookmarks
  % *not* in Unicode.
  \GetFileInfo{sysuthesis.cls} % get the correct fileversion
  \hypersetup{
    pdfauthor={\@author},
    pdftitle={\universityname{}\@academicdegree}, %文件标题
    pdfsubject={\@title \@subtitle}, %文件主题
	%以Adobe reader打开文档后，右击=》快捷菜单=》属性，看到的文档的创建程序信息
    pdfcreator={The \sysuthesis{} class (v \fileversion)}  % 应用程序
  }

  \pagestyle{empty}
  \ifdoublecover
  \stcleardp
  \else\fi
  \chinesecover

  \renewcommand*\frontmatter{%
    \if@twoside\cleardoubleoddpage\else\clearpage\fi
    \@mainmatterfalse\pagenumbering{Roman}  % 页码为大写罗马字母
  }  
  
  \ifdoublecover
  \stcleardp
  \else\fi
  \thispagestyle{empty}
  \sysudeclare % 独创性和使用授权声明
  \frontmatter % 开始正文之前的部分
  \pagestyle{sysufrontstyle}
  \clearpage
}

\let\orig@emph=\emph
\renewcommand{\emph}[1]{{\orig@emph{\kai#1}}}
\newcommand{\CoverTopOption}[3][s]{
  \makebox[1.5cm][#1]{\xiaowuhao #2}:{
    \underline{\makebox[1.5cm][c]{\xiaowuhao #3}}}
}

\newcommand{\CoverBottomOption}[3][4.5cm]{
  \makebox[7cm][s]{
    {\song\xiaosihao#2} %宋体小四号
    \underline{\makebox[#1][c]{\hei\xiaosihao#3}} %黑体小四号粗体
  }
}
%%%%%%%%%%%%%%%%%%%%中文封面%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\chinesecover}{  
  \thispagestyle{empty}%
  \vspace*{20pt}
  \begin{center}
   {\song\yihao{ 中山大学\@degree{}学位论文}}
  \end{center}
  \vspace{0.5cm}
  \begin{center}
   
  \end{center}
  \begin{center}
   
  \end{center}
  \begin{center}    
	\erhao\song\textbf\@title\\  %中文标题 宋体二号居中
	\hei\sanhao\normalfont\bfseries{\@titleeng} %English title 黑体三号加粗
  \end{center}
  \vspace*{1.8cm}
  
%  {\sihao\kai
%  \begin{center}
%    \begin{tabular}{rc}
%      \makebox[5em][s]{\authorpre} ：&\underline{\hspace{1.77cm}\@author\hspace{1.77cm}}\medskip\\
%      \makebox[5em][s]{\advisorpre} ：&\underline{\hspace{.95cm}\@advisorname\,\,\@advisortitle\hspace{.95cm}}\medskip\\
%      \makebox[5em][s]{\majornamepre} ：&\underline{\hspace{.53cm}\@major\hspace{.53cm}}\medskip\\
%      \makebox[5em][s]{\schoolnamepre} ：&\underline{\hspace{.05cm}\@school\hspace{.05cm}}\medskip\\
%      & \\
      
%      \committeechairpre ：&\underline{\hspace{5cm}}\medskip\\
%      \committeemempre ：&\underline{\hspace{5cm}}\\
%                        &\underline{\hspace{5cm}}\\
%                       &\underline{\hspace{5cm}}\\
 %                       &\underline{\hspace{5cm}}\medskip\\
%                        &\underline{\hspace{5cm}}\medskip\\
%    \end{tabular}
%  \end{center}  
%  }

{\sihao\kai
  \begin{center}
    \begin{tabular}{rc}
      %\makebox[5em][s]{\authorpre} ：&\underline{\hspace{1.77cm}\@author\hspace{1.77cm}}\medskip\\
      %\makebox[5em][s]{\advisorpre} ：&\underline{\hspace{.95cm}\@advisorname\,\,\@advisortitle\hspace{.95cm}}\medskip\\
      %\makebox[5em][s]{\majornamepre} ：&\underline{\hspace{.53cm}\@major\hspace{.53cm}}\medskip\\
      %\makebox[5em][s]{\schoolnamepre} ：&\underline{\hspace{.05cm}\@school\hspace{.05cm}}\medskip\\
      \makebox[5em][s]{\authorpre} ：&\underline{\hspace{3cm}\@author\hspace{3cm}}\medskip\\
      \makebox[5em][s]{\advisorpre} ：&\underline{\hspace{3cm}\@advisorname\,\,\@advisortitle\hspace{3cm}}\medskip\\
      \makebox[5em][s]{\majornamepre} ：&\underline{\hspace{3cm}\@major\hspace{3cm}}\medskip\\
      \makebox[5em][s]{\schoolnamepre} ：&\underline{\hspace{3cm}\@school\hspace{3cm}}\medskip\\
      & \\
      
      \committeechairpre ：&\underline{\hspace{5cm}}\medskip\\
      \committeemempre ：&\underline{\hspace{5cm}}\\
                        &\underline{\hspace{5cm}}\\
                        &\underline{\hspace{5cm}}\\
                        &\underline{\hspace{5cm}}\medskip\\
%                        &\underline{\hspace{5cm}}\medskip\\
    \end{tabular}
  \end{center}  
  }

  
  \vspace{0.48cm}
  \begin{center}
    {\song\sihao\centerline{\@finishdate} \par} %日期
  \end{center}
  
  %%%%%%%使用sysuthesis@thanks (对基金支持的感谢)%%%%%%%%%%
  \def\blfootnote{\xdef\@thefnmark{}\@footnotetext}
  \ifsysuthesisthanks
  \blfootnote{\wuhao\sysuthesis@thanks}
  \fi
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \stcleardp
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%中文摘要 (符号中山大学定义)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{abstract}[1]
{
  \newcommand{\@keywords}{#1}
  \hypersetup{pdfkeywords={\@keywords}}
  \stcleardp
  \phantomsection
  \addcontentsline{toc}{chapter}{\@abstracttitletoc}
  \renewcommand{\chaptername}{}
  \chapter*{}  
  \chaptermark{摘\quad 要}
  \song\xiaosihao
  \vspace*{-3.0cm}
  \noindent
  \begin{tabular}{rl}
  \makebox[4em][s]{论文题目}：        & \@title\\
  \makebox[4em][s]{专\hspace{\fill}业}：& \@major\\
  \makebox[4em][s]{硕\hspace{\fill}士\hspace{\fill}生}：      & \@author\\
  \makebox[4em][s]{\advisorpre}：      & \@advisorname \,\, \@advisortitle
  \end{tabular}
  
  \vspace{1.5cm}
   \centerline{\xiaoerhao{\hei{\@abstracttitle}}}
  \vspace{0.5cm}
}{
  \par
  %\begin{description}
  %\item[关键词：] \@keywords
  %\end{description}
  \paragraph{\textbf{关键词：}} \@keywords
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%英文摘要(符号中山大学定义)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{ragged2e}
\renewcommand{\raggedright}{\leftskip=0pt \rightskip=0pt plus 0cm}
\newenvironment{englishabstract}[1]
{
  \newcommand{\@keywords}{#1}
  \stcleardp
  \phantomsection
  \addcontentsline{toc}{chapter}{Abstract}
  \renewcommand{\chaptername}{}
  \chapter*{}
  \chaptermark{Abstract}
  \xiaosihao
  \vspace*{-3.0cm}
  \noindent
  \begin{tabular}{ll}
  %Title:         & Distributed-Representations Based Short-Reviews Based Recommender System and Application\\
  
  %\multirow{2}{*}{Title:} &
  %\multicolumn{1}{c}{Distributed-Representations Based Short-Reviews Based Recommender System} \\
%					& and Application\\
  Title:         & \multicolumn{1}{p{5.2in}}{\raggedright\@titleeng}\\
  Major:         & \@majoreng\\
  Name:          & \@authoreng\\
  Supervisor:     & \@advisortitleeng\,\, \@advisornameeng
  \end{tabular}
  
  \vspace{1.5cm}
   \centerline{\xiaoerhao{\hei{Abstract}}}
  \vspace{0.5cm}
}{
  \par
  %\begin{description}
  %\item[Keywords:] \@keywords
  %\end{description}
  \paragraph{\textbf{Keywords:}} \@keywords
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\let\tableofcontents@orig=\tableofcontents
\renewcommand{\tableofcontents}
{
  \stcleardp
  {\linespacing{1.5}%
  \song\xiaosihao%
  \phantomsection
  \tableofcontents@orig \par
  \pagestyle{sysunolabelstyle}
  \renewcommand{\chaptername}{}
  \clearpage} %目录部分字体可采用小四号宋体。
}
\newenvironment{terminology}[1][\@terminologytitle]
{
  \stcleardp
  \phantomsection
  \addcontentsline{toc}{chapter}{#1}
  \chapter*{#1}
  \song\xiaosihao
}{
  \par
}
\newenvironment{Main}
{
  \pagestyle{sysustyle}
  \mainmatter % 开始正文部分
  \song\xiaosihao % 小四号宋体
}{
  \par
  \backmatter % 开始正文之后的部分
}
\renewcommand{\textfraction}{0.07}
\renewcommand{\topfraction}{0.9}
\renewcommand{\bottomfraction}{0.8}
\renewcommand{\floatpagefraction}{0.85}
\setcounter{totalnumber}{6}

%%%%%%%%%%%%参考文献设置%%%%%%%%%%%%%%
\let\originalcite=\cite
\renewcommand{\cite}[1]{\textsuperscript{\originalcite{#1}}}
\renewcommand{\citet}[1]{\originalcite{#1}}
\bibliographystyle{sysuthesis}
%\renewcommand\@biblabel[1]{#1}  % Reference list option change from [1] to 1
\let\orig@bibliography=\bibliography
\renewcommand{\bibliography}[1]{
  \renewcommand{\chaptername}{}
  %{\setlength{\parskip}{3pt}\linespacing{1}\selectfont
  \orig@bibliography{#1}
  %}
  %\pagestyle{sysunolabelstyle}\clearpage % 使参考文献使用 sysunolabel 页面样式
  %\pagestyle{sysufrontstyle}
 } % 恢复原有样式给后续部分



\renewcommand\NAT@citesuper[3]{\ifNAT@swa%
  \unskip\kern\p@\textsuperscript{\NAT@@open #1\NAT@@close}%
  \if*#3*\else\ (#3)\fi\else #1\fi\endgroup}
\DeclareRobustCommand\onlinecite{\@onlinecite}
\def\@onlinecite#1{\begingroup\let\@cite\NAT@citenum\citep{#1}\endgroup}
\def\thudot{\unskip.}
\def\thumasterbib{[硕士学位论文]}
\def\thuphdbib{[博士学位论文]}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{Acknowledgement}[1][\@acknowledgementtitle]
{%
  \stcleardp
  \phantomsection
  \addcontentsline{toc}{chapter}{\@acknowledgementtitletoc}
  \chapter*{#1}
  \chaptermark{致\quad 谢}
  \renewcommand{\chaptername}{}
  \song\xiaosihao
}{\par}

%%%%%%%%%%附录%%%%%%%%%%%%%
\newenvironment{Appendix}
{%
  \pagestyle{sysustyle}
  \@mainmattertrue
  \appendix
  \titlecontentsappendix
}{\@mainmatterfalse\par
  \thispagestyle{sysustyle}\clearpage
}

\newenvironment{Resume}[1][\@resumetitle]
{%
  \stcleardp
  \phantomsection
  \addcontentsline{toc}{chapter}{\@resumetitletoc}
  \chapter*{#1}
  \song\wuhao
}{\par}

\endinput
%%
%% End of file `sysuthesis.cls'.