#!/bin/bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Node/NVM
echo ""
echo "------------------------------"
echo "Installing node/nvm versions: 9.4, 10.3"
echo "------------------------------"
echo ""
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
echo ""
echo "------------------------------"
echo "Global Node version: 10.3"
echo "------------------------------"
echo ""
. ~/.nvm/nvm.sh
nvm install 10.3.0
echo "$SHELL"
. ~/.nvm/nvm.sh
nvm install 9.4.0
echo "$SHELL"
. ~/.nvm/nvm.sh
