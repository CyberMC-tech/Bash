#!/bin/bash

PROGRAM="<insert program(s) name(s) here>"


confirm() {
  echo -e "\nYou are about to install ${PROGRAM}."
  sleep 1
  echo -e "\nDo you want to continue?"
  sleep 2
  echo -en "\n[(y)es|(N)o]: "
  read -r response
  check_ans "$response"
}


abort() {
  echo -e "\nAborting installation...\n"
  sleep 2
  exit 1 
}


unknown_response() {
  echo -e "\nInvalid option\n"
  sleep 1
  echo -e "Please enter a vaild response\n"
  sleep 2
  confirm
}


install_program() {
  echo -e "\nInstalling ${PROGRAM}. Please wait..."
    ###### < insert code here > ######
    
}


check_ans() {
  ans=$(echo "${1::1}" | tr "[:upper:]" "[:lower:]")

  if [[ "$ans" == "y" ]]; then 
    install_program
  elif [[ "$ans" == "n" ]] || [[ "$ans" == "" ]]; then 
    abort
  else
    unknown_response
  fi
}

main() {
  confirm
}

main
