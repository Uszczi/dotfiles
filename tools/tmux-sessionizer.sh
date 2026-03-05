#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

RAW_DIRECTORIES=(
    "$HOME/"
    "$HOME/dotfiles/"
    "$HOME/projects/"
    "$HOME/dotfiles/nvim"
    "$HOME/dotfiles/dotfiles-private"
    "$HOME/tmp"
    "$HOME/Downloads"
    "$HOME/.local/share/nvim/lazy/"
)

SEARCH_DIRECTORIES=(
    "$HOME/.local/share/nvim/lazy"
    "$HOME/p"
    "$HOME/src"
    "$HOME/my-github"
    "$HOME/studia"
    "$HOME/work"
    "$HOME/tmp"
)

search_directory() {
    if [[ -d "$1" ]]; then
        fd . "$1" --type directory --max-depth 2 >>/tmp/sesionizer
    else
        echo "Folder is missing $1"
    fi
}

rm -f "/tmp/sesionizer"

for directory in "${RAW_DIRECTORIES[@]}"; do
    echo "$directory" >>/tmp/sesionizer
done

for directory in "${SEARCH_DIRECTORIES[@]}"; do
    search_directory $directory
done

selected=$(cat /tmp/sesionizer | fzf --preview 'exa -la {}')

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $selected ]]; then
    exit 0
fi

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2>/dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi

tmux switch-client -t $selected_name
