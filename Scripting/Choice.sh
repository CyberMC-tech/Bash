#!/bin/bash

###############################################
#           Created by CyberMC-Tech           #
#   Github: https://github.com/CyberMC-Tech   #
###############################################


########################################################
# Display a menu to the user

choose() {

echo -e "Select an option:\n"
echo "1. <Option 1>"
echo "2. <Option 2>"
echo "3. <Option 3>"
echo "4. <Exit>"


# Read the user's choice
read -p "Enter the number of your choice: " users_choice
choice "$users_choice"

}

#########################################################
# Process the user's choice

choice() {

case $1 in
  1)
    # Code to execute for Option 1
    echo "You selected Option 1"
    ;;
  2)
    # Code to execute for Option 2
    echo "You selected Option 2"
    ;;
  3)
    # Code to execute for Option 3
    echo "You selected Option 3"
    ;;
  4)
    # Exit the script
    echo -e "\nAborting installation..."
    sleep 2
    exit 0
    ;;
  *)
    # * means anything other than what was above
    echo "Invalid choice. Please select a valid option."
    ;;
esac

}

########################################################
# Create a main function to run all your code

main() { 

  # Calling the choose funtion we defined above
  choose

}


# Call the main function
main
