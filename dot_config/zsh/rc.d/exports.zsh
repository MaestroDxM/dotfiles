# # Set path
# typeset -U path
# path=($HOME/.local/bin $HOME/bin /usr/bin $path)
# export PATH
#

#
# ENVIRONMENT VARIABLES
#
export EDITOR="nvim"
export LS_COLORS="$(vivid generate catppuccin-mocha)"
export ZSH_EVALCACHE_DIR="$HOME/.cache/evalcache"
export ZSH_EVALCACHE_DISABLE="false"
# XDG directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
# Pyenv settings
export PYENV_ROOT="$HOME/.local/share/pyenv/"
export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
export PYENV_VIRTUALENV_DISABLE_PROMPT=0
_evalcache dircolors -b $HOME/.dircolors
. $PYENV_ROOT/completions/pyenv.zsh

pyenv() {
	local command
	command="${1:-}"
	if [ "$#" -gt 0 ]; then
		shift
	fi

	case "$command" in
		activate | deactivate | rehash | shell)
			eval "$(pyenv "sh-$command" "$@")"
			;;
		*)
			command pyenv "$command" "$@"
			;;
	esac
}

# FZF
# preview file content using bat when using CTRL-T
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
# print tree structure in preview window
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"
# catppuccin colors
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
# initialize fzf
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh
