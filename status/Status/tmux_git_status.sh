#!/usr/bin/env bash

function tmuxGitStatus()
{
    source "${codeDir}/Shell/Status/git_status_single.sh"

    # If current working directory is not a git repo, dont do anything.
    local isGitRepo=$(git status &>/dev/null && echo -n "true" || echo -n "false")
    if [[ "${isGitRepo}" == "false" ]]; then
        # tmux set-window-option window-status-current-format ""
        echo -n ""
    else
        # tmux set-window-option window-status-current-format "#[fg=colour14,bg=colour8]$(gitStatus)" >/dev/null
        # tmux set-window-option -a status-left "#[fg=colour14,bg=colour8]$(gitStatus)" >/dev/null # not working!!
        echo -n ""
    fi
}

