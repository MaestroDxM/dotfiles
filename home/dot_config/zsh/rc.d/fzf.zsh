# fzf catppuccin colors
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
# fzf-tab options
zstyle ':fzf-tab:complete:*' fzf-preview 'bat $realpath'
zstyle ':fzf-tab:complete:*' fzf-flags --preview-window hidden:wrap

# start fzf
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh ] \
     && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh

