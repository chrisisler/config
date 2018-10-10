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

    local songName="$(printf "${currentSongInfo}" | sed -e "s/ by .*$//g" -e "s/\[2K\|\>  //g" | tr -d "\"")"

    # Update 2017-10-08: Remove non-alphanumeric characters.
    local songNameNoParens="$(printf "${songName}" | sed -e "s/(.*)//g" -e "s/\[.*\]//g" -e "s/[^0-9A-Za-z_ ]//g")"

    local artist="$(printf "${currentSongInfo}" | sed -e "s/ on .*$//g" -e "s/^.* by //g" | tr -d "\"")"

    local songIsLiked="$(printf "${currentSongInfo}" | grep -qE "<3" &>/dev/null && echo " ♡ " || echo "")"

    local positionInfo="$(printf "${allPianobarOutput}" | grep -E "^.*#" | tail -1 | sed -e "s/^.* -//g" -e "s/^0//g" | sed -e "s/\/0/\//g")"

    # shortened
    # local positionInfo="$(printf "${allPianobarOutput}" | grep -E "^.*#" | tail -1 | sed -e "s/^.* -//g" -e "s/^0//g" | sed -e "s/\/0/\//g" | sed "s/\/.*$//g")"

    # different versions
    # local result="${artist} - ${songNameNoParens}${songIsLiked}"
    # local result="${artist} - ${songNameNoParens}${songIsLiked} ${positionInfo}"
    # local result="${artist} - ${songNameNoParens} ${positionInfo}"
    # local result="${artist} - ${songNameNoParens}"
    # local result="${artist} - ${positionInfo}"
    local result="${artist}"
    printf "${result} "
}

exitIfPianobarIsNotRunning
parsePianobarOutput
