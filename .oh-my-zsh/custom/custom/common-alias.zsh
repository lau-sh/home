# Remove prepared aliases from lib
unalias l
unalias please
unalias which-command

# Suffix aliases
alias -s c=vim
alias -s cc=vim
alias -s conf=vim
alias -s cpp=vim
alias -s cu=vim
alias -s h=vim
alias -s hpp=vim
alias -s htm=vim
alias -s html=vim
alias -s js=vim
alias -s py=vim
alias -s xml=vim

alias -s pdf=evince

# Global aliases
alias -g G='| grep'
alias -g L='| less'
alias -g V='| grep -v'

# General aliases
alias b-='banner --------'
alias psef='ps -ef | grep'
alias tmux-reload='tmux detach -a'
alias neww='tmux new-window'
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

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
