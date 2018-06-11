#!/bin/bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo ""
echo "------------------------------"
echo "Installing AWS CLI and other tools"
echo "------------------------------"
pip install awscli
pip install boto
pip install s3cmd

# Heroku
wget -qO- https://cli-assets.heroku.com/install-ubuntu.sh | sh
