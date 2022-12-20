#!/bin/bash

rm -f "/tmp/sesionizer"

echo "/home/mateusz/" >> /tmp/sesionizer
echo "/home/mateusz/work/reg/regspiders/" >> /tmp/sesionizer
echo "/home/mateusz/Downloads" >> /tmp/sesionizer
echo "/home/mateusz/work/reg" >> /tmp/sesionizer
echo "/home/mateusz/work/reg2" >> /tmp/sesionizer
echo "/home/mateusz/dotfiles/" >> /tmp/sesionizer
echo "/home/mateusz/dotfiles/nvim" >> /tmp/sesionizer
echo "/home/mateusz/dotfiles/dotfiles-private" >> /tmp/sesionizer
fdfind . ~/projects --type directory --max-depth 2 >> /tmp/sesionizer
fdfind . ~/src --type directory --max-depth 2 >> /tmp/sesionizer

selected=$(cat /tmp/sesionizer | fzf --preview 'exa -la {}')

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    echo $selected
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
