#!/bin/bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo ""
echo "------------------------------"
echo "Installing ELK Stack (Elasticsearch, Logstash, Kibana)."
echo "------------------------------"

sudo apt install apt-transport-https nginx net-tools apache2-utils -y
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list
sudo apt update
sudo apt -y install elasticsearch kibana
echo "export ES_HEAP_SIZE=512m" >> ~/.exports
sudo apt-get install -y logstash

echo ""
echo "------------------------------"
echo "Installing PostgreSQL."
echo "------------------------------"

sudo apt install -y postgresql postgresql-contrib

echo ""
echo "------------------------------"
echo "Installing Redis."
echo "------------------------------"

sudo apt install redis -y
sudo systemctl daemon-reload
sudo systemctl enable redis
sudo systemctl start redis
