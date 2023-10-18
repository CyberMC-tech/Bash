#!/bin/bash


gpt() {
    source /opt/open-interpreter/open-interpreter/bin/activate && \
    interpreter -y
}

_c_cd() {
    cd "$@" || return "$?"

    if [ "$_ZO_ECHO" = "1" ]; then
        echo "$PWD"
    fi
}


c() {
    if [ "$#" -eq 0 ]; then
        _c_cd ~
    elif [ "$#" -eq 1 ] && [ "$1" = '-' ]; then
        if [ -n "$OLDPWD" ]; then
            _c_cd "$OLDPWD"
        else
            echo 'zoxide: $OLDPWD is not set'
            return 1
        fi
    else
        _query="$(zoxide query -- "$@")" && _c_cd "$_query" &&
        lsd --group-directories-first --icon=always --color=always 
    fi
}


new_note() {
#######################################################################################################
# Variable Checking and setup
  
  #Checks if variable is set. errors out if not.
  : "${NOTE_NUM_DIR:?${lightred}${bold}ERROR: ${normal}Environment variable is unset. Set it and try again}"
  : "${MY_NOTES:?${lightred}${bold}ERROR: ${normal}Environment variable is not set. Set it and Try again.}"

  # Creates the file if doesn't exist
  if [ ! -e "$NOTE_NUM_DIR" ]; then
    echo "1" > "$NOTE_NUM_DIR"
  fi

  NOTE_NUM=$(cat ${NOTE_NUM_DIR})

  # creates the MY_NOTES file if it doesn't exist
  if [ ! -e "$MY_NOTES" ]; then
    touch "$MY_NOTES"
  fi

########################################################################################################
# Local variables

  PREFIX="${lightpurple}Note ${NOTE_NUM}${normal}"

  FORMAT_DATE="${orange}DATE: $(date | awk '{print $2, $3, $7}' | sed 's/ /-/g')"

 
  if [ $# -eq 0 ]; then
    echo -e "\nEnter your note, type 'EOFFOE' on a new line when done\n"
    user_note=""
    while IFS= read -r line; do
      if [ "$line" == "EOFFOE" ]; then
        break
      else
        user_note="${user_note}${line}\n"
      fi
    done
  else
    user_note="$@" 
  fi
# #######################################################################################################
# Echo your note into your note folder

  echo -e "
${PREFIX}                                                                                        ${FORMAT_DATE}
${lightblue}----------------------------------------------------------------------------------------------------------------
${normal}\n${user_note}\n" >> "${MY_NOTES:?${lightred}${bold}ERROR: ${normal}Environment variable is not set. Set it and Try again.}"

########################################################################################################
# export the new number plus add it to file for persistence 

  echo "$((NOTE_NUM + 1))" > "$NOTE_NUM_DIR"
  user_note=""
########################################################################################################
}


notes() {
  if [ ! -e "$MY_NOTES" ]; then
    if [ -z "$MY_NOTES" ]; then
      echo -e "\n${lightred}${bold}ERROR: ${normal}MY_NOTES variable is unset please set it and try again.\n"
    else
      echo -e "\n${lightred}${bold}ERROR: ${normal}There is no file located at ${MY_NOTES}. You can run the note command to create it.\n"
    fi
  elif [ "$(cat "$MY_NOTES")" = "" ]; then
    echo "\nYou don't have any notes. Use the note command to create some!!\n"
  else
    cat "$MY_NOTES"
  fi
}
  

clear_notes() {
  echo -e "\n${red}${blink}Warning! ${normal}This will clear all your notes.\n"
  read -p "Are you sure you want to continue? (yes|No): " choice
  choice="$(echo "${choice::1}" | tr '[:upper:]' '[:lower:]')"
  if [[ "$choice" == "y" ]]; then 
    echo -e "\nCleearning notes..."
    sleep 1
    echo "" > "${MY_NOTES:?${lightred}${bold}ERROR: ${normal}Environment varible is not set. Set it and try again.}" && 
    echo "1" > "${NOTE_NUM_DIR:?${lightred}${bold}ERROR: ${normal}Environment variable is not set. Set it and try again.}" && 
    echo -e "\nNotes were successfully Cleared\n"
  elif [[ "$choice" = "n" ]] || [[ "$choice" = "" ]]; then
    echo -e "\nYour notes were not cleared.\n"
  else
    echo -e "\nPlease select a valid answer"
    clear_notes
  fi
} 


search_notes(){
  notes | fzf
}
  
# search and install one or more "use tab to select" packages using nala
nalafzf() {
  sudo nala install $(apt list | cut --delimiter="/" --fields=1 | fzf --reverse --multi --preview="nala show {}")
}

# This function will remove all "Exited" docker containers
docker_purge() {
  docker ps -a | grep Exited | awk '{print $1}' | sed 's/^/docker rm /g' | bash
}

# 
search() {
  search_term="$*"
  firefox --search "$search_term" &
}

youporn() {
  firefox https://www.youporn.com &
}

cht() {
  curl "cht.sh/$*"
}

bdaddy() {
  firefox https://www.pornhub.com/model/braydaddy33/videos &
}

# youtube() {
# }
