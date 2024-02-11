# Pyenv settings
export PYENV_ROOT="$HOME/.local/share/pyenv/"
export PATH="$PYENV_ROOT/bin:$PATH"

# Golang settings
export GOROOT="$HOME/.local/share/golang"
export GOPATH="$HOME/code/go"

# Set path environment
typeset -U path
path=($HOME/.local/bin
      $HOME/bin/**/*(N/)
      $HOME/.cargo/bin
      $PYENV_ROOT/bin
      $GOPATH/bin
      $HOME/.config/fzf/bin
      $path
)

export PATH

#
# ENVIRONMENT VARIABLES
#
export EDITOR="nvim"
export LS_COLORS="$(vivid generate catppuccin-mocha)"
export ZSH_EVALCACHE_DIR="$HOME/.cache/evalcache"
export ZSH_EVALCACHE_DISABLE="false"

#
# XDG directories
# export XDG_CONFIG_HOME="$HOME/.config"
# export XDG_DATA_HOME="$HOME/.local/share"
# export XDG_CACHE_HOME="$HOME/.cache"

# Dotbare 
export DOTBARE_DIR="$HOME/.config/dotfiles"
# export DOTBARE_TREE="$HOME/.config"
export DOTBARE_BACKUP="${XDG_DATA_HOME:-$HOME/.local/share}/dotbare"
export DOTBARE_PREVIEW="bat -n {}"
export DOTBARE_KEY="
  --bind=alt-a:toggle-all  
  --bind=alt-j:jump
  --bind=alt-0:top
  --bind=alt-s:toggle-sort
  --bind=alt-t:toggle-preview
"
export DOTBARE_FZF_DEFAULT_OPTS="--preview-window=right:65%"
export DOTBARE_DIFF_PAGER="delta --diff-so-fancy --line-numbers"
. "$HOME/.cargo/env"