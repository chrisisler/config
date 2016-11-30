# This script copies .*rc and other config files to this directory.

_codeDir="/cygdrive/c/Users/Christopher/Desktop/Main/Code"
confDir="${_codeDir}/Git/config"

cp ~/.tmux.conf ${confDir}
cp ~/.bashrc ${confDir}
cp ~/.minttyrc ${confDir}
cp ~/.vimrc ${confDir}

cp -r ~/.vim/snippets ${confDir}

cp ${_codeDir}/Sh/git-status-parse.sh .
