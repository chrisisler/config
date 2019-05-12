#!/bin/bash

# Error if any subcommand fails.
set -e

# https://stackoverflow.com/questions/929368
connectedToInternet() {
  local GATEWAY="$(route -n get default | grep gateway)"

  if [[ -z "$GATEWAY" ]]; then
    # printf " Error"
    printf " ✕"
  else
    ping -q -t 1 -c 1 "www.google.com" &>/dev/null || printf " ✕"
    # ping -q -t 3 -c 1 "$(echo "$GATEWAY" | cut -d ':' -f 2)" >/dev/null 2>&1 || printf " ✕"
  fi
}

connectedToInternet
