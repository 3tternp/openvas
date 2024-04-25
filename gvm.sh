#!/bin/bash

# Function to install GVM
install_gvm() {
  echo -e "\033[32mInstalling GVM...\033[39m"
  sudo apt install openvas -y
  sudo gvm-setup
  sudo gvm-check-setup || { echo -e "\033[31mGVM setup incomplete. Check for errors.\033[39m"; exit 1; }
  sudo runuser -u _gvm -- gvm-manage-certs -a -f
  sudo gvm-start
  echo -e "\033[32mGVM installation completed.\033[39m"
}

# Function to update GVM feeds
update_feeds() {
  echo -e "\033[32mUpdating GVM feeds...\033[39m"
  sudo greenbone-feed-sync || { echo -e "\033[31mFeed update failed. Check for errors.\033[39m"; exit 1; }
  echo -e "\033[32mGVM feeds updated.\033[39m"
}

# Main menu loop
while true; do
  echo -e "\n\033[36mChoose the operation you want to perform:\033[39m"
  echo "1. Install GVM"
  echo "2. Update Feeds"
  echo "3. Exit"

  read -p "Enter your choice: " choice

  case $choice in
    1) install_gvm ;;
    2) update_feeds ;;
    3) exit 0 ;;
    *) echo -e "\033[31mInvalid selection. Please try again.\033[39m" ;;
  esac
done
