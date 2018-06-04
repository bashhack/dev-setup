#!/bin/bash

# Ask for the admin password
sudo -v

# Keep-alive: update existing `sudo` time stamp until `linuxprep.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Step 1
# Install all available updates
sudo apt update -y
sudo apt upgrade -y
