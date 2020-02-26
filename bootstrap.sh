#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"
echo "Updating dotfiles..."
git pull origin master
function doIt() {

    if [ -d ~/.oh-my-zsh ]; then
        echo "Oh My Zsh already installed"
    else
        echo "Installing Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    fi

    echo "Creating symlinks..."
    rm -rf ~/.gitconfig ~/.iterm ~/Library/Application\ Support/Code/User/settings.json ~/.vim ~/.vimrc ~/.zshrc
    ln -s ~/.dotfiles/.zshrc ~/.zshrc
    ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
    ln -s ~/.dotfiles/.iterm ~/.iterm
    ln -s ~/.dotfiles/.vim ~/.vim
    ln -s ~/.dotfiles/.vimrc ~/.vimrc
    ln -s ~/.dotfiles/VSCode/settings.json ~/Library/Application\ Support/Code/User/settings.json
    touch ~/.hushlogin

    echo "Loading profile..."
    zsh
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
