#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"
git pull origin master
function doIt() {

    echo "Creating symlinks..."
    rm -rf ~/.bash_profile ~/.bashrc ~/.gitconfig ~/.inputrc
    ln -s ~/.dotfiles/bash/profile ~/.bash_profile
    ln -s ~/.dotfiles/bash/bashrc ~/.bashrc
    ln -s ~/.dotfiles/git/config ~/.gitconfig
    ln -s ~/.dotfiles/bash/inputrc ~/.inputrc

    echo "Updating Homebrew..."
    brew update

    echo "Installing Homebrew packages..."
    brew install bash-completion nvm rbenv ruby-build

    echo "Loading bash_profile..."
    source ~/.bash_profile
    echo "Done!"
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt
    fi
fi
unset doIt