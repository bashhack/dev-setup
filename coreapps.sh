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
# source-code-pro
FONT_HOME=~/.local/share/fonts
echo "Installing fonts at $PWD to $FONT_HOME"
mkdir -p "$FONT_HOME/adobe-fonts/source-code-pro"
(git clone \
     --branch release \
     --depth 1 \
     'https://github.com/adobe-fonts/source-code-pro.git' \
     "$FONT_HOME/adobe-fonts/source-code-pro" && \
     fc-cache -f -v "$FONT_HOME/adobe-fonts/source-code-pro")
# nerd-fonts
git clone git@github.com:ryanoasis/nerd-fonts.git
cd ~/nerd-fonts
bash ./install.sh
echo "Fonts successfully loaded"

## Apps
# spotify
sudo snap install spotify
# chromium
sudo snap install chromium

# Services
# ELK stack
sudo apt install apt-transport-https nginx net-tools apache2-utils
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list
sudo apt update
sudo apt -y install elasticsearch kibana
# cd /etc/elasticsearch/
# vim elasticsearch.yml
# NOTE: Set the following:
# bootstrap.memory_lock: true
# network.host: localhost
# http.port: 9200
# NOTE: Uncomment the following:
# vim /usr/lib/systemd/system/elasticsearch.service
# LimitMEMLOCK=infinity
# NOTE: Set the configuration and uncomment:
# vim /etc/default/elasticsearch
# MAX_LOCKED_MEMORY=unlimited
echo "export ES_HEAP_SIZE=768m" >> ~/.exports
# NOTE: Start ES service:
# sudo systemctl daemon-reload
# sudo systemctl enable elasticsearch
# sudo systemctl start elasticsearch
# NOTE: Uncomment the following:
# vim /etc/kibana/kibana.yml
# server.port: 5601
# server.host: "localhost"
# elasticsearch.url: "http://localhost:9200"
# NOTE: Start kibana service:
# sudo systemctl enable kibana
# sudo systemctl start kibana
# NOTE: Check services with `netstat -plntu`
# NOTE: Configure kibana
# sudo -v
# echo "kibanaadmin:`openssl passwd -apr1`" | sudo tee -a /etc/nginx/htpasswd.users
# sudo nano /etc/nginx/sites-available/default
# NOTE: Add the following:
# server {
#     listen 80;

#     server_name example.com;

#     auth_basic "Restricted Access";
#     auth_basic_user_file /etc/nginx/htpasswd.users;

#     location / {
#         proxy_pass http://localhost:5601;
#         proxy_http_version 1.1;
#         proxy_set_header Upgrade $http_upgrade;
#         proxy_set_header Connection 'upgrade';
#         proxy_set_header Host $host;
#         proxy_cache_bypass $http_upgrade;
#     }
# }
# NOTE: Check config
# sudo nginx -t
# sudo systemctl restart nginx
sudo apt-get install -y logstash

# Postgresql
sudo apt install -y postgresql postgresql-contrib
# NOTE: Switch to postgres user
# sudo -i -u postgres
# NOTE: Create new user (should be same as sys user)
# createuser --interactive
# NOTE: Create new database
# createdb dbname
# NOTE: Log in as new user (should be same as sys user)
# sudo -i -u newusername
# NOTE: Test new config
# psql -d dbname



