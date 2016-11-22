function setTitle() {
    printf "\033k$1\033\\"
}

function connectInternal() {
    if [ $# -lt 2 ]; then
        declare SSH_CMD="ssh $USER@192.168.224.$1"
    else
        declare SSH_CMD="ssh $2@192.168.224.$1"
    fi

    if [ $TMUX ]; then
        tmux new-window "$SSH_CMD -t \"printf '\033kL$1\033\\'; eval '$SHELL || bash' \""
    else
        eval $SSH_CMD
    fi
}
