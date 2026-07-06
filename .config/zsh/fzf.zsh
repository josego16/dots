# fzf config (standard bindings loaded in .zshrc)

# fd as the default fzf backend
export FZF_DEFAULT_COMMAND='fd --type f --hidden --strip-cwd-prefix'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# kanagawa_wave theme (matches alacritty/zellij/lazygit)
export FZF_DEFAULT_OPTS='
--style full
--border --padding 1,2
--color=fg:#DCD7BA,bg:#1F1F28,hl:#76946A,fg+:#DCD7BA,bg+:#2A2A37
--color=hl+:#98BB6C,info:#7AA89F,prompt:#7E9CD8,pointer:#C0A36E
--color=marker:#C0A36E,spinner:#C0A36E,header:#76946A,border:#2A2A37
--color=gutter:#2A2A37
'

# Previews
export _FZF_PREVIEW_CMD='bat --color=always --style=plain,numbers --line-range=:500 {}'
export FZF_CTRL_T_OPTS="--preview '$_FZF_PREVIEW_CMD'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -50'"

# Contextual previews for **<TAB> completion
_fzf_comprun() {
  local command=$1
  shift
  case "$command" in
    cd)                fzf --preview 'eza --tree --color=always {} | head -50' "$@" ;;
    vim|nvim|nano|zed) fzf --preview 'bat --color=always --style=plain {}' "$@" ;;
    *)                 fzf --preview 'bat --color=always --style=plain {}' "$@" ;;
  esac
}

# Ctrl+F: files excluding hidden files
_fzf_file_no_hidden() {
  local cmd result
  cmd="${FZF_DEFAULT_COMMAND/--hidden /}"
  result=$(eval "${cmd:-find . -type f}" | fzf --preview "$_FZF_PREVIEW_CMD") \
    && LBUFFER+="$result"
  zle reset-prompt
}
zle -N _fzf_file_no_hidden
