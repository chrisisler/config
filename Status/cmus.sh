#!/bin/bash

exitIfCmusIsNotRunning()
{
    local cmusIsRunning="$(ps | grep -qi cmus && printf "true" || printf "false")"

    if [[ "$cmusIsRunning" == "false" ]]; then
        exit -1
    fi
}

exitIfCmusIsNotRunning

getSongFormatFromSeconds()
{
    local input="$1"
    local minutes=$(( $input / 60 ))
    local seconds=$(( $input % 60 ))

    # <#varName> gets length of <varName>.
    if [[ "${#seconds}" == 1 ]]; then
        seconds="0$seconds"
    fi

    local output="${minutes}:${seconds}"
    printf "$output"
}

getDataFromCmus()
{
    local _cmusData="$1"
    local dataToGet="$2"
    local data="$(printf "$_cmusData" | grep -wE "^$dataToGet" | sed -e "s/$dataToGet //g")"
    printf "$data"
}

parseCmusOutput()
{
    local cmusData=$(cmus-remote -Q)

    local artistName="$(getDataFromCmus "$cmusData" "tag artist")"
    local albumName="$(getDataFromCmus "$cmusData" "tag album")"
    local songTitle="$(getDataFromCmus "$cmusData" "tag title")"

    local songDuration="$(getDataFromCmus "$cmusData" "duration")"
    local songPosition="$(getDataFromCmus "$cmusData" "position")"
    local songDurationFormatted="$(getSongFormatFromSeconds "$songDuration")"
    local songPositionFormatted="$(getSongFormatFromSeconds "$songPosition")"

    # I keep vol_left and vol_right equal. So picking one of them gives volume int out of 100.
    local volume="$(printf "$cmusData" | grep -wE "^set vol_left" | sed -e "s/set vol_left //g")"

    local isShuffle="$(getDataFromCmus "$cmusData" "set shuffle")"
    local isRepeat="$(getDataFromCmus "$cmusData" "set repeat")"

    # printf "$songTitle "
    printf "$songTitle $songPositionFormatted/$songDurationFormatted "
    # printf "$artistName "
    # printf "$artistName - $songTitle "
    # printf "$artistName - $songTitle $songPositionFormatted/$songDurationFormatted "
    # printf "$artistName $songPositionFormatted/$songDurationFormatted "
}

parseCmusOutput

