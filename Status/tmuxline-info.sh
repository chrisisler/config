#!/usr/bin/env bash

set -eu

main() {
  local windows="$(tmux list-windows | wc -l | tr -d ' ')W"
  local sessions="$(tmux list-sessions | wc -l | tr -d ' ')S"
  # printf "$sessions"
  printf "$windows $sessions"
}

main
