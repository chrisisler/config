#!/usr/bin/env bash

info=$(ioreg -c AppleSmartBattery -r)

batteryIsCharging=$(echo -n "${info}" | grep "ExternalConnected" | grep -q "Yes" && echo "↑" || echo "↓")
batteryPercentage=$(echo -n "${info}" \
    | awk '$1~/Capacity/{c[$1]=$3} END{OFMT="%.2f%%"; max=c["\"MaxCapacity\""]; if (max>0) { print 100*c["\"CurrentCapacity\""]/max;} }' \
    | tr '.' ' ' | awk '{ print $1 }')

echo -n "${batteryIsCharging}${batteryPercentage}%"

