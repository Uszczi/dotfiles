[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

alias ls='ls --color=auto'
alias ..="cd .."
alias ...="cd ../.."

alias 'docker-compose'="docker compose"

export PATH="~/dotfiles/path-utils:$PATH"
export PATH="~/.local/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin

# Bug with google chrome and todoist.
# Without that left down corner is covered by a part of app logo
export DESKTOPINTEGRATION=false

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# fnm
export PATH="$HOME/.local/share/fnm:$PATH"
eval "`fnm env`"

# Cargo
. "$HOME/.cargo/env"

# SSH
ssh-agent > /dev/null

fish
