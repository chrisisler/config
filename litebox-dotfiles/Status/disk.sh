#!/usr/bin/env bash

set -e

available() {
  local avail="$(df -kHl | grep "/$" | awk '{ print $4 }')"
  printf "${avail} "
  # printf " ${avail}"
}

main() {
  available
}

main
