#!/usr/bin/env bash

set -e

dockerIsRunning() {
  # pgrep -f docker &>/dev/null && printf "▣ " || printf "ロ"
  # pgrep -f docker &>/dev/null && printf "▣ "
  ps xc | grep -i docker && printf "▣ "
}

main() {
  dockerIsRunning
}

main
