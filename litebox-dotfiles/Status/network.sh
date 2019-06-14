#!/usr/bin/env bash

set -eu

# printf " ⑇${qualityPercentage}"
# ⋅⋮○●
# printf " ${networkName} ${qualityPercentage}▽"

wifi() {
  local wifiConfig="$(ifconfig -uv en0)"
  local qualityPercentage="$(printf "$wifiConfig" | grep "link quality" | sed -e "s/^.*://" | awk '{ print $1 }' | tr -d ' ')"

  local cwd="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  local networkWifiInfo="$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I)"
  local networkName="$(printf "$networkWifiInfo" | grep -E "\bSSID\b" | awk '{ print $2 }')"
  local networkSpeed="$(printf "$networkWifiInfo" | grep -i "lastTxRate" | awk '{ print $2 }' | sed -e "s/$/Mbps/")"

  if [[ "$qualityPercentage" -eq "100" ]]; then
    printf " $networkName"
    # printf " $networkName|$networkSpeed"
  elif [[ -z "$qualityPercentage" ]]; then
    exit 0
  else
    printf " $networkName|$qualityPercentage|$networkSpeed"
  fi
}

main() {
  wifi
}
main
