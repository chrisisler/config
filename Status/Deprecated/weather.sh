#!/usr/bin/env bash

## TODO
# - Get weather temperature (the problem is, the output is in unicode (utf8) when we need ascii)
# - Get percent chance of rain

weather="$(curl --silent wttr.in/boston)"

mayRain="$(printf "${weather}" | head -12 | tail -1 | grep -qiE "(rain|thunder)" && printf " - Rain")"

description="$(printf "${weather}" | head -3 | tail -1 | tr -d ' ')"
doNotWant=";"
[ "${description/$doNotWant}" = "${description}" ] && description="Error"

printf "${description}${mayRain}"
