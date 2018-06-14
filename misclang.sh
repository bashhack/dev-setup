#!/bin/bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo ""
echo "------------------------------"
echo "Installing Hy."
echo "------------------------------"

. ~/.exports
. ~/.bash_profile
pip install hy

echo ""
echo "------------------------------"
echo "Installing Rust."
echo "------------------------------"

curl https://sh.rustup.rs -sSf | sh
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.exports

echo ""
echo "------------------------------"
echo "Installing Haskell."
echo "------------------------------"

curl -sSL https://get.haskellstack.org/ | sh

echo ""
echo "------------------------------"
echo "Installing Java."
echo "------------------------------"

sudo apt install openjdk-8-jdk -y

echo ""
echo "------------------------------"
echo "Installing Clojure and Leiningen."
echo "------------------------------"

sudo apt install leiningen -y

echo ""
echo "------------------------------"
echo "Installing Chez Scheme."
echo "------------------------------"

git clone https://github.com/cisco/ChezScheme.git
cd ~/ChezScheme && bash ./configure
sudo make install
cd $HOME

echo ""
echo "------------------------------"
echo "Installing Steel Bank Common Lisp."
echo "------------------------------"

sudo apt install sbcl -y

echo ""
echo "------------------------------"
echo "Installing Ruby."
echo "------------------------------"

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.exports
echo 'eval "$(rbenv init -)"' >> ~/.exports
. ~/.bashrc

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.exports
. ~/.bashrc

rbenv install 2.5.1
rbenv global 2.5.1
ruby -v
gem install bundler
rbenv rehash
gem install foreman
rbenv rehash
