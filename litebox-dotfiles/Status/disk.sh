#!/usr/bin/env bash

set -e

available() {
  local avail="$(df -kHl | grep disk1 | awk '{ print $4 }')"
  printf "${avail} "
  # printf " ${avail}"
}

main() {
  available
}

main
