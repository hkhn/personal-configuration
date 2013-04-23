SHELL=$(which zsh)

# load bashrc
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# prompt
# enable to use some syntax in prompt
setopt prompt_subst
# colors
COLOR_DEFAULT=$'%{\e[0m%}'
COLOR_BLACK=$'%{\e[1;30m%}'
COLOR_RED=$'%{\e[1;31m%}'
COLOR_GREEN=$'%{\e[1;32m%}'
COLOR_YELLOW=$'%{\e[1;33m%}'
COLOR_BLUE=$'%{\e[1;34m%}'
COLOR_MAGENTA=$'%{\e[1;35m%}'
COLOR_CYAN=$'%{\e[1;36m%}'
COLOR_WHITE=$'%{\e[1;37m%}'
COLOR_RANDOM=$'%{\e[1;$[31+$RANDOM%6]m%}'
# for screen status title (display executing command name)
SCREEN_PROMPT_EXEC_COMMAND=$'%{\ek\e\\%}'
SCREEN_PROMPT_CWD=$'%{\ek$(hostname -s):$(basename $(pwd))\e\\%}'
CR=$'%{`echo -ne \"\r\"`%}'
#SCREEN_PROMPT="${SCREEN_PROMPT_EXEC_COMMAND}${SCREEN_PROMPT_CWD}${CR}"
SCREEN_PROMPT=""

# #PROMPT='[%n@%m %~]%% '
# #PROMPT='[%n@%m]$ '
# PROMPT="${SCREEN_PROMPT}${COLOR_MAGENTA}%B[%n@%m]%b${COLOR_DEFAULT}%b\$ "

# RPROMPT=' [%~]'

autoload -U colors; colors

function prompt-git-current-branch {
    ## http://d.hatena.ne.jp/uasi/20091017/1255712789
    local name st color

    #name=$(basename "$(git symbolic-ref HEAD 2>/dev/null)")
    name=$(echo "$(git symbolic-ref HEAD 2>/dev/null)" | sed -e 's/^refs\/heads\///')
    if [[ -z "$name" ]]; then
        ## not in git branch
        return
    fi
    st=$(git status . 2>/dev/null)
    if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
        color=${fg[green]}
    elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
        color=${fg[yellow]}
    elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
        color=${fg_bold[red]}
    else
        color=${fg[red]}
    fi

    echo "(git:%{$color%}$name%{$reset_color%})"
}
function prompt-svn-current-branch {
    local st branch rev lastrev color revname

    LANG=en_US.UTF-8

    st=$(svn info 2>/dev/null)
    if [[ -z "$st" ]]; then
        ## not in svn
        return
    fi
    branch=$(echo $st | grep '^URL: ' | sed -e 's/^URL: .*\///g')
    rev=$(echo $st | grep '^Revision: ' | sed -e 's/^Revision: //g')
    lastrev=$(echo $st | grep '^Last Changed Rev: ' | sed -e 's/^Last Changed Rev: //g')

    if [[ "$rev" == "$lastrev" ]]; then
        color=${fg[green]}
        revname=HEAD
    else
        color=${fg_bold[red]}
        revname=$rev
    fi

    echo "(svn:%{$color%}$branch=$revname%{$reset_color%})"
}
function echo_prompt() {

    LANG=en_US.UTF-8 ## for time locale

    print -n "$SCREEN_PROMPT"
    print -n '['
    print -n "%{${fg_bold[green]}%n$reset_color%}"
    print -n '@'
    print -n "%{${fg_bold[green]}%m$reset_color%}"
    print -n ' '
    ##print -n "%{${fg_bold[magenta]}$(date +'%Y-%m-%d (%a) %H:%M:%S')$reset_color%}"
    print -n "%{${fg_bold[magenta]}$(date +'%Y-%m-%d %H:%M:%S')$reset_color%}"
    print -n ']'
    print -n ' '
    print -n "%{${fg_bold[yellow]}%~$reset_color%}"
    print
    print -n "j%(1j,%{${fg_bold[cyan]}%j$reset_color%},0)"
    print -n " \$ "
}
function echo_rprompt() {
    print -n "$(prompt-git-current-branch)$(prompt-svn-current-branch)"
}

PROMPT='$(echo_prompt)'
RPROMPT='$(echo_rprompt)'

# functions path
fpath=(~/.zsh/functions ${fpath})

# path compaction
typeset -U path

# for completion
autoload -U compinit
compinit -u

# history
# don't put duplicate lines in the history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
# share history data
setopt share_history
export HISTFILE=~/.zsh_history
export SAVEHIST=$HISTFILESIZE

zshaddhistory() {
    local line=${1%%$'\n'}
    local cmd=${line%% *}

    # 以下の条件をすべて満たすものだけをヒストリに追加する
    [[ ${cmd} != exit
       && ${cmd} != history
       && ${cmd} != ([fb]g)
       #&& ${cmd} != (l[sal])
       #&& ${cmd} != cd
       #&& ${cmd} != man
    ]]
}

# auto cd (implicit cd)
setopt auto_cd
# use cd like pushd (cd -[tab])
setopt auto_pushd
# suggest correct command
#setopt correct
# shrink complete list display
setopt list_packed
# no beep when completion
setopt nolistbeep
# enable completion also for alias
setopt complete_aliases

# disable C-s C-q
setopt no_flow_control

# emacs like keybind
bindkey -e

# color files when completion
zstyle ':completion:*' list-colors ''

# screen
# display last command for screen title
case "${TERM}" in screen)
    # preexec() {
    #     echo -ne "\ek#${1%% *}\e\\"
    # }
    # precmd() {
    #     echo -ne "\ek$(basename $(pwd))\e\\"
    preexec() {
        echo -ne "\ek#$(echo ${1%% *} | cut -c-4)\e\\"
    }
    precmd() {
        echo -ne "\ek$(basename $(pwd) | cut -c-4)\e\\"
    }
    ;;
esac
