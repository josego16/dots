# =========================================================
# fzf widgets
# =========================================================

bindkey '^F' _fzf_file_no_hidden

# =========================================================
# Git
# =========================================================

# Ctrl+N: select modified file, add to buffer
_fzf_git_modified() {
  local result
  result=$(git rev-parse --is-inside-work-tree >/dev/null 2>&1 && \
           git ls-files -m | fzf --preview 'bat --color=always --style=plain {}') \
    && LBUFFER+="$result"
  zle reset-prompt
}
zle -N _fzf_git_modified
bindkey '^N' _fzf_git_modified

# =========================================================
# Cursor navigation
# =========================================================

# Ctrl+Left: move backward one word
bindkey '^[[1;5D' backward-word

# Ctrl+Right: move forward one word
bindkey '^[[1;5C' forward-word

# =========================================================
# Process management
# =========================================================

# Alt+P: select process to kill
_fzf_kill_process() {
  local pid
  pid=$(ps -u "$USER" -o pid,comm -w --no-headers \
        | fzf --header='Select process to kill' \
              --preview 'ps --pid={1} -o pid,cmd --no-headers -w' \
        | awk '{print $1}')
  [[ -n "$pid" ]] && LBUFFER+="kill $pid "
  zle reset-prompt
}
zle -N _fzf_kill_process
bindkey '^[p' _fzf_kill_process
