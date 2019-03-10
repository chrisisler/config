#!/usr/bin/env bash

# Error if any subcommand fails.
set -e

getPandoraInfo() {
  local state="$(cat ~/.config/pianobar/custom-out | tr "\r" "\n")"
  local playing="$(printf "$state" | grep -E "\[Playing\] .* - .*" | tail -1)"

  local artist="$(printf "$playing" | sed -e "s/^.* - //")"
  local song="$(printf "$playing" | sed -e "s/ - .*$//" -e "s/^.*\[Playing\]//")"
  # local songNoParens="$(printf "$song" | sed -e "s/(.*)//" -e "s/\[.*\]//" -e "s/[^0-9A-Za-z_ ]//")"

  local position="$(printf "$state" | grep "[Time]" | tail -1 | sed -e "s/^.* -//" -e "s/^0//" -e "s/\/0/\//")"

  local output="$song - $artist [$position]"
  # local output="$artist"

  printf "$output "
}

main() {
  # Exit if Pianobar isn't running.
  ps xc | grep -qi "pianobar" || exit -1

  getPandoraInfo
}

main
