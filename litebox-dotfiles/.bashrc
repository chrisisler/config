# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Use case-insensitive filename globbing
shopt -s nocaseglob

# Make bash append rather than overwrite the history on disk
shopt -s histappend

# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
shopt -s cdspell

# # https://unix.stackexchange.com/questions/55203
bind "TAB:menu-complete"
bind "set show-all-if-ambiguous on"
# bind "set menu-complete-display-prefix on"

# export LS_COLORS="di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90"

# Prepend datetime of command to command itself in ~/.bash_history file
export HISTTIMEFORMAT="%y-%m-%d %T "

# Always remove previously installed software when updating said software
export HOMEBREW_UPGRADE_CLEANUP=1

# Don't put duplicate lines in the history.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups

export TS_APP_CONSUMER_KEY="EZ6lPwbHp7Tuxr0YhRZjkNoUu"
export TS_APP_CONSUMER_SECRET="sAdt3fGzG3sYRzVgxWrYkmBpa61MCxHL9oJpCnAVqWKfxyZbQb"
export TS_APP_ACCESS_TOKEN="974700047517528065-4kRKjSnoQWwGmwwp6xjryu4ftNmVBIW"
export TS_APP_ACCESS_TOKEN_SECRET="laGLMr6ZylfXhHoljmlzLMU6bHweVENaerhOiADmP73mP"
export openWeatherMapAPIKey="619a668af9d55d2377325ce0e407d9bc"

# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well

export EDITOR="vim"

source ~/.bash_profile

export PATH="/usr/local/opt/sqlite/bin:$PATH"

# add yarn(pkg) to PATH
# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
# export PATH="$HOME/.cargo/bin:$PATH"

# lslaVar="ls -oFGHhA" # Can remove H
# lslaVar="ls -AGF"
# lslaVar="ls -AGFlh"
lslaVar="exa --all --long --header --git --group-directories-first"

mainDir="${HOME}/Main"
academicDir="${mainDir}/Uni"
codeDir="${HOME}/Code"

# START ALIASES ----------------------------------------------------------------------

alias status="cd ${codeDir}/Status && ${lslaVar}"
alias desk="cd ~/Desktop"
alias back="cd -"
alias song="~/Code/Status/cmus.sh || ~/Code/Status/pianobar.sh"
alias goodnight="lock"
alias discreet="$@ ; history -d $(history 1)"
alias babel="open /Volumes/Macintosh\ HD/Applications/Google\ Chrome.app https://babeljs.io/repl"
alias js="cd ${codeDir}/JS/Bin && ${lslaVar}"
alias clean='killall -9 JavaUpdater iTunesHelper'
alias sandbox="cd ${codeDir}/JS/Bin/Sandbox/ && vim ./sandbox.js"
alias cs='cd'
alias datefmt='date "+%Y-%m-%d_%H:%M"'
alias brew-latest="brew update && brew upgrade --cleanup --fetch-HEAD && brew cleanup -s"
# alias ll="ls -AGFh | column" # exclude details then compact
alias ll="exa --all --header --git --group-directories-first"
alias w="cd ${codeDir}/Git/wavematch && ${lslaVar}"
alias ssherxi='ssh -i ~/.ssh/id_rsa_alex erxi@jess.coffee'
# alias doing="printf ${@} > ~/Code/Status/what-am-i-doing.txt"
alias mute='osascript -e "set Volume 0"'
alias dc="cd"
alias pipes="pipes.sh -p 10 -R -t 6"
alias browser="open /Applications/Brave-Browser-Dev.app"
# alias chrome="open /Volumes/Macintosh\ HD/Applications/Google\ Chrome.app $@"
# alias nochrome="killall -9 Google\ Chrome"
# alias path="echo $PATH | tr ':' '\n'"
alias tkill="tmux kill-pane -t $@"
alias rsync="/usr/local/Cellar/rsync/3.1.3_1/bin/rsync"
alias u="cd ${academicDir} && ${lslaVar}"
alias downloads="cd ~/Downloads && ${lslaVar}"
alias uni="cd ${academicDir} && ${lslaVar}"
alias today="date '+%Y-%m-%d'"
# alias getFiletypes="ls -1F | sed 's/^.*//g' | grep -vE '/$' | tr -d '*' | sort | uniq"
alias g="cd ${HOME}/Code/Git"
alias tm="clear ; ps xc | awk '{ print \$1, \$5 }' | sed 1d | sort -fk 2 | column -t | column"
alias gs="git status"
alias bad="cd ~/Main/Bin/Bad && ${lslaVar}"
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
alias ed="cd ${codeDir}/Git/erxidesk && ${lslaVar}"
alias e2="cd ${codeDir}/Git/e2 && ${lslaVar}"
alias conf="cd ${codeDir}/Git/config && ${lslaVar}"
alias parse="cd ${codeDir}/Status && ${lslaVar}"
alias get="brew install"
alias remove="brew uninstall"
alias r="ranger"
alias c="clear"
alias l="${lslaVar}"
alias tree="${lslaVar} --tree"
alias lt="${lslaVar} --tree"
# alias tree="tree -I *node_modules*"
alias cl="clear && ${lslaVar}"
alias lc="clear && ${lslaVar}"
alias ct="clear && tree"
alias md="mkdir -pv"
alias rm="safe-rm"
alias rmi="rm -irv"
alias rmf="rm -frv"
alias rm="rm -rv"
alias mv="mv -iv"
alias brc="vim ~/.bashrc"
alias sbrc="clear && source ~/.bashrc"
alias vrc="vim ~/.vimrc"
alias tmuxconf="vim ~/.tmux.conf"
alias tmuxline="vim ~/.tmux/tmuxline.conf"
alias rangerrc="vim ~/.config/ranger/rc.conf"
alias tmuxtemp="clear ; tmux attach -t Temp $@ &>/dev/null || tmux new -s Temp $@"
alias tt="tmuxtemp"
alias t="clear ; tmux attach -t All $@ &>/dev/null || tmux new -s All $@"
alias tmus="clear ; tmux attach -t Music &>/dev/null || tmux new -s Music -c ~"
alias weather="curl wttr.in/boston"
# alias spamrandom="cat /dev/urandom | tr -cd '01'"
alias vi="vim"
alias pandora="echo \"\" > ~/.config/pianobar/custom-out && clear && pianobar 2>/dev/null | tee ~/.config/pianobar/custom-out"
alias cellar="cd /usr/local/Cellar"
alias p="clear; more ./package.json | jq $@"
alias start="open"
alias dir="open ."
alias mainbox="cd /Volumes/Users/Christopher/Desktop/Main"
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias lokc="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias lcok="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
# alias mpv="\\mpv --loop=inf $@ &>/dev/null"
# alias mpvfit="\\mpv --loop=inf --autofit-smaller=800x800 --autofit-larger=800x00 $@ &>/dev/null"
alias eject="diskutil unmount $@"
alias chips="cd ${codeDir}/Git/chips && ${lslaVar}"
alias btc="curl -sSL https://coinbase.com/api/v1/prices/historical | head -n 1 | sed \"s|^.*,|$|\" | sed \"s|\(\.[0-9]$\)|\10|\""
alias thesaurus="node ${codeDir}/JS/Bin/thesaurus.js $@"
# alias snakecase="rename 'y/[ _]/-/' $1"
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

mcd() {
  mkdir -pv "$1" && cd "$1"
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

## Colors
# red() {
#   printf "%s%s%s" "\033[1;31m" $1 "\033[0m"
# }
# green() {
#   printf "%s%s%s" "\033[1;32m" $1 "\033[0m"
# }
# blue() {
#   printf "%s%s%s" "\033[1;34m" $1 "\033[0m"
# }

# START PROMPT STRING ----------------------------------------------------------

_currentDirectory="\w"

# ${orange}¤${colEnd} "

# if [[ -z "$TMUX" ]]; then
# else
# fi

# red="\[\e[0;31m\]"
# yellow="\[\e[0;32m\]"
# magenta="\[\e[0;35m\]"
cyan="\[\e[0;36m\]"
# blueBg="\[\e[0;30;44m\]" # bg
# blue="\[\e[0;34m\]"
colEnd="\[\e[0m\]"
# export PS1="\n${blueBg} ${_currentDirectory} ${blue}${colEnd} "
export PS1="\n${cyan}${_currentDirectory}${colEnd} "

# https://github.com/ryanoasis/powerline-extra-symbols

# save
# export PS1="\n${red}${_currentDirectory}${colEnd} ${orange}»»${colEnd} "
