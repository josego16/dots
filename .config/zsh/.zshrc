# =========================================================
# History
# =========================================================

HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

# =========================================================
# Shell behaviour
# =========================================================

setopt AUTOCD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT  # sort file10 after file9, not after file1

# =========================================================
# GPG
# =========================================================

export GPG_TTY=$(tty)

# =========================================================
# Navigation
# =========================================================

# Initialize zoxide
eval "$(zoxide init zsh)"

# =========================================================
# Completion
# =========================================================

# Load completion system
autoload -Uz compinit

# Initialize completion with cached metadata file
compinit -u -d "$XDG_CACHE_HOME/zsh/zcompdump"

# Enable interactive completion menu selection
zstyle ':completion:*' menu select

# Make completion case-insensitive
# Example: "doc" can complete to "Documents"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # lowercase input matches upper and lower

# Colorized file completions (fzf-tab)
if command -v vivid >/dev/null 2>&1; then
  export LS_COLORS="$(vivid generate dracula)"
fi

# =========================================================
# Fuzzy finder
# =========================================================

# Homebrew fzf shell integration
if command -v brew >/dev/null 2>&1; then
  fzf_shell="$(brew --prefix fzf)/shell"
  if [[ -d "$fzf_shell" ]]; then
    . "$fzf_shell/key-bindings.zsh"
    . "$fzf_shell/completion.zsh"
  fi
fi

# =========================================================
# Modular Config Files
# =========================================================

# fzf configuration
. "$ZDOTDIR/fzf.zsh"

# Aliases
. "$ZDOTDIR/aliases.zsh"

# Custom keybindings
. "$ZDOTDIR/bindings.zsh"

# Plugins and plugin manager
. "$ZDOTDIR/plugins.zsh"

# Prompt/theme
. "$ZDOTDIR/prompt.zsh"

# =========================================================
# Node
# =========================================================

# fnm — auto-switch Node version, shell functions
if [ -d "$HOME/.local/share/fnm" ]; then
  eval "$(fnm env --shell zsh)"
fi

# =========================================================
# Java
# =========================================================

# sdkman — Java version manager
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && . "$HOME/.sdkman/bin/sdkman-init.sh"

# pnpm
export PNPM_HOME="/home/josedev/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end
