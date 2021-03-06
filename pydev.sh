#!/bin/bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo ""
echo "------------------------------"
echo "Installing pyenv versions: 3.6.5, 3.7-dev, and 3.8-dev"
echo "------------------------------"

git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.exports
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.exports
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bash_profile
. ~/.bash_profile
pyenv install 3.6.5
pyenv install 3.7-dev
pyenv install 3.8-dev
pyenv global 3.6.5

# echo ""
# echo "------------------------------"
# echo "Installing Pipsi."
# echo "------------------------------"

. ~/.bash_profile
pip install virtualenv
curl https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py | python

echo ""
echo "------------------------------"
echo "Installing Python code-quality packages."
echo "------------------------------"

. ~/.bash_profile
pip install pipenv
pip install python-language-server
pip install pyls-isort
pip install pyls-mypy
pip install flake8
pip install yapf
pip install autoflake
pip install isort
pip install importmagic
pip install epc

echo ""
echo "------------------------------"
echo "Installing Python data science packages."
echo "------------------------------"

pip install jupyter
pip install mrjob

echo ""
echo "------------------------------"
echo "Installing pywal for theming."
echo "------------------------------"

pip install pywal
