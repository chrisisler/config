#!/usr/bin/env bash

# Symbols: ♫▷▶□■‖》《♪

pandoraIsRunning="$(tasklist | grep -i "pianobarfly" >/dev/null && echo "true" || echo "false")"

# If not playing anything, dont echo anything.
if [[ "${pandoraIsRunning}" == "false" ]]; then
    exit -1
fi

pandoraOutput="$(cat ~/.config/pianobarfly/custom-out)"
pianobarflyConfigFileData="$(cat ~/.config/pianobarfly/state)"

removeParenthesis()
{
    echo -n "${1}" | sed -e "s/ (.*)//g" -e "s/\[.*\]//g"
}

parsePandoraOutput()
{
    local _pandoraOutput="$1"

    local songAlbumArtistInfo="$(echo -n "${_pandoraOutput}" | grep -iE "^.* by .* on .*$" | tail -1 | cut --complement -c1-8 | sed -e "s/ <3$//g" | tr -d '"')"

    song="$(echo -n "${songAlbumArtistInfo}" | sed -e "s/\r/\n/g" | grep -iE "^.*> .* by .* on .*$" | cut --complement -c1-8 | sed -e "s/ by .*$//g")"
    if [[ -z "${song}" ]]; then song="$(echo -n "${songAlbumArtistInfo}" | sed -e "s/ by .*$//g")"; fi
    song="$(removeParenthesis "${song}")"

    artist="$(echo -n "${songAlbumArtistInfo}" | sed -e 's/^.*by //g' -e 's/ on .*$//g')"
    artist="$(removeParenthesis "${artist}")"
    album="$(echo -n "${songAlbumArtistInfo}" | sed -e 's/^.* on //g')"

    currentPositionInfo="$(echo -n "${_pandoraOutput}" | tail -1 | sed -e "s/\r/\n/g" -e "s/^.* -//g" -e "s/   \*.*$//g" -e "s/^0//g" | sed -e "s/\/0/\//g")"

    station="$(echo -n "${_pandoraOutput}" | grep -E "^.* Station [^(id)]" | sed -e "s/^.* Station //g" -e "s/\" .*$//g" | tr -d "\"" | tail -1)"

    songIsThumbsUp="$(echo -n "${songAlbumArtistInfo}" | grep -q "[+]" &>/dev/null && echo " ♡" || echo "")"
}


getVolume()
{
    local _configData="$1"
    volume="$(echo -n "${_configData}" | grep -i "volume" | sed -e "s/^volume = //g")"
}

main()
{
    parsePandoraOutput "${pandoraOutput}"
    getVolume "${pianobarflyConfigFileData}"

    # echo -n "${station} : ${artist} - ${song} [${currentPositionInfo}] "
    # echo -n "${artist} - ${song}${songIsThumbsUp} ${currentPositionInfo} "
    echo -n "${artist} ­ ${song}${songIsThumbsUp} "
}

# Invoke main() function.
main

