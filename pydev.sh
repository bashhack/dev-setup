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
. ~/.exports
. ~/.bash_profile
pyenv install 3.6.5
pyenv install 3.7-dev
pyenv install 3.8-dev
pyenv global 3.6.5

echo ""
echo "------------------------------"
echo "Installing Pipsi."
echo "------------------------------"

pip install virtualenv
curl https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py | python

echo ""
echo "------------------------------"
echo "Installing Python code-quality packages."
echo "------------------------------"

pipsi install python-language-server
pipsi install pyls-sort
pipsi install pyls-mypy
pipsi install flake8
pipsi install yapf
pipsi install autoflake
pipsi install isort
pip install importmagic
pip install epc

echo ""
echo "------------------------------"
echo "Installing Python data science and AI/ML packages."
echo "------------------------------"

pip install jupyter
pip install git+https://github.com/Calysto/calysto_hy.git
python -m calysto_hy install --user
pip install numpy
pip install pandas
pip install matplotlib
pip install seaborn
pip install scikit-learn
pip install scipy
pip install bokeh
pip install pyspark
pip install mrjob
