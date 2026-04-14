[[ $- != *i* ]] && return

alias sd='cd ~ && cd $(find * -type d | fzf)'

alias gs="git status"
alias gc="git commit"

alias ls="eza"
alias la="eza -la"
alias ll="eza -la"

alias dc="docker compose"

alias nvim-big="nvim -u $HOME/dotfiles/nvim/large-file.vim"

export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$HOME/.dotnet/tools:$PATH"
export PATH="$HOME/dotfiles/tools:$PATH"
export PATH="$HOME/dotfiles/dotfiles-private/tools:$PATH"
export PATH="$HOME/.local/share/nvim/mason/bin/:$PATH"

##########################################

run-help() {
    local cmd="${READLINE_LINE%% *}"
    if [[ -n "$cmd" ]]; then
        man "$cmd"
    fi
}

export PATH="/home/mat/dotfiles/tools:$PATH"

alias ..="cd .."
alias ...="cd ../.."

alias vi='nvim'

bind -x '"\eh": run-help'
bind -x '"\C-f": tmux-sessionizer'

##########################################
