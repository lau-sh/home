set -o vi

bindkey -v
bindkey "^?" backward-delete-char
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^H" backward-delete-char
bindkey "^K" kill-line
bindkey "^L" backward-kill-line
bindkey "^R" history-incremental-pattern-search-backward
bindkey "^W" backward-kill-word
