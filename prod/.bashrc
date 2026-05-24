# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.local/share/omarchy/default/bash/rc

run-help() {
    local cmd="${READLINE_LINE%% *}"
    if [[ -n "$cmd" ]]; then
        man "$cmd"
    fi
}

export PATH="$HOME/dotfiles/tools:$PATH"
export PATH="$HOME/.local/bin:$PATH"

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias ..="cd .."
alias ...="cd ../.."
alias cdf='cd $(find . -type d | fzf)'

alias gs="git status"
alias gc="git commit"

alias vv=". .venv/bin/activate"

bind -x '"\C-f": tmux-sessionizer'
