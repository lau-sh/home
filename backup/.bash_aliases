# General aliases
alias b-='banner --------'
alias psef='ps -ef | grep'
alias tmux-resize='tmux detach -a'
alias findswp='find . -name "*.sw[l,m,n,o,p]"'

# grep aliases
alias grep='grep --color=auto -nI'
alias fgrep='fgrep --color=auto -nI'
alias egrep='egrep --color=auto -nI'
alias rgrep='grep --color=auto -inI'
alias rgrep='grep --color=auto -nIR'

alias greph='grep --color=auto -IR --include=*.{h,hh,hpp}'
alias grepc='grep --color=auto -IR --include=*.{c,cc,cpp,cxx}'
alias greps='grep --color=auto -IR --include=*.{h,hh,hpp,c,cc,cpp,cxx}'

# ls aliases
alias l='ls --color=auto -CF'
alias la='ls --color=auto -A'
alias ll='ls --color=auto -alF'
alias ls='ls --color=auto'

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias lg++=BuildLocal
alias v=FastVim
alias vr=FastROVim
alias vs=SessionVim

# cd aliases
alias cds='cd ~/Development/pique-server'
alias cdc='cd ~/Development/pique-client'
alias cdt='cd ~/Development/pique-transport'
