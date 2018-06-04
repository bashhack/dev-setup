#!/bin/bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

## Languages
# Python
# Node/NVM
# Rust
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
