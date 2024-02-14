#█▓▒░ XDG Dirs
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_DIR="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

#█▓▒░ Golang Optioins
# Source set-env.zsh from asdf Go plugin to set GOROOT and GOPATH
source "$XDG_CACHE_HOME/asdf/plugins/golang/set-env.zsh"

#█▓▒░ ASDF home directory
export ASDF_DIR="$XDG_DATA_HOME/asdf"
export ASDF_DATA_DIR="$XDG_CACHE_HOME/asdf"
export ASDF_CONFIG_FILE="$XDG_CONFIG_HOME/asdf/asdfrc"
export ASDF_FORCE_PREPEND=yes

#█▓▒░ Set path environment
typeset -U path
path=($HOME/.local/bin
      $HOME/bin
      $HOME/.cargo/bin
      $PYENV_ROOT/bin
      $GOPATH/bin
      $HOME/.config/fzf/bin
      $path
)

export PATH


#█▓▒░ Environment Variables
export EDITOR="nvim"
export LS_COLORS="$(vivid generate catppuccin-mocha)"

#█▓▒░ NNN File Manager Options
# Keybinds to be completed with plugin leader key (';')
export NNN_PLUG='z:autojump;o:fzopen;p:fzplug;m:mocq;d:diffs;v:imgview;t:nmount'
#Catppuccin colors
BLK="03" CHR="03" DIR="04" EXE="02" REG="07" HARDLINK="05" SYMLINK="05" MISSING="08" ORPHAN="01" FIFO="06" SOCK="03" UNKNOWN="01"
# Export Context Colors
export NNN_COLORS="#04020301;4231"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$UNKNOWN"

#█▓▒░ Dotbare
export DOTBARE_DIR="$HOME/.config/dotfiles"
export DOTBARE_BACKUP="${XDG_DATA_HOME:-$HOME/.local/share}/dotbare"
export DOTBARE_PREVIEW="bat --color=always -n {}"
export DOTBARE_KEY="
  --bind=alt-a:toggle-all  
  --bind=alt-j:jump
  --bind=alt-0:top
  --bind=alt-s:toggle-sort
  --bind=alt-t:toggle-preview
"
export DOTBARE_FZF_DEFAULT_OPTS=" \
--color=bg:#1e1e2e,bg+:#262626,hl:#f38ba8,hl+:#5fd7ff \
--color=fg:#cdd6f4,fg+:#d0d0d0,header:#f38ba8,info:#cba6f7 \
--color=marker:#f5e0dc,prompt:#cba6f7,spinner:#f5e0dc,pointer:#f5e0dc \
--color=border:#262626,label:#aeaeae,query:#d9d9d9 \
--layout=reverse \
--info=inline \
--height=80% \
--multi \
--preview-window=:hidden \
--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2>/dev/null | head -200' \
--prompt='∼ ' --pointer='▶' --marker='✓' \
--bind=?:toggle-preview
"
export DOTBARE_DIFF_PAGER="delta --diff-so-fancy --line-numbers"
. "$HOME/.cargo/env"
