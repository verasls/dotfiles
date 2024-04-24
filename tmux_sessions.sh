#!/usr/bin/env bash

readarray -t project_dir <<< "$(find ~/Documents/Projects -mindepth 1 -maxdepth 1 -type d)"
project_dir+=("~/.dotfiles")
IFS=$'\n' dirs=($(sort -df <<< "${project_dir[*]}"))

if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(printf "%s\n" "${dirs[@]}" | fzf)
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
