#!/bin/bash

rm -f "/tmp/sesionizer"

echo "/home/mateusz/" >> /tmp/sesionizer
echo "/home/mateusz/work/reg/regspiders/" >> /tmp/sesionizer
echo "/home/mateusz/Downloads" >> /tmp/sesionizer
echo "/home/mateusz/work/reg" >> /tmp/sesionizer
echo "/home/mateusz/work/reg2" >> /tmp/sesionizer
echo "/home/mateusz/work/tails/" >> /tmp/sesionizer
echo "/home/mateusz/work/tails/vet/" >> /tmp/sesionizer
echo "/home/mateusz/work/tails/vet/web/frontend/v2/customers/" >> /tmp/sesionizer
echo "/home/mateusz/work/tails/vet/web/frontend/vets/" >> /tmp/sesionizer
echo "/home/mateusz/work/tails/vet/web/frontend/customers/" >> /tmp/sesionizer
echo "/home/mateusz/work/tails/vet/web/frontend/admin/" >> /tmp/sesionizer
echo "/home/mateusz/dotfiles/" >> /tmp/sesionizer
echo "/home/mateusz/dotfiles/nvim" >> /tmp/sesionizer
fdfind . ~/projects --type directory --max-depth 2 >> /tmp/sesionizer
fdfind . ~/src --type directory --max-depth 2 >> /tmp/sesionizer

selected=$(cat /tmp/sesionizer | fzf)

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

tmux switch-client -t $selected_name
