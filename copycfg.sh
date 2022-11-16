#!/bin/bash

CONVERSION_LIST=(
bashrc
ctags
gitconfig
profile
vim
vimrc
)

function moveToHome() {
    cp -bfr $1 $HOME/.$1
}

moveToHome tmux.conf

mkdir -p $HOME/.local/bin
mkdir -p $HOME/.local/share

echo "Installing user configuration files..."

for file in "${CONVERSION_LIST[@]}"
do
    moveToHome $file
done

cp -bf gitignore.template $HOME/.local/share

if [ $? -ne 0 ]
then
    echo "Moving configuration packages failed."
    exit 1
fi

echo "Configuration complete!"
exit 0
