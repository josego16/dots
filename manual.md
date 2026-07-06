# Setup

Post-install steps to activate the dotfiles: point Zsh at the right config directory, set up Kitty's desktop entry, and create required state directories.

## Zsh Configuration

### 1. Point Zsh at the config directory

Add the following to `/etc/zsh/zshenv`:

```sh
if [[ -z "$XDG_CONFIG_HOME" ]]
then
    export XDG_CONFIG_HOME="$HOME/.config"
fi

if [[ -d "$XDG_CONFIG_HOME/zsh" ]]
then
    export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
fi
```

### 2. Set Zsh as your default shell

```sh
chsh -s $(which zsh)
```

### 3. Create required directories

```sh
mkdir -p ~/.local/state/zsh   # history
mkdir -p ~/.cache/zsh         # completion cache
```

## Kitty Configuration

Link the Kitty binary and install its desktop entry so it appears in your app launcher:

```sh
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
```
