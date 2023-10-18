#!/bin/bash

###############################################
#           Created by CyberMC-Tech           #
#   Github: https://github.com/CyberMC-Tech   #
###############################################


######################################################################################
# Colors that can be used in scripts


bold=$(echo -en "\e[1m")
export bold
underline=$(echo -en "\e[4m")
export underline 
dim=$(echo -en "\e[2m")
export dim 
strickthrough=$(echo -en "\e[9m")
export strickthrough
blink=$(echo -en "\e[5m")
export blink
reverse=$(echo -en "\e[7m")
export reverse
hidden=$(echo -en "\e[8m")
export hidden
normal=$(echo -en "\e[0m")
export normal
black=$(echo -en "\e[30m")
export black
red=$(echo -en "\e[31m")
export red
green=$(echo -en "\e[32m")
export green
orange=$(echo -en "\e[33m")
export orange
blue=$(echo -en "\e[34m")
export blue 
purple=$(echo -en "\e[35m")
export purple
aqua=$(echo -en "\e[36m")
export aqua 
gray=$(echo -en "\e[37m")
export gray
darkgray=$(echo -en "\e[90m")
export darkgray
lightred=$(echo -en "\e[91m")
export lightred
lightgreen=$(echo -en "\e[92m")
export lightgreen
lightyellow=$(echo -en "\e[93m")
export lightyellow
lightblue=$(echo -en "\e[94m")
export lightblue
lightpurple=$(echo -en "\e[95m")
export lightpurple
lightaqua=$(echo -en "\e[96m")
export lightaqua
white=$(echo -en "\e[97m")
export white
default=$(echo -en "\e[39m")
export default
BLACK=$(echo -en "\e[40m")
export BLACK
RED=$(echo -en "\e[41m")
export RED
GREEN=$(echo -en "\e[42m")
export GREEN
ORANGE=$(echo -en "\e[43m")
export ORANGE
BLUE=$(echo -en "\e[44m")
export BLUE
PURPLE=$(echo -en "\e[45m")
export PURPLE
AQUA=$(echo -en "\e[46m")
export AQUA
GRAY=$(echo -en "\e[47m")
export GRAY
DARKGRAY=$(echo -en "\e[100m")
export DARKGRAY
LIGHTRED=$(echo -en "\e[101m")
export LIGHTRED
LIGHTGREEN=$(echo -en "\e[102m")
export LIGHTGREEN
LIGHTYELLOW=$(echo -en "\e[103m")
export LIGHTYELLOW
LIGHTBLUE=$(echo -en "\e[104m")
export LIGHTBLUE
LIGHTPURPLE=$(echo -en "\e[105m")
export LIGHTPURPLE
LIGHTAQUA=$(echo -en "\e[106m")
export LIGHTAQUA
WHITE=$(echo -en "\e[107m")
export WHITE
DEFAULT=$(echo -en "\e[49m")
export DEFAULT

#######################################################################################################
# Creating help function

help() {
  echo "Usage: note [OPTION=] "
  echo "Options:"
  echo "  "
}

if [ -z :


new_note() {
#######################################################################################################
# Variable Checking and setup
  
  #Checks if variable is set. errors out if not.
#!/usr/bin/env bash

set -Eeuo pipefail

# Define variables
readonly dir="$(dirname "$0")" 

# Usage or Help message
usage() {
  cat <<EOF >&2
Usage: $(basename "$0") OPTION...
Description:

Options:
  -v  Verbose
EOF
  exit 1
}

# Parse options
verbose=""
id=""
debug=
while getopts h?v:id OPT; do
  case "${OPT}" in
    h|\?)
        usage
        exit 0 ;;
    v) verbose="${OPTARG}" ;;
    i) id="${OPTARG}" ;;
    d) debug=true ;;
    *) usage ;;
  esac
done

# Define function
func1() {
# check params, size, null and exit 1 when needed

# logic for-loop
  for projectName in "${projectNames[@]}"  # array len, both ${#array[*]} and ${#array[@]} ok
  # more array ${array[@]:position:length}, unset array
do
  func2 $projectName 
  # test experessions, most common, for file(-a, -e, -d, -s) , string (-n, -z), int(-eq, -lt), expr, [[ ]]
  if [ "$verbose" = "1" ]; then  
  # elif commands; then
    echo -n . 1>&2
  else 
    echo "xx"
  fi
done

# read files
# read -t timeout, -p prompt -a array, -n number of characters, -e auto completion, -d,  -s hide, etc.
# while also support test expr
  while IFS= read -r -d '' FILE  # IFS default is space(" "), IFS=":" to change it. 
do
    case $FILE in
        * ) FILENAME=$(basename "$FILE")
            echo "processing file: $FILENAME "
            # handle file
            ;;
    esac
done < <(find "$DIRECTORY" -type f -name "*.yaml" -print0)

}

# Verify options len
if [ $# -lt 1 ]; then
  usage()
fi

# Invoke cmd directly
projectNames=$(gcloud projects list | grep name | cut -d' ' -f2)

# Call logic 
func1 id projectNames

# verify func1 result
if [ "$?" = "1" ]; then
  echo "func1 failed"
  exit 1
fi

# Next


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
  local PREFIX
  FORMAT_DATE="${orange}DATE: $(date | awk '{print $2, $3, $7}' | sed 's/ /-/g')"
  local FORMAT_DATE

  if [ $# -eq 0 ]; then
    echo -e "\nEnter your note, type 'EOF' on a new line when done\n"
    user_note=""
    while IFS= read -r line; do
      if [ "$line" == "EOF" ]; then
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
    echo -e "\nYou don't have any notes. Use the note command to create some!!\n"
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
  notes | grep $@
}
 

