#!/bin/bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo ""
echo "------------------------------"
echo "Installing node/nvm versions: 9.4, 10.3"
echo "------------------------------"

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
. ~/.nvm/nvm.sh
nvm install 10.3.0
. ~/.nvm/nvm.sh
nvm install 9.4.0
. ~/.nvm/nvm.sh

echo ""
echo "------------------------------"
echo "Installing ESLint and Tern.js"
echo "------------------------------"

npm i -g tern
npm i -g eslint eslint-plugin-better eslint-plugin-fp eslint-plugin-import
npm i -g eslint-config-cleanjs
