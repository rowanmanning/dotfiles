
My Dotfiles
===========

These are my dotfiles. Vast swathes copied from [Mathias' dotfiles][mathias]. They run on a Mac only (for now).

Installing
----------

You'll need both [Homebrew][brew] and Git installed for this to work. You can install Git with `brew install git` once Homebrew is present.

```sh
git clone https://github.com/rowanmanning/dotfiles.git ~/.dotfiles && cd ~/.dotfiles && source bootstrap.sh
```


Updating
--------

To update .dotfiles, run the following:

```sh
cd ~/.dotfiles && source bootstrap.sh
```


Custom Commands
---------------

You can create an `~/.extra` file for things like git author name. Mine looks like this:

```sh
# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="Rowan Manning"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="info@rowanmanning.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```



[brew]: http://brew.sh/
[mathias]: https://github.com/mathiasbynens/dotfiles
