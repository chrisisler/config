#!/usr/bin/env bash

git add "$(basename "${0}")"
git add ./*
git add ./*/.{bashrc,inputrc,tmux.conf,vimrc}
git commit -m "$(date "+%Y-%m-%d %H:%M")"
