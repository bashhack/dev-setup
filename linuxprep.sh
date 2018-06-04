#!/bin/bash

# Ask for the admin password
sudo -v

# Keep-alive: update existing `sudo` time stamp until `linuxprep.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Step 1
# Install all available updates
sudo apt update
sudo apt upgrade -y

# Step 2
# Install developer tools
sudo apt install build-essential -y
sudo apt install git -y
sudo apt install curl -y
sudo apt install cmake -y
sudo apt install clang -y
sudo apt install gcc -y

# Step 3
# Install core editors
sudo apt install vim -y
sudo apt install emacs25 -y

# Step 4
# Install Ubuntu addons
sudo apt install gnome-tweak-tool -y
sudo apt install tlp tlp-rdw -y
sudo apt install tp-smapi-dkms acpi-call-dkms smartmontools -y
sudo tlp start

