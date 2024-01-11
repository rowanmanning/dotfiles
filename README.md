
# My Dotfiles

These are my dotfiles. They're managed with [chezmoi](https://www.chezmoi.io/).

## Requirements

### All

You need to have the [1Password CLI](https://developer.1password.com/docs/cli/get-started/) installed. Secrets must be stored in a vault named `dotfiles`.

### Mac

It's best to install [Homebrew](https://brew.sh/) first so that the install script can add relevant formulae.

### Linux

If you want to run the install script below then you'll need [`curl`](https://curl.se/) and [`zsh`](https://www.zsh.org/). Use whatever package manager the system comes with.


## Install

Run the following to set up:

```sh
sh -c "$(curl -fsLS https://get.chezmoi.io/)" -- -b $HOME/bin init --apply rowanmanning
```
