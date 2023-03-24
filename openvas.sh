#!/bin/bash

sudo apt install openvas -y 
sudo gvm-setup
sudo gvm-check-setup
sudo runuser -u _gvm -- greenbone-feed-sync --type SCAP 
sudo gvm-start
