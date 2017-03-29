#!/usr/bin/env bash

## TODO
# - Get weather temperature (the problem is, the output is in unicode (utf8) when we need ascii)
# - Get percent chance of rain

weather="$(curl --silent wttr.in/boston)"

# mayRain="$(echo -n "${weather}" | head -12 | tail -1 | grep -iE "(rain|thunder)" &>/dev/null && echo " - Rain")"

description="$(echo -n "${weather}" | head -3 | tail -1 | cut --complement -c 1-30)"

# If description == "" then it's not "Partly Cloudy" or "Clear". So try a new command.
# [ -z "${description}" ] && description="$(echo -n "${weather}" | head -3 | tail -1 | tr -d ' ')"

echo -n "${description}${mayRain}"
