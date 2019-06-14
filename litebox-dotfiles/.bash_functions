# GIVE ME MUSIC NOW
m() {
  if [[ -z ${TMUX+x} ]]; then
    pandora
  else
    tmus -c pandora
  fi
}

restart_camera() {
  sudo killall VDCAssistant
  # printf "TODO\n"
}

# (Jess Frazelle) Make a temporary directory and enter it
tempdir() {
  local dir=

  if [[ "$#" -eq 0 ]]; then
    dir="$(mktemp -d)"
  else
    dir="$(mktemp -d -t "${1}.XXXXXXXXXX")"
  fi

  cd "$dir" || exit
}

# (Jess Frazelle) Compare original and gzipped file size
gz() {
	local origsize
	origsize=$(wc -c < "$1")
	local gzipsize
	gzipsize=$(gzip -c "$1" | wc -c)
	local ratio
	ratio=$(echo "$gzipsize * 100 / $origsize" | bc -l)
	printf "orig: %d bytes\\n" "$origsize"
	printf "gzip: %d bytes (%2.2f%%)\\n" "$gzipsize" "$ratio"
}

# (Jess Frazelle)
# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
tre() {
	tree -aC -I '.git' --dirsfirst "$@" | less -FRNX
}

# [Generated Comment] # Usage: 
repo() {
  sed -i '' 's/# [Generated Comment] # Usage: '
  # https://stackoverflow.com/questions/2423777/is-it-possible-to-create-a-remote-repo-on-github-from-the-cli-without-opening-br/10325316#10325316

  # Import token and verify it exists.
  source ~/.bash_private_stuff
  if [ -z "$GithubPersonalAccessToken" ]; then
    printf "\$GithubPersonalAccessToken does not exist!" 1>&2
    return -1
  fi

  # Idea: Could create README.md given the repo name and description.
  # [ ! -f "README.md" ] && printf "No README.md found.\n"
  # [ ! -f ".gitignore" ] && printf "No .gitignore found.\n"

  printf "Creating Github repository...\n"

  local defaultUsername="$(git config user.name)"
  if [ -z "$defaultUsername" ]; then
    printf "Github username: "
    read username
    [ "$username" = "" ] && new_git_repo
  else
    printf "Github username [$defaultUsername]: "
    read username
    [ -z "$username" ] && username="$defaultUsername"
  fi

  local currentDirNameLowerCase="$(basename "$PWD" | tr '[:upper:]' '[:lower:]')"
  printf "Repository name [$currentDirNameLowerCase]: "
  read repoName
  [ "$repoName" = "" ] && repoName="$currentDirNameLowerCase"

  printf "Repository description: "
  read repoDescription
  [ "$repoDescription" = "" ] && repoDescription=""

  ## Removed License and Gitignore because they cause problems with initial push.

  # printf "License [MIT]: "
  # read repoLicense
  # [ "$repoLicense" = "" ] && repoLicense="MIT"

  # if [ ! -f ".gitignore" ]; then
  #   printf "Language template for .gitignore [Node]: "
  #   read repoGitignoreTemplate
  #   [ "$repoGitignoreTemplate" = "" ] && repoGitignoreTemplate="Node"
  #   if [ "$repoGitignoreTemplate" = "Node" ]; then
  #     if [ ! -f ".gitignore" ]; then
  #       printf "node_modules\n" > .gitignore
  #       # printf -- "- Created .gitignore and added \`node_modules\` entry.\n"
  #     else
  #       printf "\nnode_modules\n" >> .gitignore
  #       # printf -- "- Added \`node_modules\` entry to .gitignore.\n"
  #     fi
  #   fi
  # fi

  printf "Private repository? [False/true]: "
  read repoIsPrivate
  [[ "$repoIsPrivate" != "true" ]] && repoIsPrivate="false"
  printf -- "- Access is %s.\n" $([ "$repoIsPrivate" = "true" ] && printf "Private" || printf "Public")

  # Hit the Github API via cURL to create the repository
  curl --silent --user "$username:$GithubPersonalAccessToken" https://api.github.com/user/repos --data "{ \"name\": \"$repoName\", \"description\": \"${repoDescription}\", \"private\": ${repoIsPrivate}, \"has_wiki\": false, \"has_downloads\": true }" >/dev/null
  # curl --silent --user "$username:$GithubPersonalAccessToken" https://api.github.com/user/repos --data "{ \"name\": \"$repoName\", \"description\": \"${repoDescription}\", \"private\": ${repoIsPrivate}, \"has_wiki\": false, \"license_template\": \"${repoLicense}\", \"has_downloads\": true, \"gitignore_template\": \"${repoGitignoreTemplate}\" }" >/dev/null

  git init >/dev/null
  printf -- "- Initialized new repository.\n"

  git add .
  printf -- "- Added files.\n"

  printf "Commit message [\"first commit\"]: "
  read commitMessage
  [ "$commitMessage" = "" ] && commitMessage="first commit"
  
  git commit -qm "$commitMessage"

  # git remote add origin https://$username@github.com/$username/$repoName.git # HTTPS
  git remote add origin git@github.com:$username/$repoName.git

  printf -- "- Pushing...\n"
  git push -qu origin master
  printf "Done! https://github.com/$username/$repoName"
}

urlencode() {
    # urlencode <string>
    old_lc_collate=$LC_COLLATE
    LC_COLLATE=C
    
    local length="${#1}"
    for (( i = 0; i < length; i++ )); do
        local c="${1:i:1}"
        case $c in
            [a-zA-Z0-9.~_-]) printf "$c" ;;
            *) printf '%%%02X' "'$c" ;;
        esac
    done
    
    LC_COLLATE=$old_lc_collate
}

urldecode() {
    # urldecode <string>

    local url_encoded="${1//+/ }"
    printf '%b' "${url_encoded//%/\\x}"
}

gh() {
  if [ ! -d .git ]; then
    echo "ERROR: Not a git directory"
    return 1
  fi

  local gitUrl="$(git config --get remote.origin.url | sed -e 's/^git@/https:\/\//g' -e 's/com:/com\//g')"
  if [[ $gitUrl != https://github* ]]; then
    echo "ERROR: Remote origin invalid"
    return 1
  fi

  local branchName="$(git branch | grep "*" | awk '{ print $2 }')"
  if [[ "$branchName" = "master" ]]; then
    open $gitUrl
  else
    # echo Going to $gitUrl/tree/"$(urlencode $branchname)"
    # open $gitUrl/tree/"$(urlencode $branchname)"
    open $gitUrl
  fi
}

mcd() {
  mkdir -pv "$1" && cd "$1"
}

# displayAdvice() {
#   # https://stackoverflow.com/questions/11393817/bash-read-lines-in-file-into-an-array
#   IFS=$'\r\n' GLOBIGNORE='*' command eval 'arr=($(cat ~/Main/Bin/pragmatic-programmer.txt))'
#   printf "${arr["$[RANDOM % ${#arr[@]}]"]}"
# }
# displayAdvice

getNewMacAddress() {
  openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'
}

# Pianobar scripts
# Not sure where these should go.
pandoraSongNext() {
  printf "n" >> ~/.config/pianobar/ctl
  printf "Next.\n"
}
pandoraSongLike() {
  printf "+" >> ~/.config/pianobar/ctl
  printf "Gotcha, that'll play more often.\n"
}
pandoraSongDislike() {
  printf "R u srs? [y/N]: "
  read srs
  [ "$srs" = "y" ] && \
    printf "-" >> ~/.config/pianobar/ctl && \
    printf "Gotcha, won't happen again.\n" || \
    printf "Gotcha, action cancelled.\n"
}
pandoraSongTired() {
  printf "R u srs? [y/N]: "
  read srs
  [ "$srs" = "y" ] && \
    printf "t" >> ~/.config/pianobar/ctl && \
    printf "Gotcha, delaying for a month.\n" || \
    printf "Gotcha, action cancelled.\n"
}

wifi_restart() {
  networksetup -setairportpower airport off
  networksetup -setairportpower airport on
}


wifi_join() {
  # http://osxdaily.com/2012/02/28/find-scan-wireless-networks-from-the-command-line-in-mac-os-x/
  printf "Scanning nearby networks...\n"

  local wifiTool="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
  local networksAndAuth="$(wifiTool -s | awk '{ print $1, $7 }' | tail -n +2 | sort --ignore-case --key=1 | uniq)"
  local networks="$(printf "$networksAndAuth" | awk '{ print $1 }')"
  local auths="$(printf "$networksAndAuth" | awk '{ print $2 }')"

  # transform newline-delimited list of networks into string array
  # https://stackoverflow.com/questions/10586153
  IFS='\n' read -r -a array <<< "$networks"

  local len="${#array[@]}"

  printf "$len network(s) found."
  printf "\nSelect a network from the indexes below [0-${len}]:\n"
  
  for index in "${!array[@]}"; do
    local network="${array[index]}"
    printf "${index}) ${network}"
  done

  read chosenIndex

  if [[ "$chosenIndex" -lt 0 || "$chosenIndex" -gt "$len" ]]; then
    printf "You done f*cked up!" 1>&2
    return -1
  fi

  printf "Joining network: ${array[chosenIndex]}"

  if [ "${auths[chosenIndex]}" = "NONE" ]; then
    printf -- "- This network is PUBLIC, be careful. Anyone can view your traffic."
    networksetup -setairportnetwork en0
  else
    printf -- "- This network is PRIVATE, enter password: "
    read password
    networksetup -setairportnetwork en0 "$password"
  fi
}

# https://twitter.com/climagic/status/1057991141801582592
thirdline() {
  awk '{ if (NR % 3 == 0) { print "\033[32m" $0 "\033[0m" } else { print } }'
}

setFlux() {
  # https://apple.stackexchange.com/questions/12719/how-can-i-adjust-the-apparent-color-temperature-of-my-display-in-os-x/12742
  if [[ ! -z "$1" && "$1" -ge 2700 && "$1" -le 6500 ]]; then
    defaults write org.herf.Flux dayColorTemp -int "$1"
    defaults write org.herf.Flux nightColorTemp -int "$1"
    killall Flux
    open /Applications/Flux.app
    defaults write org.herf.Flux dayColorTemp -int "$1"
    defaults write org.herf.Flux nightColorTemp -int "$1"
  else
    printf "Expected a temperature number between 2700 and 6500 (rounded to nearest 100).\n"
  fi
}

devbox() {
  ps xc | grep -i docker &>/dev/null || open /Applications/Docker.app &>/dev/null && printf "\nStarting Docker...\n"

  cd $HOME/Code/Docker/devbox && make run
}

matrix() {
  echo -e "\e[1;40m" ; clear ; while :; do echo $LINES $COLUMNS $(( $RANDOM % $COLUMNS)) $(( $RANDOM % 72 )) ;sleep 0.05; done|awk '{ letters="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#$%^&*()"; c=$4; letter=substr(letters,c,1);a[$3]=0;for (x in a) {o=a[x];a[x]=a[x]+1; printf "\033[%s;%sH\033[0;32m%s",o,x,letter; printf "\033[%s;%sH\033[1;37m%s\033[0;0H",a[x],x,letter;if (a[x] >= $1) { a[x]=0; } }}'
}
