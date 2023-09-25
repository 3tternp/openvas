#!/bin/bash

# Display the menu
while true; do
    
  echo -e "\033[36m"
  echo -e "Choose the operation you want to perform:"
  echo -e "\033[31m"
  echo -e "1. Install GVM"
  echo -e "\033[32m"
  echo -e "2. Update Feeds"
  echo -e "\033[33m"
  echo -e "3. Exit"
  echo -e "\033[39m"

  read count

  if [ "$count" -eq 1 ]; then
    # Install GVM
    sudo apt install openvas -y
    sudo gvm-setup
    sudo gvm-check-setup
    sudo runuser -u _gvm -- gvm-manage-certs -a -f
    sudo gvm-start

  elif [ "$count" -eq 2 ]; then
    # Update GVM feeds
    sudo greenbone-feed-sync

  elif [ "$count" -eq 3 ]; then
    # Exit the script
    exit 0

  else
    # Invalid selection
    echo -e "\033[30m"
    echo -e "Invalid selection. Please try again."
    echo -e "\033[39m"
  fi

  # Reset the background color
  echo -e "\033[49m"
done

# Check if GVM is running
if [[ ! $(ps -ef | grep gvm | grep -v grep) ]]; then
  echo -e "\033[30m"
  echo -e "GVM is not running. Please start GVM before exiting."
  echo -e "\033[39m"
fi

exit 0
