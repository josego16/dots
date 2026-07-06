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
| `install.md` | Step-by-step guide to install fonts, tools, and runtimes |
| `manual.md` | Post-install setup — Zsh, Kitty desktop entry, etc. |

## Quick start

1. Clone the repo:
   ```sh
   git clone git@github.com:josego16/dots.git ~/.dots
   ```

2. Symlink or copy what you need — the configs are portable and expect `$XDG_CONFIG_HOME` to point at `~/.config`.

3. Follow [`install.md`](./install.md) for fonts, CLI tools, and runtimes.

4. Follow [`manual.md`](./manual.md) for shell and terminal setup.

## Philosophy

- **Minimal**: each config file does one thing and does it well.
- **Explicit**: no magic — every setting has a comment explaining why it's there.
- **Portable**: works on a fresh Ubuntu/Debian install with minimal dependencies.

## License

MIT — see [LICENSE](./LICENSE).
