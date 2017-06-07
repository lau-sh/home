#!/bin/bash

DISTRO=$(sudo grep ^ID= /etc/*-release)
DISTRO=${DISTRO//\"/}
DISTRO=${DISTRO##*=}

if [ $? -ne 0 ]
then
    echo "sudo failed.  Please try try again"
    exit 1
fi

CONVERSION_LIST=(
ctags
gitconfig
gitignore
lessfilter
profile
tmux.conf
vimrc
zshrc
)

INSTALLATION_LIST=(
curl
git
python
python3
tmux
vim
zsh
)

POST_INSTALLATION_LIST=(
python-pip
)

function SetupFedora() {
    INSTALL_CMD="sudo dnf install -y --best --allowerasing"

    echo "Installing chsh for oh-my-zsh..."
    INSTALLATION_LIST="$INSTALLATION_LIST util-linux-user"
    POST_INSTALLATION_LIST="$POST_INSTALLATION_LIST the_silver_searcher"
}

function SetupCentOS() {
    INSTALL_CMD="sudo yum install -y"

    INSTALLATION_LIST="$INSTALLATION_LIST epel-release"
    POST_INSTALLATION_LIST="$POST_INSTALLATION_LIST the_silver_searcher"
}

function SetupUbuntu() {
    INSTALL_CMD="sudo apt install -y"

    POST_INSTALLATION_LIST="$POST_INSTALLATION_LIST silversearcher-ag"
}

function AttemptLegacyInstall() {
    typeset dist=$(cat /etc/*-release | cut -d ' ' -f1)

    echo "WARNING: Attempting profile install for legacy distribution"

    if [ $dist == "CentOS" ]; then
        cat /etc/*-release | cut -d ' ' -f3 | grep '5.' > /dev/null 2>&1
        if [ $? -eq 0 ]; then
            echo "Detected old distribution CentOS 5.*"

            SetupCentOS
            return 0
        fi
    fi

    return 1
}

function moveToHome() {
	cp -fr $1 $HOME/.$1
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
    centos)
        SetupCentOS
        ;;
    *)
        AttemptLegacyInstall
        if [ $? -ne 0 ]; then
            echo "Unsupported distribution.  Please fix before using."
            exit 1
        fi
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

echo "Installing dein vim package manager..."

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein_installer.sh
chmod +x dein_installer.sh

mkdir -p $HOME/.vim/bundle
sh dein_installer.sh $HOME/.vim/bundle

DEINEC=$?

rm dein_installer.sh

if [ $DEINEC -ne 0 ]
then
    echo "Installing dein failed."
    exit 3
fi

echo "Install oh-my-zsh..."
echo "Remember to hit CTRL-D when in zsh to finish the rest of the installation"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

if [ $? -ne 0 ]
then
    echo "Installing oh-my-zsh failed."
    exit 4
fi

echo "Installing user configuration files..."

for file in "${CONVERSION_LIST[@]}"
do
	moveToHome $file
done

# .lessfilter needs to be executable
chmod +x $HOME/.lessfilter

if [ $? -ne 0 ]
then
    echo "Moving configuration packages failed."
    exit 5
fi

sudo pip install pygments

if [ $? -ne 0 ]
then
    echo "Pygments installation failed"
    exit 6
fi

cp -fr custom $HOME/.oh-my-zsh

if [ $? -ne 0 ]
then
    echo "Copying .oh-my-zsh failed"
    exit 7
fi

echo "Installation complete!"
exit 0
