function FastVim {
    vim -X --noplugin "$@"
}

function FastROVim {
    FastVim -R "$@"
}

function RecurseDirectories {
    find . -type d -exec bash -c "cd {} && $@" \;
}

function BuildLocal {
    g++ -std=c++11 -static -Wl,--whole-archive -lpthread -Wl,--no-whole-archive "$@"
}

function PromptCommand {
    return
}
