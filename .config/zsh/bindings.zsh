# fzf widgets (depends on fzf.zsh)
bindkey '^F' _fzf_file_no_hidden

# Git modified files
_fzf_git_modified() {
  local result
  result=$(git rev-parse --is-inside-work-tree >/dev/null 2>&1 && \
           git ls-files -m | fzf --preview 'bat --color=always --style=plain {}') \
    && LBUFFER+="$result"
  zle reset-prompt
}
zle -N _fzf_git_modified
bindkey '^N' _fzf_git_modified

# Kill process
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
