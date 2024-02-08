# Eza ls aliases
alias ls='eza --icons=always'
alias la='eza --icons=always --all'
alias ll='eza --icons=always --long'
alias lla='eza --icons=always --long --all'

# Git aliases
alias gst="git status"
# Global aliases
alias -g L='| less'

# Dotbare aliases
alias dots="dotbare"
alias fadd="dotbare fadd"
alias fedit="dotbare fedit"
alias fstat="dotbare fstat"

# Chezmoi aliases
alias ch="chezmoi"
alias chcd="chezmoi cd"
alias chap="chezmoi apply"
alias chdf="chezmoi diff"
alias ched="chezmoi edit"
alias chad="chezmoi add"
alias chignore="nvim ~/.local/share/chezmoi/.chezmoiignore"

# File editing aliases
alias edal="nvim ~/.config/zsh/rc.d/aliases.zsh"
alias zedit="nvim ~/.config/zsh/.zshrc"
alias edex="nvim ~/.config/zsh/rc.d/exports.zsh"
