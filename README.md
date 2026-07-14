# dots

Personal dotfiles — a curated set of configurations for my development environment.

## What's inside

| Directory / File | Purpose |
|---|---|
| `.config/kitty/` | Kitty terminal emulator config + theme |
| `.config/opencode/` | OpenCode AI editor configuration |
| `.config/zed/` | Zed editor settings, keymap, tasks, themes |
| `.config/zsh/` | Zsh shell config — plugins, aliases, bindings, prompt |
| `.gitconfig` | Git identity, signing, rebase, and push defaults |

## Quick start

```sh
# Clone into your home directory
git clone git@github.com:josego16/dots.git ~/.dots

# Symlink the configs you want (example: zsh + kitty)
ln -sf ~/.dots/.config/kitty   ~/.config/kitty
ln -sf ~/.dots/.config/zsh     ~/.config/zsh
ln -sf ~/.dots/.gitconfig      ~/.gitconfig

# Then complete the setup below
```

The configs expect `$XDG_CONFIG_HOME` to point at `~/.config`.

## Setup

### Zsh

#### 1. Point Zsh at the right config directory

Add the following to `/etc/zsh/zshenv`:

```sh
if [[ -z "$XDG_CONFIG_HOME" ]]; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi

if [[ -d "$XDG_CONFIG_HOME/zsh" ]]; then
    export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
fi
```

This tells Zsh to look for its config files in `~/.config/zsh/` instead of `~/.`.

#### 2. Set Zsh as your default shell

```sh
chsh -s $(which zsh)
```

Log out and back in for the change to take effect.

#### 3. Create state directories

```sh
mkdir -p ~/.local/state/zsh   # shell history
mkdir -p ~/.cache/zsh         # completion cache
```

These are required — Zsh writes history and cached completions here.

### Kitty

Link the Kitty binary and register the desktop entry so it appears in your app launcher:

```sh
# Link the binary into PATH
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/

# Register the desktop entry
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
```

## Philosophy

- **Minimal** — each config file does one thing and does it well.
- **Explicit** — no magic; every setting has a comment explaining why.
- **Portable** — works on a fresh Linux install with minimal dependencies.

## License

MIT — see [LICENSE](./LICENSE).
