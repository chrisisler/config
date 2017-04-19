#!/usr/bin/env bash

getBatteryInfo() {
    local batteryisChargingOrNotStatus=$(wmic path Win32_Battery Get BatteryStatus 2>/dev/null | grep -q 1 && echo '↓' || echo '↑')
    local batteryPercentage=$(wmic path Win32_Battery Get EstimatedChargeRemaining /format:list 2>/dev/null | grep '[^[:blank:]]' | cut -d= -f2)

    echo -n "${batteryisChargingOrNotStatus}${batteryPercentage}%"
}

getBatteryInfo

# let g:tmuxline_preset = {
#     \'a' : ["%b%e"],
#     \'b' : ["%a"],
#     \'c' : ["%I:%M %p"],
#     \'x' : ["#W", "#(tmux list-panes | wc -l)P", "#(tmux list-windows | wc -l)W"],
#     \'y' : ["#S", "#(tmux list-sessions | wc -l)S"],
#     \'z' : ["#(wmic path Win32_Battery Get BatteryStatus 2>/dev/null | grep -q 1 && echo '↓' || echo '↑')#(wmic path Win32_Battery Get EstimatedChargeRemaining /format:list 2>/dev/null | grep '[^[:blank:]]' | cut -d= -f2)%%"]}

