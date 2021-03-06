#!/bin/bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo ""
echo "------------------------------"
echo "Installing Vim and Emacs."
echo "------------------------------"

sudo apt install vim -y
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt install emacs26 -y
mv .emacs.d .emacs.d.bak
mv .emacs .emacs.bak
git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d
cp init/1000-banner.txt ~/.emacs.d/core/banners/

echo ""
echo "------------------------------"
echo "Installing search tools (i.e., Ripgrep, Ag)."
echo "------------------------------"

curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb
sudo dpkg -i ripgrep_0.8.1_amd64.deb
sudo apt install silversearcher-ag

echo ""
echo "------------------------------"
echo "Installing system tools (i.e., neofetch, tree, htop)."
echo "------------------------------"

sudo apt install neofetch -y
sudo apt install tree -y
sudo apt install htop -y


echo ""
echo "------------------------------"
echo "Installing system fonts."
echo "------------------------------"

FONT_HOME=~/.local/share/fonts
sudo apt install fonts-inconsolata -y
echo "Installing fonts at $PWD to $FONT_HOME"
mkdir -p "$FONT_HOME/adobe-fonts/source-code-pro"
(git clone \
     --branch release \
     --depth 1 \
     'https://github.com/adobe-fonts/source-code-pro.git' \
     "$FONT_HOME/adobe-fonts/source-code-pro" && \
     fc-cache -f -v "$FONT_HOME/adobe-fonts/source-code-pro")
git clone https://github.com/ryanoasis/nerd-fonts.git
cd ~/nerd-fonts
bash ./install.sh

echo ""
echo "------------------------------"
echo "Installing Chromium and Spotify."
echo "------------------------------"

sudo snap install chromium
sudo snap install spotify
