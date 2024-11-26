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
  echo -e "3. Fix Your GVM-XX.XX installation is not yet complete"
  echo -e "\033[33m"
  echo -e "4. Exit"
  echo -e "\033[39m"

  read -p "Enter your choice: " count

  if [ "$count" -eq 1 ]; then
    # Install GVM
    sudo apt install openvas -y
    sudo gvm-setup
    sudo gvm-check-setup
    sudo runuser -u _gvm -- gvm-manage-certs -a -f
    sudo gvm-start
    
    # Ask if user wants remote access enabled
    read -p "Do you want to make the server accessible from the remote network? (yes/no): " enable_remote
    if [ "$enable_remote" == "yes" ]; then
      # Replace the line in the greenbone-security-assistant.service file
      sudo sed -i 's/ExecStart=.*/ExecStart=\/usr\/sbin\/gsad --listen=0.0.0.0 --port=9392/' /usr/lib/systemd/system/greenbone-security-assistant.service
      echo -e "\033[32mRemote access enabled. Restarting the service...\033[39m"
      
      # Reload systemd and restart the service
      sudo systemctl daemon-reload
      sudo systemctl restart greenbone-security-assistant.service
    else
      echo -e "\033[33mRemote access not enabled.\033[39m"
    fi

  elif [ "$count" -eq 2 ]; then
    # Update GVM feeds
    sudo greenbone-feed-sync

  elif [ "$count" -eq 3 ]; then
    # Fix Your GVM-XX.XX installation is not yet complete
    sudo -u postgres psql <<EOF
ALTER DATABASE template1 REFRESH COLLATION VERSION;
\q
EOF
    sudo -u postgres /usr/share/gvm/create-postgresql-database

  elif [ "$count" -eq 4 ]; then
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
