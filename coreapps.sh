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

# Rust
curl https://sh.rustup.rs -sSf | sh
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.exports

# Haskell
curl -sSL https://get.haskellstack.org/ | sh

# Java
sudo apt install openjdk-8-jdk -y

# Clojure
sudo apt install leiningen -y

# Scheme
git clone git@github.com:cisco/ChezScheme.git
cd ~/ChezScheme && bash ./configure
sudo make install
cd $HOME

# Common Lisp
sudo apt install sbcl -y

# Ruby
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.exports
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
echo "$SHELL"

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.exports
echo "$SHELL"

rbenv install 2.5.1
rbenv global 2.5.1
ruby -v
gem install bundler
rbenv rehash
gem install foreman
rbenv rehash

## Tools
# Ripgrep
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb
sudo dpkg -i ripgrep_0.8.1_amd64.deb
# Ag
sudo apt install silversearcher-ag
# Heroku
wget -qO- https://cli-assets.heroku.com/install-ubuntu.sh | sh

# Misc
# neofetch
sudo apt install neofetch -y
# tree
sudo apt install tree -y
# htop
sudo apt install htop -y

## Fonts
# nerd-fonts
# source-code-pro

## Apps
# spotify
sudo snap install spotify
# chromium
sudo snap install chromium-browser

# Services
# ELK stack
# Postgresql
