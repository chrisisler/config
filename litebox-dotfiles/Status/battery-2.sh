#!/usr/bin/env bash

# Error if any subcommand fails/throws.
set -e

commandOutput="$(pmset -g batt)"
isChargingSymbol=$(echo -n "${commandOutput}\n" | head -1 | grep -q "AC Power" && echo -n "↑" || echo -n "↓")
percent=$(echo -n "${commandOutput}\n" | head -2 | tail -1 | awk '{ print $3 }' | tr -d ';%')
# percent=$(echo -n "${commandOutput}\n" | head -2 | tail -1 | awk '{ print $3 }' | tr -d ';')

timeRemaining=""
if [ "${isChargingSymbol}" == "↓" ];then
    timeRemaining=" $(echo -n "${commandOutput}" | head -2 | tail -1 | awk '{ print $5 }')"
    if [ grep -q "${timeRemaining}" "(no" ]; then
        timeRemaining=" (${timeRemaning})"
    fi
fi

echo -n "${isChargingSymbol}${percent}${timeRemaining}"
# echo -n "${isChargingSymbol}${percent}"
