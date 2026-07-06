# eza aliases
alias ls='eza --icons'
alias ll='eza -lh --icons --git --group-directories-first --smart-group'
alias la='eza -lah --icons --git --group-directories-first --smart-group'
alias tree='eza --tree --icons --level=2'

compdef eza=ls

# bat as cat
alias cat='bat'

# Core utilities
alias grep='rg --color=auto'
alias diff='diff --color=auto'
alias df='df -h'

# Navigation
alias -- -='cd -'

# ─── Git ────────────────────────────────────────────────────────────────────
alias g="git"
alias gs="git status"
alias ga="git add"
alias gaa="git add ."
alias gcm="git commit -m"
alias gp="git push"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gbd="git branch -d"
alias gl="git log --oneline --graph --decorate -20"
alias gll="git log --oneline --graph --decorate --all"

gcleanbranches() {
  git fetch -p
  git branch -vv | grep ': gone]' | awk '{print $1}' | xargs git branch -d
}

alias prs="gh dash"

# ─── Ports ──────────────────────────────────────────────────────────────────
port() {
  local process
  process=$(ss -tlnp "sport = :$1" 2>/dev/null)
  echo "$process"
}

killport() {
  local pid
  pid=$(ss -tlnp "sport = :$1" 2>/dev/null | grep -oP 'pid=\K[0-9]+')
  if [[ -z "$pid" ]]; then
    echo "Nothing listening on port $1"
    return
  fi
  echo "Killing PID $pid on port $1"
  kill -9 "$pid"
}

ports() {
  echo "── Host processes ──"
  ss -tlnp | grep -E 'node|bun|deno|java'
  echo "── Docker containers ──"
  docker ps --format "{{.Names}}\t{{.Ports}}" 2>/dev/null
}

alias devports='ss -tlnp "sport = :3000 or sport = :3001 or sport = :4200 or sport = :5173 or sport = :8080 or sport = :8443"'

killdev() {
  ss -tlnp "sport = :3000 or sport = :3001 or sport = :4200 or sport = :5173 or sport = :8080 or sport = :8443" |
    grep -oP 'pid=\K[0-9]+' | sort -u | xargs kill -9 2>/dev/null
  echo "Killed common dev ports"
}

# ─── apt ────────────────────────────────────────────────────────────────────
alias upg='sudo apt update && sudo apt upgrade -y'
alias clean='sudo apt autoremove && sudo apt autopurge && sudo apt autoclean -y'

# miscelaneous
alias rl='exec zsh'

# lazydocker
alias ld='lazydocker'

# update tools
alias opg='opencode upgrade'
alias brg='brew update && brew upgrade -y'
alias bng='bun upgrade'
alias stg='curl -sS https://starship.rs/install.sh | sh'
alias zog='curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh'
alias png='pnpm self-update'
alias fng='curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell'
alias ktg='curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin'
alias sdg='sdk selfupdate && sdk update && sdk upgrade'
alias rug='rustup update'
