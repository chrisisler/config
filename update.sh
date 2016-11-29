# This script copies .*rc and other config files to this directory.

confDir='/cygdrive/c/Users/Christopher/Desktop/Main/Code/Git/config'

cp ~/.tmux.conf ${confDir}
cp ~/.bashrc ${confDir}
cp ~/.minttyrc ${confDir}
cp ~/.vimrc ${confDir}
cp ~/.vim/snippets ${confDir}

