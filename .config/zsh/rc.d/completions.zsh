#
# Options
#

# setopt complete_in_word     # Complete from both ends of a word.
setopt always_to_end        # Move cursor to the end of a completed word.
setopt auto_menu            # Show completion menu on a successive tab press.
setopt auto_list            # Automatically list choices on ambiguous completion.
setopt auto_param_slash     # If completed parameter is a directory, add a trailing slash.
setopt extended_glob        # Needed for file modification glob modifiers with compinit.
setopt NO_menu_complete     # Do not autoselect the first completion entry.
setopt NO_flow_control      # Disable start/stop characters in shell editor.

#
# Set fpath
#

fpath=(
    # Zsh completions
    /usr/local/share/zsh/site-functions(-/FN)

    # Custom completions
    ${ZDOTDIR:-${XDG_CONFIG_HOME:-$HOME/.config}/zsh}/completions(-/FN)

    # rest of fpath
    $fpath
  )

function run-compinit {

  emulate -L zsh
  setopt localoptions extendedglob

  local force=0
  if [[ "$1" == "-f" ]]; then
    force=1
    shift
  fi

  local zcompdump=${1:-${ZSH_COMPDUMP:-${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump}}
  [[ -d "$zcompdump:h" ]] || mkdir -p "$zcompdump:h"
  autoload -Uz compinit

  # if compdump is less than 20 hours old,
  # consider it fresh and shortcut it with `compinit -C`
  #
  # Glob magic explained:
  #   #q expands globs in conditional expressions
  #   N - sets null_glob option (no error on 0 results)
  #   mh-20 - modified less than 20 hours ago
  if [[ $force -ne 1 ]] && [[ $zcompdump(#qNmh-20) ]]; then
    # -C (skip function check) implies -i (skip security check).
    compinit -C -d "$zcompdump"
  else
    compinit -i -d "$zcompdump"
    touch "$zcompdump"
  fi

  # Compile zcompdump, if modified, in background to increase startup speed.
  {
    if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
      if command mkdir "${zcompdump}.zwc.lock" 2>/dev/null; then
        zcompile "$zcompdump"
        command rmdir  "${zcompdump}.zwc.lock" 2>/dev/null
      fi
    fi
  } &!
}

run-compinit

#
# completion zstyles
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
