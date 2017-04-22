#!/usr/bin/env bash
# This script copies .*rc and other config files to this directory.

_codeDir="/cygdrive/c/Users/Christopher/Desktop/Main/Code"
confDir="${_codeDir}/Git/config"

# if [[ "$(uname)" == "Darwin" ]]; then
#     _codeDir="/Volumes/Users/Christopher/Desktop/Main/Code"
#     confDir="${_codeDir}/Git/config"
#     # TODO: Make Windows ~ available from litebox
# fi

cp ~/.tmux/tmuxline.conf ${confDir}
cp ~/.tmux.conf ${confDir}

cp ~/.bashrc ${confDir}
cp ~/.minttyrc ${confDir}
cp ~/.vimrc ${confDir}

cp -r ~/.vim/snippets ${confDir}

cp -r ${_codeDir}/Shell/Status/ ./status

cp ~/.config/ranger/rc.conf .
cp ~/.config/cmus/solarized.theme .

git add "$(basename "${0}")"
git add -u ./*
git add ./.{bashrc,inputrc,tmux.conf,vimrc}
git commit -m "$(date "+%Y-%m-%d %H:%M")"
