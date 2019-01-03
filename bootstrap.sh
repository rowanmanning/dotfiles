#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"
echo "Updating dotfiles..."
git pull origin master
function doIt() {

    echo "Creating symlinks..."
    rm -rf ~/.bash_profile ~/.bashrc ~/.gitconfig ~/.inputrc ~/Library/Application\ Support/Code/User/settings.json ~/.vim ~/.vimrc ~/.tmux.conf
    ln -s ~/.dotfiles/.bash_profile ~/.bash_profile
    ln -s ~/.dotfiles/.bashrc ~/.bashrc
    ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
    ln -s ~/.dotfiles/.inputrc ~/.inputrc
    ln -s ~/.dotfiles/.vim ~/.vim
    ln -s ~/.dotfiles/.vimrc ~/.vimrc
    ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
    ln -s ~/.dotfiles/VSCode/settings.json ~/Library/Application\ Support/Code/User/settings.json
    touch ~/.hushlogin

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
