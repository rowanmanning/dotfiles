#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"
echo "Updating dotfiles..."
git pull origin master
function doIt() {

    echo "Creating symlinks..."
    rm -rf ~/.bash_profile ~/.bashrc ~/.gitconfig ~/.inputrc ~/.vim ~/.vimrc ~/.tmux.conf ~/.tmuxinator
    ln -s ~/.dotfiles/bash/profile ~/.bash_profile
    ln -s ~/.dotfiles/bash/bashrc ~/.bashrc
    ln -s ~/.dotfiles/git/config ~/.gitconfig
    ln -s ~/.dotfiles/bash/inputrc ~/.inputrc
    ln -s ~/.dotfiles/vim/vimrc ~/.vimrc
    ln -s ~/.dotfiles/vim ~/.vim
    ln -s ~/.dotfiles/tmux/conf ~/.tmux.conf
    ln -s ~/.dotfiles/tmux/tmuxinator ~/.tmuxinator
    touch ~/.hushlogin

    echo "Updating Homebrew..."
    brew update

    echo "Installing Homebrew packages..."
    brew install bash-completion rbenv ruby-build tmux reattach-to-user-namespace

    echo "Installing nvm"
    git clone git@github.com:creationix/nvm.git ~/.nvm

    echo "Updating nvm"
    cd ~/.nvm
    git fetch && git checkout `git describe --abbrev=0 --tags`
    cd -

    echo "Installing latest node"
    source ~/.nvm/nvm.sh
    nvm install 0.12
    nvm alias default 0.12

    echo "Installing Ruby and gems..."
    brew upgrade rbenv ruby-build
    rbenv install -s 2.1.2
    rbenv global 2.1.2
    gem install foreman tmuxinator
    rbenv rehash

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