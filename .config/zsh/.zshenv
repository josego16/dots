# =========================================================
# XDG base directories
# =========================================================

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# =========================================================
# Shell
# =========================================================

export ZDOTDIR="${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}"

# =========================================================
# Editor
# =========================================================

export EDITOR="nano"
export VISUAL="nano"

# =========================================================
# Tool configs
# =========================================================

export STARSHIP_CONFIG="$XDG_CONFIG_HOME/zsh/starship.toml"

# Use bat as the man page viewer
if command -v bat >/dev/null 2>&1; then
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

# =========================================================
# PATH
# =========================================================

# User scripts
export PATH="$HOME/.local/bin:$PATH"

# Homebrew
if [[ -d /home/linuxbrew/.linuxbrew ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Cargo / Rust
. "$HOME/.cargo/env"

# Bun
export BUN_INSTALL="$HOME/.bun"
[[ -s "$BUN_INSTALL/_bun" ]] && export PATH="$BUN_INSTALL/bin:$PATH"

# fnm
FNM_PATH="$HOME/.local/share/fnm"
if [[ -d "$FNM_PATH" ]]; then
  export PATH="$FNM_PATH:$PATH"
fi

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac

# Go
export PATH="/usr/local/go/bin:$PATH"

# Opencode
export PATH="$HOME/.opencode/bin:$PATH"
