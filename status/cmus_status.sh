#!/bin/bash

# This script parses and reconstructs data from cmus, if it's running.

# Idea: Use `duration` and `position` to calculate percentage of current song position.
# Symbols: ♫▷▶□■‖》《♪

musicSymbol="♫"
musicPlayingSymbol1="▶"
musicPlayingSymbol2="▷"
musicStoppedSymbol1="■"
musicStoppedSymbol2="□"

getSongFormatFromSeconds()
{
    local input="$1"
    local minutes=$(( ${input} / 60 ))
    local seconds=$(( ${input} % 60 ))
    # <#varName> gets length of <varName>.
    if [[ "${#seconds}" == 1 ]]; then seconds="0${seconds}"; fi
    local output="${minutes}:${seconds}"
    echo "${output}"
}

getDataFromCmus()
{
    local _cmusData="$1"
    local dataToGet="$2"
    local data="$(echo -n "${_cmusData}" | grep -wE "^${dataToGet}" | sed -e "s/${dataToGet} //g")"
    echo "${data}"
}

musicInfoDisplay=""

cmusIsRunning="$(tasklist | grep -qi cmus && echo "true" || echo "false")"

if [[ "${cmusIsRunning}" == "true" ]]; then

    cmusData=$(cmus-remote -Q)
    cmusIsPlaying="$(echo -n "${cmusData}" | grep -wE "^status playing" && echo "true" || echo "")"
    if [[ ! -z "${cmusIsPlaying}" ]]; then
        musicInfoDisplay+="${musicPlayingSymbol1}"
    else
        musicInfoDisplay+="${musicStoppedSymbol1}"
        nothingQueued="$(echo -n "${cmusData}" | wc -l)"
        if [[ "${nothingQueued}" == "13" ]]; then
            # If not playing anything, dont echo anything.
            echo "${musicStoppedSymbol2}"
            # exit -1
        fi
    fi

    artistName="$(getDataFromCmus "${cmusData}" "tag artist")"
    albumName="$(getDataFromCmus "${cmusData}" "tag album")"
    songTitle="$(getDataFromCmus "${cmusData}" "tag title")"
    musicInfoDisplay+=" ${artistName} - ${songTitle}"

    songDuration="$(getDataFromCmus "${cmusData}" "duration")"
    songPosition="$(getDataFromCmus "${cmusData}" "position")"
    songDurationFormatted="$(getSongFormatFromSeconds "${songDuration}")"
    songPositionFormatted="$(getSongFormatFromSeconds "${songPosition}")"
    musicInfoDisplay+=" [${songPositionFormatted}/${songDurationFormatted}] "

    # I keep vol_left and vol_right equal. So picking one of them gives volume int out of 100.
    volume="$(echo -n "${cmusData}" | grep -wE "^set vol_left" | sed -e "s/set vol_left //g")"
    # musicInfoDisplay+=" ${volume}%"

    isShuffle="$(getDataFromCmus "${cmusData}" "set shuffle")"
    if [[ "${isShuffle}" == "true" ]]; then musicInfoDisplay+="S "; fi

    isRepeat="$(getDataFromCmus "${cmusData}" "set repeat")"
    if [[ "${isRepeat}" == "true" ]]; then musicInfoDisplay+="R "; fi

    musicInfoDisplay+="${musicSymbol}"
    echo "${musicInfoDisplay}"
else
    echo ""
fi

