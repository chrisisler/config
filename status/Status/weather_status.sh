#!/usr/bin/env bash

weather="$(curl --silent wttr.in/boston)"
description="$(echo -n "${weather}" | head -3 | tail -1 | cut --complement -c 1-30)"

# failed attempts at getting temperature
# the problem is, the output is in unicode (utf8) when we need ascii

# tempRange="$(echo -n "${weather}" | head -4 | tail -1 | tr -d ' /"._-' | strings -e S)"
# tempRange="$(echo -n "${weather}" | head -4 | tail -1)"
# tempRange="$(echo -n "${weather}" | head -4 | tail -1 | iconv --from-code=UTF8 --to-code=ASCII)"
# tempRange="$(echo -n "${weather}" | head -4 | tr -d  ' /"._-' | tail -1 &>/tmp/weatherTemp.txt ; cat /tmp/weatherTemp.txt)"

echo -n "${description}"
