function FastVim {
    vim -X --noplugin "$@"
}

function FastROVim {
    FastVim -R "$@"
}

function SessionVim {
    vim -S Session.vim "$@"
}

function PromptCommand {
    return
}

function RecurseDirectories {
    find . -type d -exec bash -c "cd {} && $@" \;
}
