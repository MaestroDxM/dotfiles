export HISTFILE="$XDG_CACHE_HOME/zsh/zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000

setopt HIST_IGNORE_ALL_DUPS # do not populate history with duplicates
setopt HIST_SAVE_NO_DUPS # do not save duplicate command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY  # record command start time
setopt SHARE_HISTORY # share history data
