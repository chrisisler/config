#!/usr/bin/env bash
# This script copies dotfiles to this repo/dir.

dotfilesDir="$(pwd)"

cp ~/.tmux.conf "${dotfilesDir}"
cp ~/.tmux/tmuxline.conf "${dotfilesDir}"

cp ~/.bashrc "${dotfilesDir}"
cp ~/.vimrc "${dotfilesDir}"
cp ~/.inputrc "${dotfilesDir}"

cp -r ~/Code/Status "${dotfilesDir}"

cp ~/.config/ranger/rc.conf "${dotfilesDir}"
cp ~/.config/cmus/autosave "${dotfilesDir}"

cp -r ~/Code/JS/Dictionary "${dotfilesDir}"

cp ~/*.terminfo "${dotfilesDir}"

git add "$(basename "${0}")"
git add .
# git add ./*
# git add ./.{bashrc,inputrc,tmux.conf,vimrc}
git commit -m "$(date "+%Y-%m-%d %H:%M")"
