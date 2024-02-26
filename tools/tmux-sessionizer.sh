#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

rm -f "/tmp/sesionizer"

echo "$HOME/" >>/tmp/sesionizer
echo "$HOME/dotfiles/" >>/tmp/sesionizer
echo "$HOME/projects/" >>/tmp/sesionizer
echo "$HOME/dotfiles/nvim" >>/tmp/sesionizer
echo "$HOME/dotfiles/dotfiles-private" >>/tmp/sesionizer

echo "$HOME/Downloads" >>/tmp/sesionizer

echo "$HOME/.local/share/nvim/lazy/" >>/tmp/sesionizer


fdfind . ~/.local/share/nvim/lazy --type directory --max-depth 1 >>/tmp/sesionizer
fdfind . ~/p --type directory --max-depth 2 >>/tmp/sesionizer
fdfind . ~/src --type directory --max-depth 2 >>/tmp/sesionizer
fdfind . ~/studia --type directory --max-depth 2 >>/tmp/sesionizer
fdfind . ~/work --type directory --max-depth 1 >>/tmp/sesionizer

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
