#!/bin/bash

DISTRO=$(sudo grep ^ID= /etc/*-release)
DISTRO=${DISTRO//\"/}
DISTRO=${DISTRO##*=}

if [ $? -ne 0 ]
then
    echo "sudo failed.  Please try again"
    exit 1
fi

CONVERSION_LIST=(
bashrc
ctags
gitconfig
profile
vim
vimrc
)

INSTALLATION_LIST=(
curl
figlet
git
tmux
vim
)

POST_INSTALLATION_LIST=(
)

function moveToHome() {
    cp -fr $1 $HOME/.$1
}

function SetupFedora() {
    INSTALL_CMD="sudo dnf install -y --best --allowerasing"

    INSTALLATION_LIST="$INSTALLATION_LIST util-linux-user"
    POST_INSTALLATION_LIST="$POST_INSTALLATION_LIST powerline-fonts the_silver_searcher"

    moveToHome tmux.conf
}

function SetupUbuntu() {
    INSTALL_CMD="sudo apt install -y"

    POST_INSTALLATION_LIST="$POST_INSTALLATION_LIST fonts-powerline silversearcher-ag"
    moveToHome tmux.conf
}

case "$DISTRO" in
    raspbian)
        SetupUbuntu
        ;;
    ubuntu)
        SetupUbuntu
        ;;
    fedora)
        SetupFedora
        ;;
    *)
        echo "Unsupported distribution.  Please fix before using."
        exit 1
esac

echo "Found distribution: $DISTRO"
echo "Using \"$INSTALL_CMD\" as install command..."

$INSTALL_CMD ${INSTALLATION_LIST[*]}
$INSTALL_CMD ${POST_INSTALLATION_LIST[*]}

if [ $? -ne 0 ]
then
    echo "Installation list failed.  Check the name of the files to be installed"
    exit 2
fi

mkdir -p $HOME/.local/bin
mkdir -p $HOME/.local/share

echo "Installing user configuration files..."

for file in "${CONVERSION_LIST[@]}"
do
    moveToHome $file
done

cp -f gitignore.template $HOME/.local/share

if [ $? -ne 0 ]
then
    echo "Moving configuration packages failed."
    exit 3
fi

echo "Installation complete!"
exit 0
