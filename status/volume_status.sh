#!/usr/bin/env bash

volume="$(/cygdrive/c/Program\ Files/AutoHotkey/AutoHotkey.exe C:/Users/Christopher/Desktop/Main/Code/AutoHotKey/sound-get.ahk | more)"
volume="$(echo -n "${volume}" | sed -e "s/\..$//")"
echo -n "${volume}"

