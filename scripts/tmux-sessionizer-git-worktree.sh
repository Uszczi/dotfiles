#!/bin/bash

# TODO fix me
cd "/home/mateusz/work/reg2/dev"

selected=$(git worktree list | fzf)
# I have no idea how it works.
selected_path=($selected)

tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_path -c $selected_path
    echo $selected
    exit 0
fi

if ! tmux has-session -t=$selected_path 2> /dev/null; then
    tmux new-session -ds $selected_path -c $selected_path
fi

tmux switch-client -t $selected_name
