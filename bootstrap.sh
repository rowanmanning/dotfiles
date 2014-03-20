#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"
git pull origin master
function doIt() {
    rm -rf ~/.bash_profile ~/.bashrc ~/.gitconfig ~/.inputrc
    ln -s ~/.dotfiles/bash/profile ~/.bash_profile
    ln -s ~/.dotfiles/bash/bashrc ~/.bashrc
    ln -s ~/.dotfiles/git/config ~/.gitconfig
    ln -s ~/.dotfiles/bash/inputrc ~/.inputrc
    source ~/.bash_profile
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