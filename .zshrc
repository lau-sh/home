autoload -U compinit promptinit
compinit
promptinit; prompt gentoo

zstyle ':completion::complete:*' use-cache 1

bindkey -v
bindkey "^?" backward-delete-char
bindkey "^H" backward-delete-char
bindkey "^W" backward-kill-word
bindkey "^L" backward-kill-line
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
source $HOME/.aliases

export EDITOR="/usr/bin/vim"
export TERM=xterm-256color
