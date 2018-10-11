#!/usr/bin/env bash

set -e

available() {
  local avail="$(df -kHl | tail -1 | awk '{ print $4 }')"
  printf " ${avail}"
}

main() {
  available
}

main
