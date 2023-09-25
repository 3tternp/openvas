#!/bin/bash
# Get the path to the current working directory
WORKING_DIR=$(pwd)

# Get the name of the background image file
IMAGE_FILE=$(ls "${WORKING_DIR}" | grep -E '.*\.(png|gif|jpg|jpeg)$')

# If there is no background image file in the working directory, exit the script
if [[ -z "${IMAGE_FILE}" ]]; then
  echo "No background image file found in the working directory."
  exit 1
fi

# Set the path to the background image file
IMAGE_PATH="${WORKING_DIR}/${IMAGE_FILE}"

# Get the terminal profile name
PROFILE_NAME=$(gnome-terminal --get-profile)

# Set the background image for the terminal profile
gsettings set org.gnome.Terminal.Profiles.${PROFILE_NAME} background-image-file "${IMAGE_PATH}"

while true ;
do
echo -e "\033[30m"
echo -e "Choose the operation you want to  perform ? ""\033[31m"
echo -e "1. Install GVM " "\033[32m"
echo -e "2. Update Feeds" "\033[33m"
echo -e "3. Exit " "\033[39m"

read count
if [ $count -eq 1 ]
then
sudo apt install openvas -y 
sudo gvm-setup
sudo gvm-check-setup
sudo runuser -u _gvm -- greenbone-feed-sync
sudo gvm-start
exit

elif [ $count -eq 2 ]
then
gvm-feed-update
exit
else 
echo "you are out of the box"

fi
done 

