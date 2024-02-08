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

# binding to allow editing command lines in $EDITOR
# autoload edit-command-line
# zle -N edit-command-line
# bindkey -M vicmd '!' edit-command-line

# Bind `dotbare fedit` to <C-g>
bindkey -s '^g' "dotbare fedit"^j
