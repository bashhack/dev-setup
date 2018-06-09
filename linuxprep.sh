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
sudo apt install tmux -y
sudo apt install wget -y
sudo apt install curl -y
sudo apt install cmake -y
sudo apt install make -y
sudo apt install clang -y
sudo apt install gcc -y
sudo apt install llvm -y
sudo apt install libssl-dev -y
sudo apt install zlib1g-dev -y
sudo apt install libbz2-dev -y
sudo apt install libreadline-dev -y
sudo apt install libsqlite3-dev -y
sudo apt install libncurses5-dev -y
sudo apt install libncursesw5-dev -y
sudo apt install xz-utils -y
sudo apt install tk-dev -y
curl https://krypt.co/kr | sh

# Step 3
# Install Ubuntu addons
sudo apt install gnome-tweak-tool -y
sudo apt install tlp tlp-rdw -y
sudo apt install tp-smapi-dkms acpi-call-dkms smartmontools -y
sudo tlp start
