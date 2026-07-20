# =========================================================
# File listing
# =========================================================

# Better ls
alias ls='eza --icons'

# Detailed listing
alias ll='eza -lh --icons --git'

# Detailed listing including hidden files
alias la='eza -lah --icons --git'

# Tree view
alias tree='eza --tree --icons'

# Reuse ls completions for eza
compdef eza=ls

# Better cat
alias cat='bat'

# =========================================================
# Core utilities
# =========================================================

alias grep='rg --color=auto'
alias diff='diff --color=auto'
alias df='df -h'

# Jump to previous directory
alias -- -='cd -'

# =========================================================
# System
# =========================================================

# Reload shell
alias rl='exec zsh'

# Update alias
alias upalias='nano .config/zsh/aliases.zsh'

# =========================================================
# Apt
# =========================================================

alias upg='sudo apt update && sudo apt upgrade -y'
alias clean='sudo apt autoremove && sudo apt autopurge && sudo apt autoclean -y'

# =========================================================
# Update Tools
# =========================================================

alias opg='opencode upgrade'
alias brg='brew update && brew upgrade'
alias bng='bun upgrade'
alias stg='curl -sS https://starship.rs/install.sh | sh'
alias zog='curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh'
alias pnps='pnpm self-update'
alias pnpg='curl -fsSL https://get.pnpm.io/install.sh | sh -'
alias fng='curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell'
alias ktg='curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin'
alias sdg='sdk selfupdate && sdk update && sdk upgrade'
alias rug='rustup update'
