#!/usr/bin/env bash

isChargingArrow=$(wmic path Win32_Battery Get BatteryStatus 2>/dev/null | grep -q 1 && echo -n '↓' || echo -n '↑')
percent=$(wmic path Win32_Battery Get EstimatedChargeRemaining 2>/dev/null | head -2 | tail -1 | tr -d ' ')

echo -n "${isChargingArrow}${percent}"
