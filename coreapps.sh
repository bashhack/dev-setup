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

## Step 2
# Install search tools
# Ripgrep
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb
sudo dpkg -i ripgrep_0.8.1_amd64.deb
# Ag
sudo apt install silversearcher-ag

## Step 3
# Install system tools
# neofetch
sudo apt install neofetch -y
# tree
sudo apt install tree -y
# htop
sudo apt install htop -y

## Step 4
# Install fonts
### source-code-pro
FONT_HOME=~/.local/share/fonts
echo "Installing fonts at $PWD to $FONT_HOME"
mkdir -p "$FONT_HOME/adobe-fonts/source-code-pro"
(git clone \
     --branch release \
     --depth 1 \
     'https://github.com/adobe-fonts/source-code-pro.git' \
     "$FONT_HOME/adobe-fonts/source-code-pro" && \
     fc-cache -f -v "$FONT_HOME/adobe-fonts/source-code-pro")
### nerd-fonts
git clone git@github.com:ryanoasis/nerd-fonts.git
cd ~/nerd-fonts
bash ./install.sh
echo "Fonts successfully loaded"

## Step 5
# Install browsers
sudo snap install chromium

## Step 6
# Install media players
sudo snap install spotify
