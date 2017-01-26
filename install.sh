#!/bin/bash

DISTRO=$(grep ^ID= /etc/*-release)
DISTRO=${DISTRO//\"/}
DISTRO=${DISTRO##*=}

CONVERSION_LIST=(
ctags
gitconfig
gitignore
custom
profile
tmux.conf
vimrc
zshrc
)

INSTALLATION_LIST=(
curl
git
zsh
tmux
vim
)

case "$DISTRO" in
    ubuntu)
        INSTALL_CMD="sudo apt install -y"
        ;;
    fedora)
        INSTALL_CMD="sudo dnf install -y"

        echo "Installing chsh for oh-my-zsh..."
        INSTALLATION_LIST="$INSTALLATION_LIST util-linux-user"
        ;;
    centos)
        INSTALL_CMD="sudo yum install -y"
        ;;
    *)
        echo "Unsupported distribution.  Please fix before using"
        exit 1
esac

echo "Found distribution: $DISTRO"
echo "Using \"$INSTALL_CMD\" as install command..."

$INSTALL_CMD ${INSTALLATION_LIST[*]}

if [ $? -ne 0 ]
then
    echo "Installation list failed.  Check the name of the files to be installed"
    exit 2
fi

echo "Installing dein vim package manager..."

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein_installer.sh
chmod +x dein_installer.sh

mkdir -p $HOME/.vim/bundle
sh dein_installer.sh $HOME/.vim/bundle

if [ $? -ne 0 ]
then
    echo "Installing dein failed."
    exit 3
fi

echo "Install oh-my-zsh..."

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

if [ $? -ne 0 ]
then
    echo "Installing oh-my-zsh failed."
    exit 4
fi

echo "Installing user configuration files..."

function moveToHome() {
	cp -fr $1 $HOME/.$1
}

for file in "${CONVERSION_LIST[@]}"
do
	moveToHome $file
done

if [ $? -ne 0 ]
then
    echo "Moving configuration packages failed."
    exit 5
fi

echo "Installation complete!"
exit 0
