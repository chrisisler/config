#!/bin/bash

# Error if any subcommand fails.
set -e

# https://stackoverflow.com/questions/929368
connectedToInternet() {
  local GATEWAY="$(route -n get default | grep gateway)"

  if [ -z "$GATEWAY" ]; then
    echo error
  else
    ping -q -t 1 -c 2 `echo $GATEWAY | cut -d ':' -f 2` &>/dev/null || echo " ✕"
  fi
}

connectedToInternet
