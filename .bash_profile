#!/bin/bash



# Functions
# =========

# Get a truncated version of the current directory
pwd_truncated () {
    dir=$(pwd)
    if [ ${#dir} -gt 16 ]; then
        dir="…$(echo $dir | rev | cut -c-15 | rev)"
    fi
    echo $dir
}

# Get the current git branch name
get_git_branch () {
    if [[ ! `which git` == "" && -d "$(pwd)/.git" ]]; then
        branch_name="$(git symbolic-ref HEAD 2>/dev/null)" || branch_name="-"
        branch_name=${branch_name##refs/heads/}
        echo $branch_name;
    fi
}

# Get whether the tree is dirty
is_git_tree_dirty () {
    if [[ ! `which git` == "" && -d "$(pwd)/.git" ]]; then
        tree_dirty=$([ "$(git status --porcelain)" == "" ] && echo "" || echo "1")
        echo $tree_dirty;
    fi
}



# Aliases
# =======

# Directory navigation
export OLDPWD=`pwd`
alias ~="cd ~"
alias -- -="cd - > /dev/null"
alias ..="cd .."
alias ...="cd ../.."

# Listing
alias ll="ls -Fhlo"
alias la="ls -AFhlo"

# Improved cat (requires https://github.com/rstacruz/hicat)
alias hi="hicat"

# Directory creation
function mcd() { mkdir -p "$1" && cd "$1"; }

# Directory removal
alias rmr="rm -rf"

# Git
alias pull="git pull"
alias push="git push"
alias st="git status"
alias nuke-local-branches="git br | xargs -L1 echo | while read line; do if [[ ! \"\$line\" =~ ^\s*\* ]] ; then git br -d \"\$line\"; fi; done"



# Bash Config
# ===========

# Set the PATH
export PATH="./node_modules/.bin:/usr/local/bin:$PATH:/usr/bin:$HOME/bin"

# Make vim the default editor
export EDITOR="vim"

# Ignore duplicate commands in the history
export HISTCONTROL=ignoredups

# Increase the maximum number of lines contained in the history file
# (default is 500)
export HISTFILESIZE=10000

# Increase the maximum number of commands to remember
# (default is 500)
export HISTSIZE=10000

# Don't clear the screen after quitting a manual page
export MANPAGER="less -X"

# Make new shells get the history lines from all previous
# shells instead of the default "last window closed" history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Make things colorful
export CLICOLOR=1
export LSCOLORS=dxfxcxdxbxegedabagacad

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Check the window size after each command and, if necessary, update the values
# of LINES and COLUMNS.
shopt -s checkwinsize

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob



# Initialise Tools
# ================

# Initialise rbenv if present
if [ ! `which rbenv` == "" ]; then
    eval "$(rbenv init -)"
fi

# Initialise nvm (requires it to be at ~/.nvm)
export NVM_DIR=~/.nvm
if [ -f "$NVM_DIR/nvm.sh" ]; then
    source "$NVM_DIR/nvm.sh"
fi

# Initialise bash completion
if [ ! `which brew` == "" ]; then

    # Only use `brew` after it has been added to the PATH
    bash_completion_path="$(brew --prefix)/etc/bash_completion"

    # Source Bash completion (installed via Homebrew)
    if [[ -r $bash_completion_path ]]; then
        source $bash_completion_path
    fi

fi



# Command Prompt
# ==============

function prompt_git_info () {
    if [ ! `get_git_branch` == "" ]; then
        dirty_indicator=$([ "$(is_git_tree_dirty)" == "" ] && echo "" || echo "!")
        echo " [$(get_git_branch)$dirty_indicator]"
    fi
}

PS1="\[$(tput setaf 8)\]\$(pwd_truncated)\$(prompt_git_info)$ \[$(tput sgr0)\]"



# Load .extra
# ===========

source $HOME/.extra
