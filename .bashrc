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

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bashrc file

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
alias cs="cd ${codeDir}/Academic/CS310 && ${lslaVar}"
alias startup="cd ${chrisDir}/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup"
alias test="cd ${codeDir}/Test && vim"
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
alias cl="clear && ${lslaVar}"
alias dir="explorer ."
alias start="cygstart"
alias get="apt-cyg install"
alias remove="apt-cyg remove"
alias md="mkdir -pv"
alias rmi="rm -irv"
alias rmf="rm -frv"
alias rm="rm -rv"
alias mv="mv -iv"
alias whatis="whatis -vl"


# edit config files
alias brc="vim ~/.bashrc"
alias sbrc="source ~/.bashrc && clear"
alias vrc="vim ~/.vimrc"
alias tmuxconf="vim ~/.tmux.conf"
alias rangerrc="vim ~/.config/ranger/rc.conf"
alias bugnrc="vim ${chrisDir}/AppData/Roaming/bug.n/Config.ini"
alias gitparse="vim ${codeDir}/Sh/git-status-parse.sh"


# start an application
alias league="${cDriveDir}/Riot\ Games/League\ of\ Legends/lol.launcher.exe"
alias vlc="${x86Directory}/VideoLAN/VLC/vlc &>/dev/null &"
alias notes="StikyNot.exe"
alias taskmngr="${cDriveDir}/Windows/System32/Taskmgr.exe"
alias st="cygstart ${x86Directory}/Sublime\ Text\ 3/sublime_text.exe $@"
alias itunes="cygstart ${cDriveDir}/Program\ Files/iTunes/iTunes.exe"
alias algorithms="cygstart ${mainDir}/Academic/Textbooks/2016-Fall/Data-Structures-and-Algorithms-4thEd.pdf"
alias linear="cygstart ${mainDir}/Academic/Textbooks/2016-Fall/Linear-Algebra-4thEdition.pdf"
alias chrome="cygstart ${x86Directory}/Google/Chrome/Application/chrome.exe $@"
alias firefox="cygstart ${x86Directory}/Mozilla\ Firefox/firefox.exe $@"
alias vivaldi="cygstart ${x86Directory}/Vivaldi/Application/vivaldi.exe $@"
alias deluge="cygstart ${x86Directory}/Deluge/deluge.exe $@"
alias u1603="cygstart ${mainDir}/Secure/Bin/Ultrareach-Proxy/u1603.exe"
alias nmap="cygstart ${x86Directory}/Nmap/nmap.exe"
alias wireshark="cygstart ${cDriveDir}/Program\ Files/Wireshark/Wireshark.exe"
alias vmware="cygstart ${x86Directory}/VMWare/VMWare\ Workstation/vmware.exe"
alias vm="${cDriveDir}/Program\ Files/Oracle/VirtualBox/VirtualBox.exe --startvm \"d597cc7b-d26e-4d81-902c-a66a46729e64\" &"
alias reaper="cygstart ${cDriveDir}/Program\ Files/REAPER\ \(x64\)/reaper.exe"


# programming
alias gs="git status"
alias gsp="git status --porcelain"
alias tmuxinit="tmux attach -t Main || tmux new -s Main"


# scripts
alias jsmail='node "`cygpath -w ${codeDir}/JS/Mail/js-mail.js`"' "$@"
alias jstext=' node "`cygpath -w ${codeDir}/JS/Text/index.js`"'
alias foodlog='node "`cygpath -w ${codeDir}/JS/FoodLog/food-log.js`"'
alias clean="${chrisDir}/Desktop/Main/Code/Sh/clean.sh"
alias tg="${codeDir}/CSharp/TypeGroup/Version2.exe $@"
alias weather="curl wttr.in/boston"
alias stoprs="jsmail islerryan@gmail.com 'STOP PLAYING RS' 'STOP STOP STOP STOP STOP'"


# utilities (in the terminal)
alias cmdfetch="${codeDir}/Bin/fetch/cmdfetch.lua --logo windows7 --lefty --color blue"
alias ranger="${codeDir}/Bin/ranger-1.7.2/scripts/ranger"
alias bugn="cygstart ${codeDir}/Bin/bug.n-8.4.0/bugn.exe"
alias pandora="cd ~; ${codeDir}/Bin/pianobarfly/pianobarfly.exe"
alias torrent="rtorrent -d /cygdrive/c/Users/Christopher/Downloads -s /cygdrive/c/Users/Christopher/Downloads"
alias pdf='node "`cygpath -w ${codeDir}/JS/Bin/pdf/index.js`"' "$@"


# everything else
alias remake="die explorer.exe && start explorer.exe &> /dev/null"
alias hibernate="shutdown --force --suspend $@"
alias killvm="die vboxsvc.exe && die virtualbox.exe"
alias xit="exit"
alias eixt="exit"
alias cpi="rsync -vrthP"
alias setup="cygstart ${codeDir}/Bin/setup-*.exe"
alias killleague="die 'LolClient.exe'; die 'Lolpatcher.exe'; die 'LolClient.exe'; die 'League of Legends.exe'"
alias sniptool="cygstart ${cDriveDir}/WINDOWS/system32/SnippingTool.exe"
alias cpan="control panel"
alias spamrandom="cat /dev/urandom | tr -cd '01' | fold -w ${COLUMNS}"


# commands
alias tm="clear; tasklist | grep 'Console' | sort -r -k 4 | awk '{ printf \"%30s : %5s : %s%s\n\", \$1,\$2,\$5,\$6 }'"
alias tm5="clear; tasklist | grep 'Console' | sort -r -k 4 | awk '{ printf \"%30s : %5s : %s%s\n\", \$1,\$2,\$5,\$6 }' | head -50"
alias path='echo "${PATH}" | tr ":" "\n" | sort'


# END ALIASES -----------------------------------------------------------------


# START FUNCTION ALIASES ------------------------------------------------------



function killvmware() {
    die "vmware.exe"
    die "vmware-tray.exe"
    die "vmware-unity-helper.exe"
    die "vmnat.exe"
    die "vmnetdhcp.exe"
    die "vmware-authd.exe"
    die "vmware-hostd.exe"
    die "vmware-usbarbitrator64.exe"
}
export -f killvmware

function die() {
    taskkill /f /im "$@"
}
export -f die

function ip() {
    externalIP=`curl -s "http://whatismijnip.nl" | cut -d " " -f 5`
    if [[ "${externalIP}" != "" ]]; then
        echo "<${externalIP}> " # Spacing and brackets for $PS1
    else
        echo ""
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

source "${codeDir}/Sh/git-status-parse.sh"

export PS1="\
\n\
${darkGrey}¤${colEnd}\
 ${blue}${_currentDirectory}${colEnd}\
${yellow}\$(gitBracketL)${colEnd}\
${cyan}\$(gitBranch)${colEnd}\
${lightGrey}\$(gitBranchAheadOrBehindOfMaster)${colEnd}\
${blue}\$(gitAddedChanges)${colEnd}\
${red}\$(gitUnaddedChanges)${colEnd}\
${yellow}\$(gitBracketR)${colEnd}\
\n\
${white}${_promptChar}${colEnd} "

# export PS1="\
# \n\
# ${cyan}¤${colEnd}\
#  ${blue}${_currentDirectory}${colEnd}\
# \n\
# ${white}${_promptChar}${colEnd} "

