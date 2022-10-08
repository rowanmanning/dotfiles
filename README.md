
# My Dotfiles

These are my dotfiles. They're managed with [chezmoi](https://www.chezmoi.io/).

## Requirements

### Mac

It's best to install [Homebrew](https://brew.sh/) first, so that the install script can add relevant formulae.


## Install

Run the following to set up:

```sh
sh -c "$(curl -fsLS https://chezmoi.io/get)" -- init --apply rowanmanning
```

Then add this content to `~/.config/chezmoi/chezmoi.json`:

```json
{
    "data": {
        "name": "Rowan Manning",
        "email": "<EMAIL>",
        "useFTVault": true
    }
}
```

Then run:

```sh
chezmoi apply
```
