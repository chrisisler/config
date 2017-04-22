#!/usr/bin/env bash

# Error if any subcommand fails/throws.
set -e

commandOutput="$(pmset -g batt)"
isChargingSymbol=$(echo -n "${commandOutput}\n" | head -1 | grep -q "AC Power" && echo -n "↑" || echo -n "↓")
percent=$(echo -n "${commandOutput}\n" | tail -1 | awk '{ print $3 }' | tr -d ';')

if [ "${isChargingSymbol}" == "↓" ];then
    timeRemaining=$(echo -n "${commandOutput}" | tail -1 | awk '{ print $5 }');
    if [[ "${timeRemaining}" != "" ]]; then
        timeRemaining=" (${timeRemaining})"
    fi
fi

echo -n "${isChargingSymbol}${percent}${timeRemaining}"
