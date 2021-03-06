################################################################################
# Misc #########################################################################
################################################################################

# If not running interactively, don't do anything
# [[ "$-" != *i* ]] && return
case $- in
  *i*) ;;
  *) return;;
esac

# Use case-insensitive filename globbing
shopt -s nocaseglob

# Make bash append rather than overwrite the history on disk
shopt -s histappend

# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
shopt -s cdspell

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# # https://unix.stackexchange.com/questions/55203
bind "TAB:menu-complete"
bind "set show-all-if-ambiguous on"
# bind "set menu-complete-display-prefix on"

################################################################################
# Exports ######################################################################
################################################################################

# Prepend datetime of command to command itself in ~/.bash_history file
export HISTTIMEFORMAT="%y-%m-%d %T "

# history length
HISTSIZE=1000
HISTFILESIZE=2000

# Always remove previously installed software when updating said software
# export HOMEBREW_UPGRADE_CLEANUP=1
export HOMEBREW_INSTALL_CLEANUP=1

# Don't put duplicate lines in the history.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups

# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well

export EDITOR="/usr/local/Cellar/vim/*/bin/vim"

# Add sqlite to path
export PATH="/usr/local/opt/sqlite/bin:$PATH"

export MAIL="$HOME/Mail/4444cisler4444"

# Prefer /usr/local/bin/ binaries over /usr/bin/ binaries.
export PATH="/usr/local/bin:$PATH"

# Cleanse
export PATH="$(echo "$PATH" | tr ":" "\n" | sort | uniq | tr "\n" ":")"

################################################################################
# Sources ######################################################################
################################################################################

source ~/.bash_profile

# Custom
source ~/.bash_functions
# source ~/.bash_aliases

if [ -f ~/.bash_private_stuff ]; then
  source ~/.bash_private_stuff
fi

################################################################################
# Variables ####################################################################
################################################################################

# lslaVar="ls -oFGHhA" # Can remove H
# lslaVar="ls -AGF"
# lslaVar="ls -AGFlh"
lslaVar="exa --all --long --header --git --group-directories-first --colour-scale"
mainDir="${HOME}/Main"
academicDir="${mainDir}/Uni"
codeDir="${HOME}/Code"

################################################################################
# Aliases ######################################################################
################################################################################

alias arc="$EDITOR $HOME/.config/alacritty/alacritty.yml"
alias commits="git reflog | head - 20"
alias mplay2='mplayer -loop 0 -really-quiet -lavdopts fast:threads=16 -ao NONE -vo caca "$1"'
alias mplay='mplayer -slices -loop 0 -really-quiet -lavdopts fast:threads=16 -ao coreaudio -vo caca "$1"'
alias cs="cd $HOME/Main/Uni/CS-450 && $lslaVar"
alias stats='glances --fahrenheit --disable-check-update --process-short-name'
alias nobrave='killall -9 "Brave Browser Beta"'
alias text="node $HOME/Code/JS/Bin/text-cli/index.js"
alias nocamera='sudo killall VDCAssistant ; echo "Cool. Now do $ sudo reboot"'
alias nocmus='kill -9 "$(pgrep cmus)"'
alias volume-0.001='osascript -e "set Volume 0.001"'
alias volume-0.01='osascript -e "set Volume 0.01"'
alias volume-0.1='osascript -e "set Volume 0.1"'
alias mute='osascript -e "set Volume 0"'
# alias map="telnet mapscii.me"
alias cat="bat"
alias nodocker='killall -9 Docker'
alias dockerd='open /Applications/Docker.app "$@"'
alias docker-clean-images="docker images -a | grep \"<none>\" | awk '{ print \$3 }' | xargs docker rmi -f 2>/dev/null"
alias wifi="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport \"$@\""
alias ll="exa --all --header --git --group-directories-first"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias weeconf="${EDITOR} ~/.weechat/weechat.conf"
alias irc="weechat"
alias status="cd ${codeDir}/Status && ${lslaVar}"
alias desk="cd ~/Desktop"
alias back="cd -"
alias discreet="$@ ; history -d $(history 1)"
alias clean='killall -9 JavaUpdater iTunesHelper'
alias sandbox="cd ${codeDir}/JS/Bin/Sandbox/ && ${EDITOR} ./sandbox.js"
alias datefmt='date "+%Y-%m-%d_%H:%M"'
alias brew-latest="brew update && brew upgrade --fetch-HEAD && brew cleanup -s"
alias w="cd ${codeDir}/Git/wavematch && ${lslaVar}"
alias dc="cd"
alias pipes="pipes.sh -p 10 -R -t 6"
alias brave='open "/Applications/Brave Browser Beta.app" "$@"'
alias browser="brave"
alias babel-repl="browser https://babeljs.io/repl"
alias path="echo $PATH | tr ':' '\n'"
alias tkill="tmux kill-pane -t $@"
alias downloads="cd ~/Downloads && ${lslaVar} | head -30"
alias uni="cd ${academicDir} && ${lslaVar}"
alias g="cd ${HOME}/Code/Git"
alias tm="clear ; ps xc | awk '{ print \$1, \$5 }' | sed 1d | sort -fk 2 | column -t | column"
alias gs="git status"
alias bad="cd ~/Main/Bin/Bad && ${lslaVar}"
alias q="exit"
alias vim="/usr/local/Cellar/vim/*/bin/vim $@"
alias v="vim"
# alias rcconf="${EDITOR} ~/.config/ranger/rc.conf"
alias safe="md /tmp/safe && cd /tmp/safe && ${lslaVar}"
alias cd..="cd .."
alias ..="cd .. && ${lslaVar}"
alias ...="cd ../.. && ${lslaVar}"
alias ....="cd ../../.. && ${lslaVar}"
alias .....="cd ../../../.. && ${lslaVar}"
alias ......="cd ../../../../.. && ${lslaVar}"
alias test="cd ${codeDir}/Test && ${EDITOR} ./Test.js"
alias main="cd ${mainDir} && ${lslaVar}"
alias conf="cd ${codeDir}/Git/config && ${lslaVar}"
alias parse="cd ${codeDir}/Status && ${lslaVar}"
alias r="ranger"
alias c="clear"
alias l="${lslaVar}"
alias tree="${lslaVar} --tree"
alias lt="${lslaVar} --tree"
alias cl="clear && ${lslaVar}"
alias lc="clear && ${lslaVar}"
alias ct="clear && tree"
alias md="mkdir -pv"
alias rm="safe-rm"
alias rmi="rm -irv"
alias rmf="rm -frv"
alias rm="rm -rv"
alias mv="mv -iv"
alias cvimrc="${EDITOR} ~/.cvimrc"
alias brc="${EDITOR} ~/.bashrc"
alias sbrc="clear && source ~/.bashrc"
alias vrc="${EDITOR} ~/.vimrc"
alias tmuxconf="${EDITOR} ~/.tmux.conf"
alias tmuxline="${EDITOR} ~/.tmux/tmuxline.conf"
alias rangerrc="${EDITOR} ~/.config/ranger/rc.conf"
alias tmuxtemp="clear ; tmux attach -t Temp $* &>/dev/null || tmux new -s Temp $*"
alias tt="tmuxtemp"
alias t="clear ; tmux attach -t All $@ &>/dev/null || tmux new -s All $@"
alias tmus="clear ; tmux attach -t Music &>/dev/null || tmux new -s Music -c ~"
alias weather="curl wttr.in/boston"
alias vi="vim"
# alias pandora="> ~/.config/pianobar/custom-out ; clear ; pianobar 2>/dev/null | tee ~/.config/pianobar/custom-out"
alias pandora='> ~/.config/pianobar/custom-out ; clear ; pianobar | tee ~/.config/pianobar/custom-out'
alias cellar="cd /usr/local/Cellar"
alias p="clear; more ./package.json | jq $@"
alias dir="open ."
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias lokc="lock"
alias lcok="lock"
alias lk="lock"
alias eject="diskutil unmount $@"
alias chips="cd ${codeDir}/Git/chips && ${lslaVar}"
alias btc="curl -sSL https://coinbase.com/api/v1/prices/historical | head -n 1 | sed \"s|^.*,|$|\" | sed \"s|\(\.[0-9]$\)|\10|\""
alias clock='watch -t -n1 "date +%T|figlet"'
# alias e2="cd ${codeDir}/Git/e2 && ${lslaVar}"
# alias tree="tree -I *node_modules*"
# alias mainbox="cd /Volumes/Users/Christopher/Desktop/Main"
# alias mpv="\\mpv --loop=inf $@ &>/dev/null"
# alias mpvfit="\\mpv --loop=inf --autofit-smaller=800x800 --autofit-larger=800x00 $@ &>/dev/null"
# alias thesaurus="node ${codeDir}/JS/Bin/thesaurus.js $@"
# alias snakecase="rename 'y/[ _]/-/' $1"
# alias song="~/Code/Status/cmus.sh || ~/Code/Status/pianobar.sh"
# alias ll="ls -AGFh | column" # exclude details then compact
# alias ssherxi='ssh -i ~/.ssh/id_rsa_alex erxi@jess.coffee'
# alias doing="printf ${@} > ~/Code/Status/what-am-i-doing.txt"
# alias nochrome="killall -9 Google\ Chrome"
# alias today="date '+%Y-%m-%d'"
# alias getFiletypes="ls -1F | sed 's/^.*//g' | grep -vE '/$' | tr -d '*' | sort | uniq"
# alias spamrandom="cat /dev/urandom | tr -cd '01'"


################################################################################
# Prompt #######################################################################
################################################################################

dir="\w"
time24h="\A"

# ${orange}¤${reset} "

# if [[ -z "$TMUX" ]]; then
# fi

color="\[\e[0;35m\]"
reset="\[\e[0m\]"
export PS1="\n${color}${dir}${reset} "
# export PS1="\n${blueBg} ${dir} ${blue}${reset} "
# export PS1="\n${blue}[${reset}${time24h}${blue}] ${cyan}${dir}${reset} "
# export PS1="\n${time24h} ${cyan}${dir}${reset} "

# https://github.com/ryanoasis/powerline-extra-symbols

# save:
# export PS1="\n${red}${dir}${reset} ${orange}»»${reset} "

# exec fish
