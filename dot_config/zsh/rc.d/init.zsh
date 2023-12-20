# General init file

setopt autocd
setopt extendedglob
setopt NO_NOMATCH
setopt CORRECT

setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match

# Print a carriage return just before printing a prompt in the line editor
# and try to preserve a partial line.
setopt promptcr promptsp

# disable keyboard beep
unsetopt BEEP

# export ZSH_CONFIG="$HOME/.config/zsh"
# fpath=($ZDOTDIR/completions $ZDOTDIR/functions $fpath)

# # Set path
# typeset -U path
# path=($HOME/.local/bin $HOME/bin /usr/bin $path)
# export PATH
#

# autoload -Uz compinit

# navigate completion
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

autoload edit-command-line
zle -N edit-command-line
