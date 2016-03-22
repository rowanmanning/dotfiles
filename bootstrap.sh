#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"
echo "Updating dotfiles..."
git pull origin master
function doIt() {

    echo "Creating symlinks..."
    rm -rf ~/.atom ~/.bash_profile ~/.bashrc ~/.gitconfig ~/.inputrc ~/.vim ~/.vimrc ~/.tmux.conf ~/.tmuxinator
    ln -s ~/.dotfiles/.atom ~/.atom
    ln -s ~/.dotfiles/.bash_profile ~/.bash_profile
    ln -s ~/.dotfiles/.bashrc ~/.bashrc
    ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
    ln -s ~/.dotfiles/.inputrc ~/.inputrc
    ln -s ~/.dotfiles/.vim ~/.vim
    ln -s ~/.dotfiles/.vimrc ~/.vimrc
    ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
    ln -s ~/.dotfiles/.tmuxinator ~/.tmuxinator
    touch ~/.hushlogin

    if [ "$(which apm)" ]; then
        echo "Installing Atom packages..."
        cat ~/.dotfiles/.atom/.packages | while read line; do
            if [[ $line != \#* ]]; then
                apm install $line
            fi
        done
    else
        echo "Not installing Atom packages (apm command is not installed)..."
    fi

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
