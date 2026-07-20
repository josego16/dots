# =========================================================
# XDG base directories
# =========================================================

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export ZDOTDIR="${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}"

# =========================================================
# Editor
# =========================================================

export EDITOR="nano"
export VISUAL="nano"

# =========================================================
# Pager
# =========================================================

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
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

# Opencode
export PATH="$HOME/.opencode/bin:$PATH"
