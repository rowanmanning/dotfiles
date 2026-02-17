
# My Dotfiles

These are my dotfiles. They're managed with [chezmoi](https://www.chezmoi.io/). There are two variants configured via the `variant` config: `full` is for a personal computer with 1Password for auth, `bare` is for an unauthenticated setup with personal preferences only.

## Requirements

  * You'll need `curl`
  * You'll need an editor (`vim` recommended)
  * It's easier if you install `zsh` up-front

### Variant: full

  * You need to have the [1Password CLI](https://developer.1password.com/docs/cli/get-started/) installed. Secrets must be stored in a vault named `dotfiles`

## Install

Run the following to set up chezmoi:

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init rowanmanning
```

Open up `~/.config/chezmoi/chezmoi.yaml` and set the `variant` property to either `full` or `bare`.

Now run `chezmoi apply`.
