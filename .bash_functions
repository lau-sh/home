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

function BuildLocal {
    g++ -std=c++11 -static -Wl,--whole-archive -lpthread -Wl,--no-whole-archive -I ~/.Applications/include -L ~/.Applications/lib "$@"
}
