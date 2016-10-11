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

# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
# set -o notify
#
# Don't use ^D to exit
# set -o ignoreeof
#
# Use case-insensitive filename globbing
shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
shopt -s cdspell

# Completion options
#
# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1
#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
# [[ -f /etc/bash_completion ]] && . /etc/bash_completion

# History Options
#
# Don't put duplicate lines in the history.
# export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
#
# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"

# Aliases
#
# Some people use a different file for aliases
# if [ -f "${HOME}/.bash_aliases" ]; then
#   source "${HOME}/.bash_aliases"
# fi

source "${HOME}/mintty-colors-solarized/sol.dark"

export chris='/cygdrive/c/Users/Christopher'
export x86Directory="/cygdrive/c/Program Files (x86)"
lslaVar="ls -hoAF --color --sort=extension --group-directories-first"

alias cls="clear"
alias c="clear"
alias lsla="${lslaVar}"
alias ll="${lslaVar}"
alias l="${lslaVar} | grep -vi 'total'"
alias main="cd ${chris}/Desktop/Main"
alias sbrc="source ~/.bashrc && clear"
alias brc="vim ~/.bashrc"
alias pictures="cd ${chris}/Pictures/"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias cd..="cd .."
alias md="mkdir -pv"
alias rmi="rm -irv"
alias rmf="rm -frv"
alias rm="rm -rv"
alias mv="mv -i"
alias get="apt-cyg install"
alias remove="apt-cyg remove"
alias desktop="cd `cygpath -D`"
alias downloads="cd ${chris}/Downloads"
alias dir='explorer .'
alias windump='/cygdrive/c/Windows/WinDump.exe'
alias tcpdump='windump -i 3 -v -n -s 0 -t' # Call WinDump.exe, view packets
alias code="cd ${chris}/Desktop/Main/Code"
alias terarc='cd C:/ProgramData/HappyCloud/Cache/TERA'
alias vrc='vim ~/.vimrc'
alias exist="${chris}/Desktop/Main/Code/Bash/exist.sh"
alias strc='cd "/cygdrive/c/Users/Christopher/AppData/Roaming/Sublime Text 3/Packages/User"'
alias start='cygstart'
alias kn="$chris/Desktop/Main/Code/Bash/killnow.sh"
alias league='"/cygdrive/c/Riot Games/League of Legends/lol.launcher.exe"'
alias clsla="clear && ${lslaVar}"
alias lslad="${lslaVar} | grep /" # directories only
alias back='cd -'
alias note="${chris}/Desktop/Main/note.txt"
alias notes='cygstart StikyNot.exe'
alias dieahk='die autohotkey.exe'
alias startup='cd "${chris}/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup"'
alias ahk=" cd$chris/Desktop/Main/Code/AutoHotKey"
alias calc='bc'
alias deluge='"${x86Directory}"/Deluge/deluge.exe "$@"'
alias vm="/cygdrive/c/Program\ Files/Oracle/VirtualBox/VirtualBox.exe --startvm \"d597cc7b-d26e-4d81-902c-a66a46729e64\" &"
alias sleep="shutdown --force --suspend $@"
alias shutdown="shutdown --force --shutdown $@"
alias openvpn="${x86Directory}/OpenVPN Technologies/PrivateTunnel/privatetunnel/privatetunnel*.exe"
alias setupexe="${chris}/Downloads/setup-x86_64.exe"
alias killvm="die vboxsvc.exe && die virtualbox.exe"
alias gs="git status"
alias jsmail='node "`cygpath -w ${chris}/Desktop/Main/Code/JS/Mail/js-mail.js`"' "$@"
alias services="tasklist | sort -k 1 | grep -i 'services'"
alias tasks="tasklist | sort -k 1 | grep -i 'console'"
alias nmap='"${x86Directory}"/Nmap/nmap.exe'
alias zenmap='"${x86Directory}"/Nmap/zenmap.exe'
alias clear-desktop="${chris}/Desktop/Main/Code/Bash/clear-desktop.sh"
alias cs="csc /nologo /t:exe $@"
alias xit="exit"
alias cpan="control panel"
alias videos="cd ${chris}/Videos"
alias cpi='rsync -vrthP'
alias startup='cd "/cygdrive/c/Users/Christopher/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup"'
alias wireshark='cygstart "/cygdrive/c/Program Files/Wireshark/Wireshark.exe"'
alias clean="${chris}/Desktop/Main/Code/Bash/clean-tasksNservices.sh"
alias algorithms="cygstart ${chris}/Desktop/Main/Academic/Textbooks/2016-Fall/Data-Structures-and-Algorithms-4thEd.pdf"
alias linear="cygstart ${chris}/Desktop/Main/Academic/Textbooks/2016-Fall/Linear-Algebra-4thEdition.pdf"
alias clean="${chris}/Desktop/Main/Code/Bash/clean-tasksNservices.sh"
alias foodlog='node "`cygpath -w ${chris}/Desktop/Main/Code/JS/FoodLog/food-log.js`"'
alias remake='die explorer.exe && start explorer.exe &> /dev/null'
alias snippets='cd "~/.vim/snippets"'
alias reaper='cygstart "/cygdrive/c/Program Files/REAPER (x64)/reaper.exe"'
alias ang='cd "${chris}/Desktop/Main/Code/Angular-Tutorial/angular-phonecat/"'
alias test='cd "${chris}/Desktop/Main/Code/Test/" && vim'
alias jstext=' node "`cygpath -w ${chris}/Desktop/Main/Code/JS/Text/index.js`"'
alias otw='cd "${chris}/Desktop/Main/Secure/OverTheWire/"'
alias tmuxconf='vim ~/.tmux.conf'

function killvmware() {
    die 'vmware.exe'
    die 'vmware-tray.exe'
    die 'vmware-unity-helper.exe'
    die 'vmnat.exe'
    die 'vmnetdhcp.exe'
    die 'vmware-authd.exe'
    die 'vmware-hostd.exe'
    die 'vmware-usbarbitrator64.exe'
}
alias vmware='cygstart "C:\Program Files (x86)\VMware\VMware Workstation\vmware.exe"'
export -f killvmware

function u1504() {
    cygstart "${chris}/Desktop/Main/Random/Security/u1504/u1603/u1603.exe"
}
export -f u1504

function learnrandom() {
    whatis $(ls /bin | shuf -n 1)
}
export -f learnrandom

function news() {
    # Convert unix-style path to windows path with "cygpath -w"
    python.exe "`cygpath -w ${chris}/Desktop/Main/Code/Python/News/drudge.py`"
}
export -f news

function st() {
    "$x86Directory/Sublime Text 3/sublime_text.exe" "$@" &
}
export -f st

function chrome() {
    cygstart "${x86Directory}/Google/Chrome/Application/chrome.exe" "$@"
}
export -f chrome

function firefox() {
    cygstart "{x86Directory}/Mozilla Firefox/firefox.exe" "$@"
}
export -f firefox

function die() {
    taskkill /f /im "$@"

}
export -f die

function remove() {
    apt-cyg remove "$@"
}
export -f remove

function restart() {
    shutdown -r now # Restart computer immediately.
}
export -f restart

function killimg() {
    die "Microsoft.Photos.exe"
}
export -f killimg

function typegroup() {
    "$chris/Desktop/Main/Code/CSharp/TypeGroup/Version2.exe" "$@"
}
export -f typegroup
alias tg=typegroup

function killleague() {
    die "LolClient.exe"
    die "Lolpatcher.exe"
    die "LolClient.exe"
    die "League of Legends.exe"
}
export -f killleague

function ahkhelp() {
    cygstart "/cygdrive/c/Program Files/AutoHotkey/AutoHotkey.exe"
}
export -f ahkhelp

function updateConfig() {
    local configPath="${chris}/Desktop/Main/Code/Git/Config/"

    # copy all sublime text /package/user/ files to /git/config/st/settings/
    cp -rv "${chris}/AppData/Roaming/Sublime Text 3/Packages/User/* ${configPath}"

    # todo: copy all ConEmu settings to configPath
    # todo: copy all cygwin settings to configPath
}
export -f updateConfig

# File descriptors:
# 0 -> stdin
# 1 -> stdout
# 2 -> stderr
# & -> stdout and stderr

# Retrieve current status of git repo.
function gitStatusParse()
{
    # "&> /dev/null" Ignores stdout and stderr. modified is "" or number of modified files.

    # Get current status. Pipe stderr to stdout (2>&1) to avoid printing errors.
    local status=`git status 2>&1`

    # Check for modified files. If any, display "!"" and show ~N modifications.
    # <modified> is either null ("") or an integer - the number of modified files.
    local modified=`echo "${status}" | grep "modified:" | wc -l &> /dev/null`

    # Check for untracked changes, if so, display "~", otherwise <untracked> is null ("").
    # TODO: Display +N for lines in "Untracked files:".
    local untracked=`echo "${status}" | grep -i "untracked files:" &> /dev/null`

    # (After "add" or "rm",) check for any changes to be committed.
    local committed=`echo "${status}" | grep -i "changes to be committed:" &> /dev/null`

    # Check for any committed changes (ready to be pushed).
    local ahead=`echo "${status}" | grep -i "your branch is ahead"`

    # Check for any deleted files, if any, display "-N", otherwise null ("").
    local deleted=`echo "${status}" | grep -i "deleted:" &> /dev/null`

    local notStaged=`echo "${status}" | grep -i "not staged" &> /dev/null`

    # <displayed> is the string containg all results from the above status parsings.
    local displayed=""

    if [[ "${ahead}" != "" ]]; then
        display+="↑"
    fi

    if [[ "${modified}" != "" ]]; then
        display+=" +${modified}"
    fi

    if [[ "${untracked}" != "" ]]; then
        display+=" ~"
    fi

    # After "git add" or "git rm", get number of modified or new files
    if [[ "${committed}" != "" ]]; then
        # This var is a string holding every modified or new file after "git add" or "git rm".
        local changedOrNewFiles=`echo "${status}" | grep -iE -e 'new file' -e 'modified'`
        local numOfChangedOrNewFiles=`"${changedOrNewFiles}" 2>&1 | wc -l`
        if [[ "$numOfChangedOrNewFiles" != "" ]]; then
            display+=" +~${numOfChangedOrNewFiles}"
        fi
    fi

    if [[ "${deleted}" != "" ]]; then
        display+=" -${deleted}"
    fi

    # It's possible that none of the above worked (i.e., not in a git repo).
    if [[ "${displayed}" != "" ]]; then
        echo " ${displayed}"
    else
        echo ""
    fi
}

# Retrieve the name of the current branch in git repo.
function gitBranch()
{
    # <branch> is the git branch name according to your current working directory.
    # I have no idea what this sed command is really doing, but it works.
    # Ignore errors by piping fd2 (stderr) to /dev/null with "2> /dev/null".
    local branch=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`

    # If branch is not empty, then current working directory is a git repo.
    # Proceed to parse a "git status" command by calling gitStatusParse().
    if [[ "${branch}" != "" ]]; then
        local status=`gitStatusParse`
        echo "[${branch}${status}]"
    else
        echo ""
    fi
}

function ip() {
    externalIP=`curl -s "http://whatismijnip.nl" | cut -d " " -f 5`
    if [[ "${externalIP}" != "" ]]; then
        echo "<${externalIP}> " # Spacing and brackets for $PS1
    else
        echo ""
    fi
}
export -f ip

# 'col' means 'color'
colEnd="\[\e[0m\]"
colStart1="\[\e[32m\]"
colStart2="\[\e[1;31m\]"
colStart3="\[\e[33m\]"
colStart4="\[\e[36m\]"
colStart5="\[\e[2;30m\]"
colStart6="\[\e[37m\]"

# Surrounding inline evaluations ($() and ``) with '' works in bashrc, not in terminal.
_numDirs='$(ls -1AF | grep / | wc -l)'
_numFiles='$(ls -1AF | grep -v / | wc -l)'
# _numTotalFiles='$( ${lslaVar} | grep -vi "total" | wc -l )'
# _CWDSize='$( ${lslaVar} | head -1 | tr -d "total " )' # Not true size. Not $(du -sh .)
# _CWDSizeActual=' $( timeout 0.2 du -sh . | cut -f 1 )' # Notice the whitespace

# Note that "\n" cannot be variable substituted with $() or ${}
_currentDirectory="\w"
_christopher="\u"
_computerName="\h"
_time="\@"
_date="\d"
_promptChar="\$" # This is the "#" character if you are root, otherwise it's "$".
_getExternalIP=`ip` # note that <ip()> adds its own angle brackets (if you're online)

# Don't add extra newline of no directories in current working directory.
# If no subdirectories in current working directory, list the files.
_directoryVerticalList='$(ls -hAF --color --sort=extension | grep "/" | tr "\n" " " | cut -c 1-232 )'
# head -N specifies the number of files to display. If it extends to a newline,
# try shortening it.
_fileVerticalList='$(ls -1AF --sort=extension | grep -v "/" | tr -d "*" | tr -d "@" | tr "\n" " " | cut -c 1-106 )'

_atIP=" [offline]" # Default to offline unless ${_getExternalIP} is not empty.
if [[ "${_getExternalIP}" != "" ]]; then
    _atIP=" ${colStart5}${_getExternalIP}${colEnd}"
fi
# Begin Git Status-------------------------------------------------------------

# if [[ $( git status 2>&1 ) == *"fatal"* ]]; then
#     _gitInfo=""
# fi

_gitBranch=' $( git status 2> /dev/null | head -1 | sed -e "s/On branch //" )'
# _gitDeleted=' -$( git status 2> /dev/null | grep deleted | wc -l )'

# End Git Status---------------------------------------------------------------

# All information
#export PS1="\
#\n\
#${_directoryVerticalList}\
#\n\
#${colStart6}${_fileVerticalList}${colEnd}\
#\n\
#${colStart1}${_christopher}${colEnd}\
#${_atIP}\
#${colStart2}${_time}${colEnd}\
# ${colStart1}${_date}${colEnd}\
# ${colStart3}[Dirs: ${_numDirs}, Files: ${_numFiles}]${colEnd}\
#${colStart3}${_gitBranch}${colEnd}\
#\n\
#${colStart4}${_currentDirectory}${colEnd}\
#\n\
#${_promptChar} "

# Some information
#export PS1="\
#\n\
#${colStart3}¤${colEnd}\
# ${colStart1}${_christopher}@${_computerName}${colEnd}\
# its ${colStart2}${_time}${colEnd}\
# ${colStart1}${_date}${colEnd}\
# with ${colStart3}[Dirs: ${_numDirs}, Files: ${_numFiles}]${colEnd}\
#${_atIP}\
#\n\
#${colStart4}${_currentDirectory}${colEnd}\
#\n\
#${_promptChar} "

# Least information
export PS1="\
\n\
${colStart3}¤${colEnd}\
 ${colStart3}[Dirs: ${_numDirs}, Files: ${_numFiles}]${colEnd}\
 ${colStart4}${_currentDirectory}${colEnd}\
\n\
${_promptChar} "
