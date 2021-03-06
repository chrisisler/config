#!/usr/bin/env bash

# Symbols: ♫▷▶□■‖》《♪

pandoraIsRunning="$(tasklist | grep -i "pianobarfly" >/dev/null && echo "true" || echo "false")"

if [[ "${pandoraIsRunning}" == "false" ]]; then
    # If not playing anything, dont echo anything.
    exit -1
fi

pandoraOutput="$(cat ~/.config/pianobarfly/custom-out)"

parsePandoraOutput()
{
    local _pandoraOutput="$1"

    local songAlbumArtistInfo="$(echo -n "${_pandoraOutput}" | grep -iE "^.* by .* on .*$" | tail -1 | cut --complement -c1-8 | sed -e "s/ <3$//g" | tr -d '"')"
    song="$(echo -n "${songAlbumArtistInfo}" | sed -e "s/\r/\n/g" | grep -iE "^.*> .* by .* on .*$" | cut --complement -c1-8 | sed -e "s/ by .*$//g")"
    if [[ -z "${song}" ]]; then
        song="$(echo -n "${songAlbumArtistInfo}" | sed -e "s/ by .*$//g")";
    fi
    artist="$(echo -n "${songAlbumArtistInfo}" | sed -e 's/^.*by //g' -e 's/ on .*$//g')"
    album="$(echo -n "${songAlbumArtistInfo}" | sed -e 's/^.* on //g')"

    currentPositionInfo="$(echo -n "${_pandoraOutput}" | tail -1 | sed -e "s/\r/\n/g" -e "s/^.* -//g" -e "s/   \*.*$//g" -e "s/^0//g" | sed -e "s/\/0/\//g")"

    station="$(echo -n "${_pandoraOutput}" | grep -E "^.* Station [^(id)]" | sed -e "s/^.* Station //g" -e "s/\" .*$//g" | tr -d "\"" | tail -1)"
}

main()
{
    parsePandoraOutput "$pandoraOutput"
    # echo -n "${station}"
    # echo -n "${song}"
    # echo -n "${artist}"
    # echo -n "${album}"
    # echo -n "${currentPositionInfo}"
    echo "Pandora | ${station} → ${artist} - ${song} [${currentPositionInfo}] ♫"
}

main

