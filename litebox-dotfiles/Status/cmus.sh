#!/bin/bash

exitIfCmusIsNotRunning()
{
    local cmusIsRunning="$(ps | grep -qi cmus && echo "true" || echo "false")"

    if [[ "${cmusIsRunning}" == "false" ]]; then
        exit -1
    fi
}

exitIfCmusIsNotRunning

getSongFormatFromSeconds()
{
    local input="$1"
    local minutes=$(( ${input} / 60 ))
    local seconds=$(( ${input} % 60 ))

    # <#varName> gets length of <varName>.
    if [[ "${#seconds}" == 1 ]]; then
        seconds="0${seconds}"
    fi

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

parseCmusOutput()
{
    local cmusData=$(cmus-remote -Q)

    local artistName="$(getDataFromCmus "${cmusData}" "tag artist")"
    local albumName="$(getDataFromCmus "${cmusData}" "tag album")"
    local songTitle="$(getDataFromCmus "${cmusData}" "tag title")"

    local songDuration="$(getDataFromCmus "${cmusData}" "duration")"
    local songPosition="$(getDataFromCmus "${cmusData}" "position")"
    local songDurationFormatted="$(getSongFormatFromSeconds "${songDuration}")"
    local songPositionFormatted="$(getSongFormatFromSeconds "${songPosition}")"

    # I keep vol_left and vol_right equal. So picking one of them gives volume int out of 100.
    local volume="$(echo -n "${cmusData}" | grep -wE "^set vol_left" | sed -e "s/set vol_left //g")"

    local isShuffle="$(getDataFromCmus "${cmusData}" "set shuffle")"
    local isRepeat="$(getDataFromCmus "${cmusData}" "set repeat")"

    # echo -n "${songTitle} "
    # echo -n "${artistName} "
    echo -n "${artistName} - ${songTitle} "
    # echo -n "${artistName} - ${songTitle} ${songPositionFormatted}/${songDurationFormatted} "
    # echo -n "${artistName} ${songPositionFormatted}/${songDurationFormatted} "
}

parseCmusOutput

