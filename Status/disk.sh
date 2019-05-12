#!/usr/bin/env bash

set -eu

available() {
  local avail="$(df -kHl | grep "/$" | awk '{ print $4 }')"

  # If more than `N` gigs left, don't print anything
  local N="5"
  [[ "$(printf "$avail" | sed -e "s/[a-zA-Z]//g" | sed -e "s/\..*//g")" -gt "$N" ]] && exit 0

  printf "$avail "
}

main() {
  available
}

main
