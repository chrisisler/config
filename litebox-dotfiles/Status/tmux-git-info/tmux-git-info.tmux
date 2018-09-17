#!/bin/bash

# This script replaces the "#{tmux-git-info}" line in `~/.tmux/tmuxline.conf`
# with the output of `tmux-git-info.sh`.

# Error if any subcommand fails.
set -e

thisAbsoluteDirectoryPath="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Import script and immediately invoke it. Must be tilde-expanded absolute path.
source "$thisAbsoluteDirectoryPath/tmux-git-info.sh"

unexpandTilde() {
  printf "${1/"$HOME"/~}"
}

main() {
  # Get current value of left side of tmux status line.
  # `-g` => global tmux settings
  # `-q` => suppress errors
  # `-v` => show only the value (exclude the name of the setting from output)
  local statusLeft="$(tmux show-option -gqv status-left)"

  # Overwrite variable name.
  local thisAbsoluteDirectoryPath="$(unexpandTilde "$thisAbsoluteDirectoryPath")"

  # Tell tmux to execute the shell script and capture its output.
  local gitInfo="#("$thisAbsoluteDirectoryPath"/tmux-git-info.sh)"

  # Backslash needed for string replacement.
  local toReplace="\#{tmux-git-info}"

  # Replace path to this file with the output of the git info script.
  local statusLeftWithGitInfo="${statusLeft/$toReplace/$gitInfo}"

  tmux set-option -gq status-left "$statusLeftWithGitInfo"
}

main
