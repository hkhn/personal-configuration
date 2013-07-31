## command prompt
## colors
COLOR_DEFAULT='\e[0m'
COLOR_BLACK='\e[1;30m'
COLOR_RED='\e[1;31m'
COLOR_GREEN='\e[1;32m'
COLOR_YELLOW='\e[1;33m'
COLOR_BLUE='\e[1;34m'
COLOR_MAGENTA='\e[1;35m'
COLOR_CYAN='\e[1;36m'
COLOR_WHITE='\e[1;37m'
## default
#PS1='\s-\v\$'
#PS1="[\u@\h \W]\$ "

### http://d.hatena.ne.jp/notogawa/20120720/1342756620
function length()
{
    echo -n ${#1}
}
function init-prompt-git-branch()
{
    git symbolic-ref HEAD 2>/dev/null >/dev/null &&
    echo "($(git symbolic-ref HEAD 2>/dev/null | sed 's/^refs\/heads\///'))"
}
if which git 2>/dev/null >/dev/null
then
    export PS1_GIT_BRANCH='\[\e[$[COLUMNS]D\]\[\e[1;31m\]\[\e[$[COLUMNS-$(length $(init-prompt-git-branch))]C\]$(init-prompt-git-branch)\[\e[$[COLUMNS]D\]\[\e[0m\]'
else
    export PS1_GIT_BRANCH=
fi
#export PS1="\[\e[32;1m\]\u@\H \[\e[33;1m\]\w $PS1_GIT_BRANCH\n\[\e[36;1m\]\t \[\e[0m\]\$ "
#export PS1="\[\e[32;1m\]\u@\H \[\e[33;1m\]\w $PS1_GIT_BRANCH\n\[\e[35;1m\]\t\[\e[0m\] (\[\e[36;1m\]j\j\[\e[0m\]) \[\e[0m\]\$ "
export PS1="\[\e[32;1m\]\u@\H \[\e[33;1m\]\w $PS1_GIT_BRANCH\n\$ "

## for screen status title (display executing command name)
SCREEN_PROMPT_EXEC_COMMAND='\ek\e\134'
SCREEN_PROMPT_CWD='\\ek$(basename $(pwd))\\e\\134'
#PROMPT_COMMAND='echo -ne "\033k\033\134"'
## display cwd when executing no command
PROMPT_COMMAND='echo -ne "${SCREEN_PROMPT_EXEC_COMMAND}$(eval echo ${SCREEN_PROMPT_CWD})\r"'

## japanese
export LANG=ja_JP.UTF-8
#export LANG=ja_JP.EUC-JP
export TZ=JST-9
export JLESSCHARSET=utf-8

## PATH
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=${HOME}/local/bin:${HOME}/local/sbin:$PATH

export LIBRARY_PATH=/opt/local/lib:$LIBRARY_PATH
export LIBRARY_PATH=${HOME}/local/lib:$LIBRARY_PATH

export LD_LIBRARY_PATH=$LIBRARY_PATH:$LD_LIBRARY_PATH

case $(uname) in
    Darwin )
        # export DYLD_LIBRARY_PATH=$LIBRARY_PATH:$DYLD_LIBRARY_PATH
        ;;
    * )
        ;;
esac

export CPLUS_LIBRARY_PATH=$LIBRARY_PATH:$CPLUS_LIBRARY_PATH

export C_INCLUDE_PATH=/opt/local/include:$C_INCLUDE_PATH
export C_INCLUDE_PATH=${HOME}/local/include:$C_INCLUDE_PATH

export CPLUS_INCLUDE_PATH=$C_INCLUDE_PATH:$CPLUS_INCLUDE_PATH

# for Python
export PYTHONPATH=${HOME}/local/lib/python

# for Java
# export JAVA_HOME=/usr/local/java
# case $(uname) in
#     Darwin )
#         export CLASSPATH=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Classes:$CLASSPATH
#         ;;
# esac
export _JAVA_OPTIONS="-Dfile.encoding=UTF-8"
export CLASSPATH=$HOME/local/lib/java/jar/langdetect.jar:$CLASSPATH

# # for CPAN
# export PKG_DBDIR=${HOME}/local/var/db/pkg
# export PORT_DBDIR=${HOME}/local/var/db/pkg
# export INSTALL_AS_USER=$(whoami)
# export PERL5LIB=${HOME}/local/perl5/lib/perl5:$PERL5LIB

# ## for local::lib
# ##   HOW TO INSTALL
# ##     get local::lib src package from CPAN
# ##     $ perl Makefile.PL --bootstrap=$HOME/local
# ##     $ make && make test && make install
# ##     $ source $HOME/.bashrc ## eval the following line
# eval $(perl -I$HOME/local/perl5/lib/perl5 -Mlocal::lib=$HOME/local/perl5)

# Don't put duplicate lines in the history
export HISTCONTROL="ignoredups"
export HISTSIZE=10000
export HISTFILESIZE=10000000
export HISTIGNORE="[fb]g:exit:history"

function share_history {
history -a
history -c
history -r
}
PROMPT_COMMAND="share_history;$PROMPT_COMMAND"

case $(basename $SHELL) in
    bash )
        shopt -s histappend
        shopt -s histverify
        shopt -s histreedit

        shopt -u histappend

        shopt -u hostcomplete
        shopt -s no_empty_cmd_completion
        ;;
    * )
        ;;
esac

# CVS
export CVSROOT=/home/cvs
# editor for subversion
export SVN_EDITOR=vi

# alias
case $(uname) in
    Darwin )
        if [ -f /opt/local/bin/gls ]; then
            alias ls='/opt/local/bin/gls -F --color=tty --show-control-chars'
        else
            alias ls='ls -F --color=tty --show-control-chars'
        fi
        ;;
    * )
        alias ls='ls -F --color=tty --show-control-chars'
        ;;
esac

case $(uname) in
    Darwin )
        if [ -f /opt/local/bin/gseq ]; then
            alias seq='/opt/local/bin/gseq'
        fi
        ;;
    * )
        ;;
esac

alias ll='ls -l'
alias la='ls -A'
alias rm='rm -i'
alias mv='mv -v'
alias patch='patch -b'
alias less='less -X'
alias grep='grep --color=auto'

alias guile='rlwrap guile'

# alias python='/opt/local/bin/python2.7'
# alias pydoc='/opt/local/bin/pydoc2.7'

case $(uname) in
    Darwin )
        alias acroread='open -a /Applications/Adobe\ Reader.app'
        ## for zsh completion
        alias acread='open -a /Applications/Adobe\ Reader.app'
        alias emacs='open -a /Applications/Emacs.app'
        alias emacsclient='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -n'
        alias gvim='open -a /Applications/MacPorts/MacVim.app'
        ;;
    * )
        ;;
esac

alias e='emacsclient'
alias em='emacs'
alias v='vim'
alias vi='vim'
#export ALTERNATE_EDITOR='vi'

alias cpan-uninstall='perl -MConfig -MExtUtils::Install -e '"'"'($FULLEXT=shift)=~s{-}{/}g;uninstall "$Config{sitearchexp}/auto/$FULLEXT/.packlist",1'"'"

# set dir_colors (for ls --color)
#eval `dircolors ~/.dir_colors.b -b`
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30:or=45;30'

# new file permission is always 644
umask 022
# do not make core-file
ulimit -c 0

# disable terminal lock by \C-s
stty stop undef
stty start undef

alias ssh='env TERM=xterm-256color ssh'
#alias emacs='env TERM=xterm-256color emacs'
