#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(find ~/Documents/Projects -mindepth 1 -maxdepth 1 -type d -not -path "*_archived*" | sort -df | fzf)
fi

if [[ -z $selected ]]; then
  exit 0
fi

selected_name=$(basename "$selected" | tr . _)

if tmux has-session -t="$selected_name" 2> /dev/null; then
  if [[ -n $TMUX ]]; then
    tmux switch-client -t "$selected_name"
  else
    tmux attach-session -t "$selected_name"
  fi
else
  if [[ -z $TMUX ]]; then
    tmux new-session -s "$selected_name" -c "$selected"
  else
    tmux new-session -ds "$selected_name" -c "$selected"
    tmux switch-client -t "$selected_name"
  fi
fi
