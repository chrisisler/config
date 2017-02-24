# To the extent possible under law, the author(s) have dedicated all
# copyright and related and neighboring rights to this software to the
# public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along
# with this software.
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

# base-files version 4.2-4

# ~/.bashrc: executed by bash(1) for interactive shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Use case-insensitive filename globbing
shopt -s nocaseglob

# Make bash append rather than overwrite the history on disk
shopt -s histappend

# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
shopt -s cdspell


# History Options

# Don't put duplicate lines in the history.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups

# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well


# MISC -------------------------------------------------------------------------------


export TERM="screen-256color"
export EDITOR="vim"

# solarized dark color scheme by default
source "${HOME}/mintty-colors-solarized/sol.dark"


# DEFINE COMMONLY USED DIRECTORIES ---------------------------------------------------


export cDriveDir="/cygdrive/c"
export usersDir="${cDriveDir}/Users"
export chrisDir="${usersDir}/Christopher"
export downloadsDir="${chrisDir}/Downloads"
export desktopDir="${chrisDir}/Desktop"
export mainDir="${desktopDir}/Main"
export codeDir="${mainDir}/Code"

x86Directory="${cDriveDir}/Program\ Files\ \(x86\)"

lslaVar="ls -hoAF --color --sort=extension --group-directories-first"


# START ALIASES ----------------------------------------------------------------------


# change directories
alias main="cd ${mainDir} && ${lslaVar}"
alias code="cd ${codeDir} && ${lslaVar}"
alias ed="cd ${codeDir}/Git/ErxiDesk && ${lslaVar}"
alias desktop="cd ${desktopDir} && ${lslaVar}"
alias bad="cd ${mainDir}/Bad && ${lslaVar}"
alias music="cd ${chrisDir}/Music && ${lslaVar}"
alias downloads="cd ${downloadsDir} && ${lslaVar}"
alias appdata="cd ${chrisDir}/AppData && ${lslaVar}"
alias pictures="cd ${chrisDir}/Pictures && ${lslaVar}"
alias otw="cd ${mainDir}/Secure/OverTheWire/ && ${lslaVar}"
alias sec="cd ${mainDir}/Secure && ${lslaVar}"
alias cs="cd ${codeDir}/Academic/CS310 && ${lslaVar}"
alias startup="cd ${chrisDir}/AppData/Roaming/Microsoft/Windows/Start\ Menu/Programs/Startup"
alias test="cd ${codeDir}/Test && vim"
alias ramda="cd ${codeDir}/JS/Ramda-Trial && vim ./index.js"
alias safe="cd /tmp/safe"
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."


# daily terminal use
alias c="clear"
alias l="${lslaVar}"
alias la="ls -1aFh --color --sort=extension --group-directories-first"
alias cl="clear && ${lslaVar}"
alias lc="clear && ${lslaVar}"
alias dir="explorer ."
alias start="cygstart"
alias remove="apt-cyg remove"
alias md="mkdir -pv"
alias rmi="rm -irv"
alias rmf="rm -frv"
alias rm="rm -rv"
alias mv="mv -iv"
alias whatis="whatis -vl"
alias tree="tree -I *node_modules*"


# edit config files
alias brc="vim ~/.bashrc"
alias sbrc="source ~/.bashrc && clear"
alias vrc="vim ~/.vimrc"
alias tmuxconf="vim ~/.tmux.conf"
alias tmuxline="vim ~/.tmux/tmuxline.conf"
alias rangerrc="vim ~/.config/ranger/rc.conf"
alias bugnrc="vim ${chrisDir}/AppData/Roaming/bug.n/Config.ini"
alias parse="cd ${codeDir}/Shell/Status/ && ${lslaVar}"
alias bugndoc="vim ${codeDir}/Bin/bug.n-8.4.0/doc/Default_hotkeys.md"


# start an application
alias league="${cDriveDir}/Riot\ Games/League\ of\ Legends/lol.launcher.exe"
alias vlc="${x86Directory}/VideoLAN/VLC/vlc $@"
alias taskmngr="${cDriveDir}/Windows/System32/Taskmgr.exe"
alias st="cygstart ${x86Directory}/Sublime\ Text\ 3/sublime_text.exe $@"
alias itunes="cygstart ${cDriveDir}/Program\ Files/iTunes/iTunes.exe"
alias algorithms="cygstart ${mainDir}/Academic/Textbooks/2016-Fall/Data-Structures-and-Algorithms-4thEd.pdf"
alias linear="cygstart ${mainDir}/Academic/Textbooks/2016-Fall/Linear-Algebra-4thEdition.pdf"
alias chrome="cygstart ${x86Directory}/Google/Chrome/Application/chrome.exe $@"
alias tor="cygstart ${mainDir}/Secure/Tor\ Browser/Browser/firefox.exe $@"
alias firefox="cygstart ${x86Directory}/Mozilla\ Firefox/firefox.exe $@"
alias vivaldi="cygstart ${x86Directory}/Vivaldi/Application/vivaldi.exe $@"
alias deluge="cygstart ${x86Directory}/Deluge/deluge.exe $@"
alias u1603="cygstart ${mainDir}/Secure/Bin/Ultrareach-Proxy/u1603.exe"
alias nmap="${x86Directory}/Nmap/nmap.exe"
alias wireshark="cygstart ${cDriveDir}/Program\ Files/Wireshark/Wireshark.exe"
alias vmware="cygstart ${x86Directory}/VMWare/VMWare\ Workstation/vmware.exe"
alias vm="${cDriveDir}/Program\ Files/Oracle/VirtualBox/VirtualBox.exe --startvm \"d597cc7b-d26e-4d81-902c-a66a46729e64\" &"
alias reaper="cygstart ${cDriveDir}/Program\ Files/REAPER\ \(x64\)/reaper.exe"


# programming
alias gs="git status"
alias gsp="git status --porcelain"
alias p="clear; more package.json | jq --tab"
alias ns="npm start"

alias tmuxtemp="tmux attach -t Temp || tmux new -s Temp"
alias tmuxmain="tmux attach -t Main || tmux new -s Main"
alias tmuxmusic="tmux attach -t Music || tmux new -s Music"
alias tmuxed="cd ${codeDir}/Git/ErxiDesk && ${lslaVar}; tmux attach -t ErxiDesk || tmux new -s ErxiDesk"


# scripts
alias jsmail='node "`cygpath -w ${codeDir}/JS/Nodemailer/Mail/js-mail.js`"' "$@"
alias foodlog='node "`cygpath -w ${codeDir}/JS/FoodLog/food-log.js`"'
alias clean="${chrisDir}/Desktop/Main/Code/Shell/Bin/clean.sh"
alias add-clean='echo "die '$@' 2>/dev/null" >> ${codeDir}/Shell/Bin/clean.sh'
alias tg="${codeDir}/CSharp/TypeGroup/Version2.exe $@"
alias weather="curl wttr.in/boston"
alias stoprs="jsmail islerryan@gmail.com 'STOP PLAYING RS' 'STOP STOP STOP STOP STOP'"
alias updateconfig="${codeDir}/Git/config/update.sh"
alias cmus-control="start ${codeDir}/AutoHotKey/Cmus-Integration/cmus-control.ahk"
alias dark-mode="${codeDir}/Shell/Bin/dark-mode.sh"
alias light-mode="${codeDir}/Shell/Bin/light-mode.sh"


# utilities (in the terminal)
alias cmdfetch2="${codeDir}/Bin/fetch/cmdfetch.lua --logo windows7 --lefty --color blue"
alias cmdfetch="${codeDir}/Bin/fetch/cmdfetch.lua"
alias fetch="${codeDir}/Shell/Bin/erxi-fetch.sh"
alias ranger="${codeDir}/Bin/ranger-1.7.2/scripts/ranger"
alias bugn="cygstart ${codeDir}/Bin/bug.n-8.4.0/bugn.exe"
alias pandora="cd ~ && ${codeDir}/Bin/pianobarfly/pianobarfly.exe | tee ~/.config/pianobarfly/custom-out"
alias torrent="rtorrent -d /cygdrive/c/Users/Christopher/Downloads -s /cygdrive/c/Users/Christopher/Downloads"
alias pdf='node "`cygpath -w ${codeDir}/JS/Bin/pdf/index.js`"' "$@" # yay for quotes working properly.
alias r='ranger'
alias progress='pv'
alias ampv="mpv $@ &>/dev/null &"


# everything else
alias remake="die explorer && start explorer &> /dev/null"
alias hibernate="shutdown --force --suspend $@"
alias killvm="die vboxsvc && die virtualbox"
alias xit="exit"
alias eixt="exit"
alias q="exit"
alias cpi="rsync -vrthP"
alias setup="cygstart ${codeDir}/Bin/setup-*.exe"
alias noleague="die 'LolClient'; die 'Lolpatcher'; die 'LolClient'; die 'League of Legends'"
alias notor="die 'tor'; die'firefox'"
alias sniptool="cygstart ${cDriveDir}/WINDOWS/system32/SnippingTool.exe"
alias cpan="control panel"
alias spamrandom="cat /dev/urandom | tr -cd '01'"
alias spamlights='yes "$(seq 16 231)" | while read i; do printf "\x1b[48;5;${i}m\n"; sleep .02; done'
alias weecred="more ${mainDir}/Random/Bin/weechat-cred.txt"
alias weedoc="vivaldi http://weechat.org/files/doc/stable/weechat_user.en.html"
alias pipesx="${codeDir}/Bin/pipesX/pipesX.sh"
alias pipes="${codeDir}/Bin/pipes/pipes.sh"
alias mpv="mpv --loop=inf $@ &>/dev/null"


# Games
alias tetris='ctris'
alias typespeed='typespeed'


# commands
alias tm="clear; tasklist | grep 'Console' | sort -r -k 4 | awk '{ printf \"%30s : %5s : %s%s\n\", \$1,\$2,\$5,\$6 }'"
alias tm5="clear; tasklist | grep 'Console' | sort -r -k 4 | awk '{ printf \"%30s : %5s : %s%s\n\", \$1,\$2,\$5,\$6 }' | head -35"
alias path='echo "${PATH}" | tr ":" "\n" | sort'


# END ALIASES -----------------------------------------------------------------


# START FUNCTION ALIASES ------------------------------------------------------

function get() {
    local pkg="$1"

    apt-cyg install "${pkg}" | grep -ve 'Unable to locate package' -ve 'Installing'
    apt-cyg install "${pkg}-dev" | grep -ve 'Unable to locate package' -ve 'Installing'
    apt-cyg install "${pkg}-devel" | grep -ve 'Unable to locate package' -ve 'Installing'
    apt-cyg install "lib${pkg}" | grep -ve 'Unable to locate package' -ve 'Installing'
    apt-cyg install "lib${pkg}-dev" | grep -ve 'Unable to locate package' -ve 'Installing'
    apt-cyg install "lib${pkg}-devel" | grep -ve 'Unable to locate package' -ve 'Installing'
    apt-cyg install "${pkg}lib" | grep -ve 'Unable to locate package' -ve 'Installing'
    apt-cyg install "${pkg}lib-dev" | grep -ve 'Unable to locate package' -ve 'Installing'
    apt-cyg install "${pkg}lib-devel" | grep -ve 'Unable to locate package' -ve 'Installing'
    apt-cyg install "${pkg}-lib" | grep -ve 'Unable to locate package' -ve 'Installing'
    apt-cyg install "${pkg}-lib-dev" | grep -ve 'Unable to locate package' -ve 'Installing'
    apt-cyg install "${pkg}-lib-devel" | grep -ve 'Unable to locate package' -ve 'Installing'
}

function killvmware() {
    die "vmware"
    die "vmware-tray"
    die "vmware-unity-helper"
    die "vmnat"
    die "vmnetdhcp"
    die "vmware-authd"
    die "vmware-hostd"
    die "vmware-usbarbitrator64"
}
export -f killvmware

function die() {
    taskkill /f /im "$@.exe"
}
export -f die

function ip() {
    externalIP=`curl -s "http://whatismijnip.nl" | cut -d " " -f 5`
    if [[ "${externalIP}" != "" ]]; then
        echo -n "${externalIP}"
    fi
}
export -f ip


# END FUNCTION ALIASES --------------------------------------------------------


# START PROMT STRING ----------------------------------------------------------

# Prompt variables.
_numDirs='$(ls -1AF | grep / | wc -l)'
_numFiles='$(ls -1AF | grep -v / | wc -l)'
_currentDirectory="\w"
_christopher="\u"
_computerName="\h"
_time="\@"
_date="\d"
_promptChar="\$"

# Colors based on solarized dark colorscheme (ethanschoonover.com/solarized).
base01="\[\e[0;30m\]"
red="\[\e[0;31m\]"
yellow="\[\e[0;32m\]"
orange="\[\e[0;33m\]"
blue="\[\e[0;34m\]"
magenta="\[\e[0;35m\]"
cyan="\[\e[0;36m\]"

base00="\[\e[1;30m\]"
orangeRed="\[\e[1;31m\]"
darkGrey="\[\e[1;32m\]"
mediumGrey="\[\e[1;33m\]"
lightGrey="\[\e[1;34m\]"
violet="\[\e[1;35m\]"
normal="\[\e[1;36m\]"

white="\[\e[37m\]"
colEnd="\[\e[0m\]"

# source "${codeDir}/Shell/Status/git_status_multi.sh"
# export PS1="\
# \n\
# ${white}¤${colEnd}\
#  ${blue}${_currentDirectory}${colEnd}\
# ${yellow}\$(gitBracketL)${colEnd}\
# ${cyan}\$(gitBranch)${colEnd}\
# ${lightGrey}\$(gitBranchAheadOrBehindOfMaster)${colEnd}\
# ${blue}\$(gitAddedChanges)${colEnd}\
# ${red}\$(gitUnaddedChanges)${colEnd}\
# ${yellow}\$(gitBracketR)${colEnd}\
# \n\
# ${white}${_promptChar}${colEnd} "

# export PS1="\
# \n\
# ${white}¤${colEnd}\
#  ${blue}${_currentDirectory}${colEnd}\
# \n\
# ${white}${_promptChar}${colEnd} "

export PS1="\n${red} ›>${colEnd} "

