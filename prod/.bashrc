# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

run-help() {
    local cmd="${READLINE_LINE%% *}"
    if [[ -n "$cmd" ]]; then
        man "$cmd"
    fi
}

export PATH="$HOME/dotfiles/tools:$PATH"

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias ..="cd .."
alias ...="cd ../.."

alias gs="git status"
alias gc="git commit"

alias vv=". .venv/bin/activate"

alias vi='nvim'

bind -x '"\eh": run-help'
bind -x '"\C-f": tmux-sessionizer'
