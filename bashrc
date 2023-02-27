[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

alias ls='ls --color=auto'
alias ..="cd .."
alias ...="cd ../.."

export PATH="~/dotfiles/path-utils:$PATH"
export PATH="~/.local/bin:$PATH"

fish
