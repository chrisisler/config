#!/usr/bin/env bash

exitIfPianobarIsNotRunning() {
    # Awk quotes must be single quotes.
    local pianobarIsRunning="$(ps | awk '{ print $4 }' | grep -Eq "^pianobar$" &>/dev/null && echo "true" || echo "false")"

    if [[ "${pianobarIsRunning}" == "false" ]]; then
        exit -1
    fi
}

parsePianobarOutput() {
    local allPianobarOutput="$(cat ~/.config/pianobar/custom-out | tr "\r" "\n")"

    local currentSongInfo="$(printf "${allPianobarOutput}" | grep -E "^.*\|>" | grep -E ".* by .* on .*" | tail -1)"

    local song="$(printf "${currentSongInfo}" | sed -e "s/ by .*$//g" -e "s/\[2K\|\>  //g" | tr -d "\"")"
    local songWithoutParenthesis="$(printf "${song}" | sed -e "s/(.*)//g" -e "s/\[.*\]//g")"

    local artist="$(printf "${currentSongInfo}" | sed -e "s/ on .*$//g" -e "s/^.* by //g" | tr -d "\"")"

    local songIsLiked="$(printf "${currentSongInfo}" | grep -qE "<3" &>/dev/null && echo " ♡  " || echo "")"

    local positionInfo="$(printf "${allPianobarOutput}" | grep -E "^.*#" | tail -1 | sed -e "s/^.* -//g" -e "s/^0//g" | sed -e "s/\/0/\//g")"

    local result="${artist} - ${songWithoutParenthesis}${songIsLiked} ${positionInfo}"
    printf "${result}"
}

exitIfPianobarIsNotRunning
parsePianobarOutput
