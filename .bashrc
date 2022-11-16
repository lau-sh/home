# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Add colors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && \
        eval "$(dircolors -b ~/.dircolors)" || \
        eval "$(dircolors -b)"

    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# User-defined functions
function FastVim {
    vim -X --noplugin "$@"
}

function GenGitignore {
    if [[ $# -eq 0 ]]; then
        cp $HOME/.local/share/gitignore.template .gitignore
    else
        cp $HOME/.local/share/gitignore.template "$@"
    fi
}

function ROVim {
    FastVim -R "$@"
}

function RecurseDirectories {
    find . -type d -exec bash -c "cd {} && $@" \;
}

# User specific aliases and functions
alias tmux="tmux -2"
alias lessn="less -N"

# user-defined function aliases
alias fvi='FastVim'
alias rovi='ROVim'
alias rd='RecurseDirectories'
alias genignore="GenGitignore"

# General aliases
alias b-='figlet -- --------'
alias findswp='find . -name "*.sw[l,m,n,o,p]"'
alias psef='ps -ef | grep'
alias tmr='tmux detach -a'

# grep aliases
alias grep='grep -nI'
alias fgrep='fgrep -nI'
alias egrep='egrep -nI'
alias rgrep='grep -nIR'

alias greph='grep --color=auto -IR --include=*.{h,hh,hpp}'
alias grepc='grep --color=auto -IR --include=*.{c,cc,cpp,cxx}'
alias grepx='grep --color=auto -IR --include=*.{h,hh,hpp,c,cc,cpp,cxx}'

# ls aliases
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -lF'
alias lla='ls -lAF'

export EDITOR="vim -X --noplugin"
export GIT_EDITOR="$EDITOR"
export MANPAGER=less
export PAGER=less
export TERM="xterm-256color"

export DEFAULT_SESSION_NAME="$(basename $SHELL)"
export DEFAULT_SESSION_COLOR="lightblue,bold"
export LESS='-RN'

# ssh
export DEFAULT_SESSION_NAME="$(basename $SHELL)"
export DEFAULT_SESSION_COLOR="lightblue,bold"

export ARCHFLAGS="-arch x86_64"
export SYSTEMD_PAGER=cat

# Additional settings

# History
# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# append to the history file, don't overwrite it
shopt -s histappend

# fix window lines/columns on resize
shopt -s checkwinsize

# enable **
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

PS1='${debian_chroot:+($debian_chroot)}\
\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Bash completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
