#!/usr/bin/env bash
# Claude Code status line — Spaceship-inspired
# Receives JSON on stdin

input=$(cat)

user=$(whoami)
host=$(hostname -s)
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // ""')
model=$(echo "$input" | jq -r '.model.display_name // ""')
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

# Shorten home directory to ~
home="$HOME"
short_cwd="${cwd/#$home/\~}"

# Git branch (skip optional locks for safety)
git_branch=""
if git -C "$cwd" rev-parse --git-dir > /dev/null 2>&1; then
  git_branch=$(git -C "$cwd" symbolic-ref --short HEAD 2>/dev/null || git -C "$cwd" rev-parse --short HEAD 2>/dev/null)
fi

# Context usage indicator
ctx_part=""
if [ -n "$used" ]; then
  used_int=${used%.*}
  ctx_part=" | ctx: ${used_int}%"
fi

# Git part
git_part=""
if [ -n "$git_branch" ]; then
  git_part=" | $git_branch"
fi

printf "\033[0;36m%s\033[0m@\033[0;32m%s\033[0m \033[0;33m%s\033[0m\033[0;35m%s\033[0m\033[0;34m%s\033[0m | %s" \
  "$user" "$host" "$short_cwd" "$git_part" "$ctx_part" "$model"
