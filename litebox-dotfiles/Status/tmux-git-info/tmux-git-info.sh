#!/bin/bash

# Import functions defined in this script file.
# source ~/Code/Status/git.sh

# Error if any subcommand fails.
set -e

addedChanges() {
  local status="$1"
  local addedChanges=""

  if [[ ! "$status" == "" ]]; then
    # Notice the whitespace difference in the grep.
    local added=$(printf "$status" | grep -E '^A(A| )' | wc -l | tr -d ' ') # +N
    local deleted=$(printf "$status" | grep -E '^D(D| )' | wc -l | tr -d ' ') # -N

    local modified=$(printf "$status" | grep -E '^M(M| )' | wc -l | tr -d ' ') # ~N
    local renamed=$(printf "$status" | grep -E '^R(R| )' | wc -l | tr -d ' ')
    local copied=$(printf "$status" | grep -E '^C(C| )' | wc -l | tr -d ' ')
    modified=$(( ${modified} + ${renamed} + ${copied} ))

    if [[ "$modified" -ne 0 || "$deleted" -ne 0 || "$added" -ne 0 ]]; then
      # addedChanges+=" +$added ~$modified -$deleted ~"
      addedChanges+=" +$added ~$modified -$deleted"
    fi
  fi

  printf "$addedChanges"
}

unaddedChanges() {
  local status="$1"
  local unaddedChanges=""

  local added=$(printf "$status" | grep -E '^\?\? ' | wc -l | tr -d ' ') # +N
  local modified=$(printf "$status" | grep -E '^( |M)M' | wc -l | tr -d ' ') # ~N
  local deleted=$(printf "$status" | grep -E '^( |D)D' | wc -l | tr -d ' ') # -N

  if [[ "$modified" -ne 0 || "$deleted" -ne 0 || "$added" -ne 0 ]]; then
    # unaddedChanges+=" +$added ~$modified -$deleted !"
    unaddedChanges+=" +$added ~$modified -$deleted"
  fi

  printf "$unaddedChanges"
}

branchName() {
  # local branchName="$(git branch | grep "*" | awk '{ print $2 }')"
  local branchName="$(git name-rev --name-only HEAD)"

  printf "$branchName"
}

main() {
  # Execute all further (sub)commands in the directory of the currently active terminal.
  cd "$(tmux display-message -p "#{pane_current_path}")"

  local branchName="$(branchName)"

  # If not in a git repo then dip.
  if [[ "$branchName" == "" ]]; then
    exit 0
  fi

  local porcelainStatus="$(git status --porcelain)"
  local changes="$(addedChanges "$porcelainStatus")$(unaddedChanges "$porcelainStatus")"

  local gitInfo="[$branchName$changes]"

  printf "$gitInfo"
}

main
