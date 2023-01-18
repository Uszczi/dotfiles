#!/bin/bash

rm -f "/tmp/sesionizer"

echo "$HOME/" >> /tmp/sesionizer
echo "$HOME/dotfiles/" >> /tmp/sesionizer
echo "$HOME/dotfiles/nvim" >> /tmp/sesionizer
echo "$HOME/dotfiles/dotfiles-private" >> /tmp/sesionizer

fdfind . ~/projects --type directory --max-depth 2 >> /tmp/sesionizer
fdfind . ~/src --type directory --max-depth 2 >> /tmp/sesionizer

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

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi


if [[ -z $TMUX ]]; then
    tmux attach -t $selected_name
    exit 0
fi

tmux switch-client -t $selected_name
