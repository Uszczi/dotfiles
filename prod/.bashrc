# If not running interactively, don't do anything
[[ $- != *i* ]] && return

run-help() {
    local cmd="${READLINE_LINE%% *}"
    if [[ -n "$cmd" ]]; then
        man "$cmd"
    fi
}

export PATH="$HOME/dotfiles/tools:$PATH"
export PATH="$HOME/.local/bin:$PATH"

alias ..="cd .."
alias ...="cd ../.."
alias cdf='cd $(find . -type d | fzf)'

alias vv=". .venv/bin/activate"

bind -x '"\C-f": tmux-sessionizer'
