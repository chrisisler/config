#!/usr/bin/env bash

git add ./*
git add ./*/.{bashrc,inputrc,tmux.conf,vimrc}
git commit -m "$(date "+%Y-%m-%d %H:%M")"

if [[ "${?}" != 0 ]]; then
    printf "All changes added and commited.\n"
fi
