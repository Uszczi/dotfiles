[[ $- != *i* ]] && return

alias ..="cd .."
alias ...="cd ../.."
alias sd='cd ~ && cd $(find * -type d | fzf)'

alias gs="git status"
alias gc="git commit"

alias ls="eza"
alias la="eza -la"
alias ll="eza -la"

alias dc="docker compose"
alias fd="fdfind"

alias nvim-big="nvim -u $HOME/dotfiles/nvim/large-file.vim"

export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$HOME/.dotnet/tools:$PATH"
export PATH="$HOME/dotfiles/tools:$PATH"
export PATH="$HOME/dotfiles/dotfiles-private/tools:$PATH"

fish
