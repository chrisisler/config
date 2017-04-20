# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Use case-insensitive filename globbing
shopt -s nocaseglob

# Make bash append rather than overwrite the history on disk
shopt -s histappend

# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
shopt -s cdspell

# Don't put duplicate lines in the history.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups

# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well

export EDITOR="vim"

lslaVar="ls -oFGHhA" # Can remove H

mainDir="~/Main"
academDir="${mainDir}/Academic"
codeDir="${mainDir}/Code"

# START ALIASES ----------------------------------------------------------------------

alias gs="git status"
alias q="exit"
alias t="tmuxall"
alias v="vim"
alias clock="tty-clock -Sc"
alias rcconf="vim ~/.config/ranger/rc.conf"
alias safe="cd /tmp/safe"
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias ramda="vim ${codeDir}/JS/Ramda/Test/index.js"
alias ramdatest="vim ${codeDir}/JS/Ramda/Test/test/index.js"
alias test="vim ${codeDir}/JS/Test.js"
alias main="cd ${mainDir} && ${lslaVar}"
alias acad="cd ${academDir} && ${lslaVar}"
alias code="cd ${codeDir} && ${lslaVar}"
alias config="cd ${codeDir}/Git/config && ${lslaVar}"
alias conf="cd ~/Main/Code/Git/config/ && ${lslaVar}"
alias parse="cd ${codeDir}/Status"
alias get="brew install"
alias remove="brew uninstall"
alias r="ranger"
alias c="clear"
alias lsla="ls -la"
alias l="${lslaVar}"
alias cl="clear && ${lslaVar}"
alias lc="clear && ${lslaVar}"
alias md="mkdir -pv"
alias rmi="rm -irv"
alias rmf="rm -frv"
alias rm="rm -rv"
alias mv="mv -iv"
alias tree="tree -I *node_modules*"
alias brc="vim ~/.bashrc"
alias sbrc="source ~/.bashrc && clear"
alias vrc="vim ~/.vimrc"
alias tmuxconf="vim ~/.tmux.conf"
alias tmuxline="vim ~/.tmux/tmuxline.conf"
alias rangerrc="vim ~/.config/ranger/rc.conf"
alias tmuxtemp="tmux attach -t Temp || tmux new -s Temp"
alias tmuxall="tmux attach -t All || tmux new -s All"
alias tmuxmain="tmux attach -t Main || tmux new -s Main"
alias tmuxmusic="tmux attach -t Music || tmux new -s Music"
alias weather="curl wttr.in/boston"
alias xit="exit"
alias eixt="exit"
alias cpan="control panel"
alias spamrandom="cat /dev/urandom | tr -cd '01'"
alias vim="/usr/local/Cellar/vim/8.*/bin/vim $@"
alias vi="vim"
alias pandora="pianobar 2>/dev/null | tee ~/.config/pianobar/custom-out"
alias cellar="cd /usr/local/Cellar"
alias p="clear; more ./package.json | jq"
alias start="open"
alias dir="open ."
alias pdf="node ${codeDir}Bin/pdf/index.js"
alias mainbox="cd /Volumes/Users/Christopher/Desktop/Main"
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias mpv="\\mpv --loop=inf $@ &>/dev/null"
alias mpvfit="\\mpv --loop=inf --autofit-smaller=800x800 --autofit-larger=800x00 $@ &>/dev/null"
alias eject="diskutil unmount $@"
alias chips="cd ~/Main/Code/Git/chips && ${lslaVar}"
alias btc="curl -sSL https://coinbase.com/api/v1/prices/historical | head -n 1 | sed \"s|^.*,|$|\" | sed \"s|\(\.[0-9]$\)|\10|\""
alias thesaurus="node ~/Main/Code/JS/Bin/thesaurus.js $@"

# END ALIASES -----------------------------------------------------------------


# START FUNCTION ALIASES ------------------------------------------------------


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

source "${HOME}/Main/Code/Status/git.sh"
export PS1="\
\n\
${white}¤${colEnd}\
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
# ${cyan}${_promptChar}${colEnd} "

# export PS1="\n${white}${_promptChar}${colEnd} "

