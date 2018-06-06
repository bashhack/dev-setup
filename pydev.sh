#!/bin/bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

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
