# Post-Install Guide

## Clojure

### Configuration 

Add to `~/.lein/profiles.clj`:

```
    {:repl {:plugins [[cider/cider-nrepl "0.10.0-SNAPSHOT"]
                      [refactor-nrepl "2.0.0-SNAPSHOT"]]
            :dependencies [[alembic "0.3.2"]
                           [org.clojure/tools.nrepl "0.2.12"]]}}
```

## ELK Stack

### Elasticsearch

    $ cd /etc/elasticsearch/
    $ vim elasticsearch.yml

Set the following:

    bootstrap.memory_lock: true
    network.host: localhost
    http.port: 9200

Uncomment the following:

    $ vim /usr/lib/systemd/system/elasticsearch.service
    LimitMEMLOCK=infinity

Uncomment the following:

    $ vim /etc/default/elasticsearch
    MAX_LOCKED_MEMORY=unlimited

After making the changes above:

    $ sudo systemctl daemon-reload
    $ sudo systemctl enable elasticsearch
    $ sudo systemctl start elasticsearch

### Kibana

Uncomment the following:

    $ vim /etc/kibana/kibana.yml
    server.port: 5601
    server.host: "localhost"
    elasticsearch.url: "http://localhost:9200"

Start Kibana service:

    $ sudo systemctl enable kibana
    $ sudo systemctl start kibana

Check services are running with:

    $ netstat -plntu

Configure NGINX for Kibana:

    $ echo "kibanaadmin:`openssl passwd -apr1`" | sudo tee -a /etc/nginx/htpasswd.users
    $ sudo nano /etc/nginx/sites-available/default

Add the following:

```
    server {
        listen 80;

        server_name example.com;

        auth_basic "Restricted Access";
        auth_basic_user_file /etc/nginx/htpasswd.users;

        location / {
            proxy_pass http://localhost:5601;
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection 'upgrade';
            proxy_set_header Host $host;
            proxy_cache_bypass $http_upgrade;
        }
    }
```

Check config:

    $ sudo nginx -t
    $ sudo systemctl restart nginx

## PostgreSQL

Switch to postgres user:

    $ sudo -i -u postgres

Create new user (should be same as sys user):

    $ createuser --interactive

Create new database:

    $ createdb dbname

Log in as new user (should be same as sys user):

    $ sudo -i -u newusername

Test new config:

    $ psql -d dbname
