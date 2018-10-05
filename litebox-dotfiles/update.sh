#!/usr/bin/env bash
# This script copies dotfiles to this repo/dir.

dotfilesDir="$(pwd)"

cp -r ~/Code/Bin/itermcolors "${dotfilesDir}"
cp ~/.tmux.conf "${dotfilesDir}"
cp ~/.tmux/tmuxline.conf "${dotfilesDir}"

cp ~/.bash_profile "${dotfilesDir}"
cp ~/.bashrc "${dotfilesDir}"
cp ~/.inputrc "${dotfilesDir}"
cp ~/.vimrc "${dotfilesDir}"

cp -r ~/.vim/rc "${dotfilesDir}"

cp -r ~/Code/Status "${dotfilesDir}"

cp ~/.config/ranger/rc.conf "${dotfilesDir}"
cp ~/.config/cmus/autosave "${dotfilesDir}"

cp -r ~/Code/JS/Dictionary "${dotfilesDir}"

# cp ~/*.terminfo "${dotfilesDir}"

# rm ./.DS_Store

git add "$(basename "${0}")"
git add .
# git add ./*
# git add ./.{bashrc,inputrc,tmux.conf,vimrc}
git commit -m "$(date "+%Y-%m-%d %H:%M")"
