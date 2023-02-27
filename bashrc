[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

alias ls='ls --color=auto'
alias ..="cd .."
alias ...="cd ../.."

export PATH="~/dotfiles/path-utils:$PATH"
export PATH="~/.local/bin:$PATH"

# Bug with google chrome and todoist.
# Without that left down corner is covered by a part of app logo
export DESKTOPINTEGRATION=false

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

fish

