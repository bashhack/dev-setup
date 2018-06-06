#!/bin/bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

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
echo 'eval "$(rbenv init -)"' >> ~/.exports
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
