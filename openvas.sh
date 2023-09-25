#!/bin/bash
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

