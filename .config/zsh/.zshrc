# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#!/usr/bin/env zsh
#----------------------------------------------
#-- https://github.com/mattmc3/zsh_unplugged
#----------------------------------------------

# Clone a repo, identify and source its init file, then add it to the fpath

function plugin-load
{
  local repo plugdir initfile initfiles=()
  : ${ZPLUGINDIR:=${ZDOTDIR:-~/.config/zsh}/plugins}
  for repo in $@; do
    plugdir=$ZPLUGINDIR/${repo:t}
    initfile=$plugdir/${repo:t}.plugin.zsh
    if [[ ! -d $plugdir ]]; then
      echo "Cloning $repo..."
      git clone -q --depth 1 --recursive --shallow-submodules \
        https://github.com/$repo $plugdir
    fi
    if [[ ! -e $initfile ]]; then
      initfiles=($plugdir/*.{plugin.zsh,zsh-theme,zsh,sh}(N))
      (( $#initfiles )) || { echo >&2 "No init file found '$repo'." && continue }
      ln -sf $initfiles[1] $initfile
    fi
    fpath+=$plugdir
    (( $+functions[zsh-defer] )) && zsh-defer . $initfile || . $initfile
  done
}

# source $ZDOTDIR/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

plugins=(
  romkatv/powerlevel10k
  mroth/evalcache
  aloxaf/fzf-tab
  wfxr/forgit

  # plugins that add completions must be loaded prior to this line
  mattmc3/zshrc.d
  kazhala/dotbare
  mattmc3/zfunctions

  # defered plugins for faster loading
  romkatv/zsh-defer
  zdharma-continuum/fast-syntax-highlighting
  zsh-users/zsh-autosuggestions
)

plugin-load $plugins

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
eval "$(zoxide init zsh)"
eval "$(fnm env --use-on-cd)"
eval "$(pyenv init -)"
eval "$(direnv hook zsh)"
_dotbare_completion_cmd
_dotbare_completion_git
(( ! ${+functions[p10k]} )) || p10k finalize
