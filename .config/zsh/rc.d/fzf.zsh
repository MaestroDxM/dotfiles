# 
# allow hidden files in completions
setopt globdots

#
# set fzf completion trigger
export FZF_COMPLETION_TRIGGER=",,"

#
# use ripgrep for path completion
_fzf_compgen_path() {
     rg --files --glob "!.git" . "$1"
}
# fd for directory completion
_fzf_compgen_dir() {
     fd --type d --hidden --follow --exclude ".git" . "$1"
}

#####
#fzf default options
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--layout=reverse \
--info=inline \
--height=80% \
--multi \
--preview-window=:hidden \
--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2>/dev/null | head -200' \
--prompt='∼ ' --pointer='▶' --marker='✓' \
--bind=?:toggle-preview
"

#
# ensure these commands are only completed with directories
export FZF_COMPLETION_DIR_COMMANDS="cd pushd rmdir tree"

#
# options for fzf <CTRL>t keybind
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

#
# print tree structure in preview window when using <Alt>c to cd
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"

# use ripgrep with fzf
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"

# start fzf
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh ] \
     && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh

#
# fzf-tab options
zstyle ':fzf-tab:complete:*' fzf-preview 'bat $realpath'
zstyle ':fzf-tab:complete:*' fzf-flags --preview-window hidden:wrap
