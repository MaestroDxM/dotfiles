#█▓▒░ Pyenv Settings
export PYENV_ROOT="$HOME/.local/share/pyenv/"

#█▓▒░ Golang Optioins

# export GOROOT="$HOME/.cache/asdf/plugins/golang/set-env.zsh"
# export GOPATH="$HOME/code/go"
#█▓▒░ Source set-env.zsh from asdf Go plugin to set GOROOT and GOPATH
source "$XDG_CACHE_HOME/asdf/plugins/golang/set-env.zsh"


#█▓▒░ ASDF home directory
export ASDF_DIR="$XDG_DATA_HOME/asdf"
export ASDF_DATA_DIR="$XDG_CACHE_HOME/asdf"
export ASDF_CONFIG_FILE="$XDG_CONFIG_HOME/asdf/asdfrc"

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
export ZSH_EVALCACHE_DIR="$HOME/.cache/evalcache"
export ZSH_EVALCACHE_DISABLE="false"

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
# export DOTBARE_FZF_DEFAULT_OPTS="--preview-window=right:65%"

export DOTBARE_FZF_DEFAULT_OPTS=" \
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
export DOTBARE_DIFF_PAGER="delta --diff-so-fancy --line-numbers"
. "$HOME/.cargo/env"
