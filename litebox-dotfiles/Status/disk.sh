#!/usr/bin/env bash

set -eu

available() {
  local avail="$(df -kHl | grep "/$" | awk '{ print $4 }')"

  [[ "$(printf "$avail" | sed -e "s/[a-zA-Z]//g")" -gt 10 ]] && exit 0

  printf "$avail "
}

main() {
  available
}

main
