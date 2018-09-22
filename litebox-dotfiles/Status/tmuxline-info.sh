#!/usr/bin/env bash

# Error if any subcommand fails/throws.
set -e

main() {
  local windows="$(tmux list-windows | wc -l | tr -d ' ')W"
  local sessions=" $(tmux list-sessions | wc -l | tr -d ' ')S"

  if [[ "${windows}" == "1W" ]]; then
    windows=""
  fi

  if [[ "${sessions}" == " 1S" ]]; then
    sessions=""
  fi

  printf "${windows}${sessions}"
}

main
