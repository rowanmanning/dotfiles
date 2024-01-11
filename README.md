
# My Dotfiles

These are my dotfiles. They're managed with [chezmoi](https://www.chezmoi.io/).

## Requirements

### All

You need to have the [1Password CLI](https://developer.1password.com/docs/cli/get-started/) installed. Secrets must be stored in a vault named `dotfiles`.

### Mac

It's best to install [Homebrew](https://brew.sh/) first, so that the install script can add relevant formulae.


## Install

Run the following to set up:

```sh
sh -c "$(curl -fsLS https://chezmoi.io/get)" -- init --apply rowanmanning
```
