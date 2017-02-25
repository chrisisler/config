#!/usr/bin/env bash

# Get total used RAM in GigaBytes (specifically, the public working set)

usedRam=$(( $(tasklist /nh | tr -d ',K' | awk '{print $5}' | awk '{sum+=$1} END {print sum}') / 1000 ))
echo "${usedRam:0:1}.${usedRam:1:1} G"
