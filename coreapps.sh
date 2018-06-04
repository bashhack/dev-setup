#!/bin/bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Step 1
# Install core editors
sudo apt install vim -y
sudo apt install emacs25 -y
## Spacemacs
mv .emacs.d .emacs.d.bak
mv .emacs .emacs.bak
git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d

## Languages
# Python
## `pyenv` dependencies
sudo apt install make -y
sudo apt install libssl-dev -y
sudo apt install zlib1g-dev -y
sudo apt install libbz2-dev -y
sudo apt install libreadline-dev -y
sudo apt install libsqlite3-dev -y
sudo apt install wget -y
sudo apt install curl -y
sudo apt install llvm -y
sudo apt install libncurses5-dev -y
sudo apt install libncursesw5-dev -y
sudo apt install xz-utils -y
sudo apt install tk-dev -y
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.exports
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.exports
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bash_profile
echo "$SHELL"
echo ""
echo "------------------------------"
echo "Installing pyenv versions: 3.6.5, 3.7-dev"
echo "------------------------------"
pyenv install 3.6.5
pyenv install 3.7-dev
pyenv global 3.6.5
echo "$SHELL"
echo "------------------------------"
echo "Global Python version is: `pyenv version`"
echo "------------------------------"

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
node -v

# Rust
# curl https://sh.rustup.rs -sSf | sh
# echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.exports

# Haskell
# Java
# Clojure
# Scheme
# Ruby
## LINE='eval "$(rbenv init -)"'
## grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra

## Tools
# Spacemacs
# Ripgrep
# Ag
# Heroku
# Pyenv

# Misc
# neofetch
# tree
# htop

## Fonts
# nerd-fonts
# source-code-pro

## Apps
# spotify
# chromium

# Services
# ELK stack
# Postgresql
