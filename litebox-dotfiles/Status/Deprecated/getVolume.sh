#!/usr/bin/env bash

# Error if any subcommand fails/throws.
set -e

percentageNumber="$(osascript -e "output volume of (get volume settings)")"

divided=$(( ${percentageNumber} / 16 ))
added=$(( ${divided} + 1 ))

printf "${divided}"
