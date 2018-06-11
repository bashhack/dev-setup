#!/bin/bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo ""
echo "------------------------------"
echo "Installing ELK Stack (Elasticsearch, Logstash, Kibana)."
echo "------------------------------"

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

echo ""
echo "------------------------------"
echo "Installing PostgreSQL."
echo "------------------------------"

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

echo ""
echo "------------------------------"
echo "Installing Redis."
echo "------------------------------"

sudo apt install redis
sudo systemctl daemon-reload
sudo systemctl enable redis
sudo systemctl start redis
