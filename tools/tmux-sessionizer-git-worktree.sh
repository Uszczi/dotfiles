#!/bin/bash

cd "$HOME/work/dev"

selected=$(git worktree list | fzf --preview "git worktree list | fzf --preview 'echo {} | awk \'{print $1}\' | xargs git -C {1} log HEAD~30..HEAD --graph --decorate --oneline")
# I have no idea how it works.
selected=($selected)
if [[ -z $selected ]]; then
  exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
  tmux new-session -s $selected_name -c $selected
  exit 0
fi

if ! tmux has-session -t=$selected_name 2>/dev/null; then
  tmux new-session -ds $selected_name -c $selected
fi

if [[ -z $TMUX ]]; then
  tmux attach -t $selected_name
  exit 0
fi

tmux switch-client -t $selected_name
