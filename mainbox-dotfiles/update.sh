#!/usr/bin/env bash
# This script copies .*rc and other config files to this directory.

_codeDir="/cygdrive/c/Users/Christopher/Desktop/Main/Code"

cp ~/.tmux/tmuxline.conf .
cp ~/.tmux.conf .

cp ~/.bashrc .
cp ~/.minttyrc .
cp ~/.vimrc .

cp -r ~/.vim/snippets .

cp -r ${_codeDir}/Shell/Status/ ./status

cp ~/.config/ranger/rc.conf .
cp ~/.config/cmus/solarized.theme .

git add "$(basename "${0}")"
git add .
# git add -u ./*
# git add ./.{bashrc,inputrc,tmux.conf,vimrc}
git commit -m "$(date "+%Y-%m-%d %H:%M")"
