# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
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
alias b-='banner --------'
alias findswp='find . -name "*.sw[l,m,n,o,p]"'
alias psef='ps -ef | grep'
alias tmr='tmux detach -a'

# grep aliases
alias grep='grep --color=auto -nI'
alias fgrep='fgrep --color=auto -nI'
alias egrep='egrep --color=auto -nI'
alias rgrep='grep --color=auto -nIR'

alias greph='grep --color=auto -IR --include=*.{h,hh,hpp}'
alias grepc='grep --color=auto -IR --include=*.{c,cc,cpp,cxx}'
alias grepx='grep --color=auto -IR --include=*.{h,hh,hpp,c,cc,cpp,cxx}'

# ls aliases
alias l='ls'
alias la='ls -A'
alias ll='ls -l'
alias lla='ls -lA'

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
