# This script copies .*rc and other config files to this directory.

_codeDir="/cygdrive/c/Users/Christopher/Desktop/Main/Code"
confDir="${_codeDir}/Git/config"

cp ~/.tmux/tmuxline.conf ${confDir}
cp ~/.tmux.conf ${confDir}

cp ~/.bashrc ${confDir}
cp ~/.minttyrc ${confDir}
cp ~/.vimrc ${confDir}

cp -r ~/.vim/snippets ${confDir}

cp -r ${_codeDir}/Shell/Status/ ./status

cp ~/.config/ranger/rc.conf .
cp ~/.config/cmus/solarized.theme .

