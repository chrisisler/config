#!/usr/bin/env bash

exitIfPianobarIsNotRunning()
{
    # Awk quotes must be single quotes.
    local pianobarIsRunning="$(ps | awk '{ print $4 }' | grep -Eq "^pianobar$" &>/dev/null && echo "true" || echo "false")"

    if [[ "${pianobarIsRunning}" == "false" ]]; then
        exit -1
    fi
}

exitIfPianobarIsNotRunning


parsePianobarOutput()
{
    local allPianobarOutput="$(cat ~/.config/pianobar/custom-out | tr "\r" "\n")"

    local currentSongInfo="$(echo -n"${allPianobarOutput}" | grep -E "^.*\|>" | grep -E ".* by .* on .*" | tail -1)"

    local song="$(echo -n "${currentSongInfo}" | sed -e "s/ by .*$//g" -e "s/\[2K\|\>  //g" | tr -d "\"")"
    local songWithoutParenthesis="$(echo -n "${song}" | sed -e "s/(.*)//g" -e "s/\[.*\]//g")"

    local artist="$(echo -n "${currentSongInfo}" | sed -e "s/ on .*$//g" -e "s/^.* by //g" | tr -d "\"")"

    local songIsLiked="$(echo -n "${currentSongInfo}" | grep -qE "<3" &>/dev/null && echo " ♡" || echo "")"

    local positionInfo="$(echo -n "${allPianobarOutput}" | grep -E "^.*#" | tail -1 | sed -e "s/^.* -//g" -e "s/^0//g" | sed -e "s/\/0/\//g")"

    echo "${artist} - ${songWithoutParenthesis}${songIsLiked}"
}

parsePianobarOutput

