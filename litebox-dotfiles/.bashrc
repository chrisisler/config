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

# lslaVar="ls -oFGHhA" # Can remove H
# lslaVar="ls -AGF"
lslaVar="ls -AGFlh"

mainDir="${HOME}/Main"
academicDir="${mainDir}/Uni"
codeDir="${HOME}/Code"

# START ALIASES ----------------------------------------------------------------------

alias u="cd ${academicDir} && ${lslaVar}"
alias uni="cd ${academicDir} && ${lslaVar}"
alias today="date '+%Y-%m-%d'"
# alias getFiletypes="ls -1F | sed 's/^.*//g' | grep -vE '/$' | tr -d '*' | sort | uniq"
alias g="cd ${HOME}/Code/Git"
# alias tm="ps auxc"
alias gs="git status"
alias q="exit"
# careful of the "*" here in this vim alias.
alias vim="/usr/local/Cellar/vim/*/bin/vim $@"
alias v="vim"
# alias rcconf="vim ~/.config/ranger/rc.conf"
alias safe="md /tmp/safe && cd /tmp/safe && ${lslaVar}"
alias cd..="cd .."
alias ..="cd .. && ${lslaVar}"
alias ...="cd ../.. && ${lslaVar}"
alias ....="cd ../../.. && ${lslaVar}"
alias .....="cd ../../../.. && ${lslaVar}"
alias ......="cd ../../../../.. && ${lslaVar}"
alias hs="vim ${codeDir}/Haskell/Test.hs"
alias test="cd ${codeDir}/Test && vim ./Test.js"
alias cpp="vim ${codeDir}/Cpp/Test.cpp"
alias main="cd ${mainDir} && ${lslaVar}"
alias code="cd ${codeDir} && ${lslaVar}"
alias ed="cd ${codeDir}/Git/erxidesk && ${lslaVar}"
alias e2="cd ${codeDir}/Git/e2 && ${lslaVar}"
alias conf="cd ${codeDir}/Git/config && ${lslaVar}"
alias parse="cd ${codeDir}/Status"
alias get="brew install"
alias remove="brew uninstall"
alias r="ranger"
alias c="clear"
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
alias sbrc="clear && source ~/.bashrc"
alias vrc="vim ~/.vimrc"
alias tmuxconf="vim ~/.tmux.conf"
alias tmuxline="vim ~/.tmux/tmuxline.conf"
alias rangerrc="vim ~/.config/ranger/rc.conf"
alias tmuxtemp="tmux attach -t Temp || tmux new -s Temp"
alias tt="tmuxtemp"
alias t="tmux attach -t All || tmux new -s All"
alias tmus="tmux attach -t Music || tmux new -s Music"
alias weather="curl wttr.in/boston"
# alias xit="exit"
# alias eixt="exit"
# alias spamrandom="cat /dev/urandom | tr -cd '01'"
alias vi="vim"
alias pandora="clear && pianobar 2>/dev/null | tee ~/.config/pianobar/custom-out"
alias cellar="cd /usr/local/Cellar"
alias p="clear; more ./package.json | jq $@"
alias start="open"
alias dir="open ."
alias mainbox="cd /Volumes/Users/Christopher/Desktop/Main"
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias mpv="\\mpv --loop=inf $@ &>/dev/null"
alias mpvfit="\\mpv --loop=inf --autofit-smaller=800x800 --autofit-larger=800x00 $@ &>/dev/null"
alias eject="diskutil unmount $@"
alias chips="cd ${codeDir}/Git/chips && ${lslaVar}"
alias btc="curl -sSL https://coinbase.com/api/v1/prices/historical | head -n 1 | sed \"s|^.*,|$|\" | sed \"s|\(\.[0-9]$\)|\10|\""
alias thesaurus="node ${codeDir}/JS/Bin/thesaurus.js $@"
# alias snakecase="rename 'y/[ _]/-/' $1"
alias tm="ps axcu"
alias clock='watch -t -n1 "date +%T|figlet"'

# END ALIASES -----------------------------------------------------------------

alias github=gh
gh() {
    if [ ! -d .git ]; then
        echo "ERROR: Not a git directory"
        return 1
    fi
    gitUrl="$(git config --get remote.origin.url | sed -e 's/^git@/https:\/\//g' -e 's/com:/com\//g')"
    if [[ $gitUrl != https://github* ]]; then
        echo "ERROR: Remote origin invalid"
        return 1
    fi
    open $gitUrl
}

displayAdvice() {
    # https://stackoverflow.com/questions/11393817/bash-read-lines-in-file-into-an-array
    IFS=$'\r\n' GLOBIGNORE='*' command eval 'arr=($(cat ~/Main/Bin/pragmatic-programmer.txt))'
    printf "${arr["$[RANDOM % ${#arr[@]}]"]}"
}
# displayAdvice

getNewMacAddress() {
    openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'
}

ip() {
    externalIP=`curl -s "http://whatismijnip.nl" | cut -d " " -f 5`
    if [[ "${externalIP}" != "" ]]; then
        echo -n "${externalIP}"
    fi
}

# START PROMPT STRING ----------------------------------------------------------

# Prompt variables.
# _numDirs='$(ls -1AF | grep / | wc -l)'
# _numFiles='$(ls -1AF | grep -v / | wc -l)'
_currentDirectory="\w"
# _christopher="\u"
# _computerName="\h"
# _time="\@"
# _date="\d"
# _promptChar="\$"

# Colors based on solarized dark colorscheme (ethanschoonover.com/solarized).
# base01="\[\e[0;30m\]"
red="\[\e[0;31m\]"
yellow="\[\e[0;32m\]"
orange="\[\e[0;33m\]"
blue="\[\e[0;34m\]"
# magenta="\[\e[0;35m\]"
# cyan="\[\e[0;36m\]"

# base00="\[\e[1;30m\]"
# orangeRed="\[\e[1;31m\]"
# darkGrey="\[\e[1;32m\]"
# mediumGrey="\[\e[1;33m\]"
# lightGrey="\[\e[1;34m\]"
# violet="\[\e[1;35m\]"
# normal="\[\e[1;36m\]"

# white="\[\e[37m\]"
colEnd="\[\e[0m\]"

# source "${codeDir}/Status/git.sh"
# export PS1="\n\
#  ${blue}${_currentDirectory}${colEnd}\
# ${yellow}\$(gitBracketL)${colEnd}\
# ${cyan}\$(gitBranch)${colEnd}\
# ${lightGrey}\$(gitBranchAheadOrBehindOfMaster)${colEnd}\
# ${blue}\$(gitAddedChanges)${colEnd}\
# ${red}\$(gitUnaddedChanges)${colEnd}\
# ${yellow}\$(gitBracketR)${colEnd}\
#  ${magenta}¤${colEnd} "


export PS1="\n ${blue}${_currentDirectory}${colEnd} "
# export PS1="\n ${blue}${_currentDirectory}${colEnd} ${orange}》》≫≫»${colEnd} "

# Do not display CWD if in TMUX (where `#{pane_current_path}` is in tmuxline status).
# customBashPrompt() {
#     isUsingTmux="$(printf "$TERM" | grep -iq "tmux" && printf "Y" || printf "N")"
#     indicator="${orange}»»»${colEnd}"

#     if [[ "${isUsingTmux}" == "Y" ]]; then
#         PS1="\n ${indicator} "
#     else
#         PS1="\n ${blue}${_currentDirectory}${colEnd} ${indicator} "
#     fi
# }
# PROMPT_COMMAND=customBashPrompt

# export PS1="\n ${blue}»»»${colEnd} "
