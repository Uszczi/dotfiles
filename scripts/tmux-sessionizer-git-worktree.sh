#!/bin/bash

# TODO fix me
cd "/home/mateusz/work/reg2/dev"

selected=$(git worktree list | fzf)
# I have no idea how it works.
selected=($selected)

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

echo $selected
echo $selected_name

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    echo $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi

tmux switch-client -t $selected_name
