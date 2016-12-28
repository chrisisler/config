#!/usr/bin/env bash

function tmuxGitStatus()
{
    source "${codeDir}/Shell/Status/git_status.sh"

    # If current working directory is not a git repo, dont do anything.
    local isGitRepo=$(git status &>/dev/null && echo -n "true" || echo -n "false")
    if [[ "${isGitRepo}" == "false" ]]; then
        tmux set-window-option window-status-current-format ""
    else
        tmux set-window-option window-status-current-format "#[fg=colour14,bg=colour8]$(gitBracketL)$(gitBranch)$(gitBranchAheadOrBehindOfMaster)$(gitAddedChanges)$(gitUnaddedChanges)$(gitBracketR)" >/dev/null
    fi

}

