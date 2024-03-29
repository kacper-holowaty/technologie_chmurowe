#!/bin/bash

# Tworzenie katalogu cache i nadanie właściciela nginx
sudo mkdir -p /var/cache/nginx
sudo chown -R nginx /var/cache/nginx

# Instalacja openssl w kontenerze
sudo apt-get update
sudo apt-get install -y openssl

# Tworzenie katalogu SSL z uprawnieniami roota
sudo mkdir -p /etc/nginx/ssl/

# Generowanie certyfikatu SSL
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj "/C=US/ST=CA/L=SanFrancisco/O=MyOrg/OU=MyUnit/CN=localhost"

# Tworzenie konfiguracji reverse proxy dla Nginx
sudo tee /etc/nginx/conf.d/default.conf >/dev/null <<EOF
server {
    listen 80;
    server_name localhost;

    location / {
        proxy_pass http://localhost:3000;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }

    location /cache {
        proxy_cache cache_zone;
        proxy_cache_key \$uri\$is_args\$args;
        proxy_cache_valid 200 302 10m;
        proxy_cache_valid 404 1m;
    }
}

server {
    listen 443 ssl;
    server_name localhost;

    ssl_certificate /etc/nginx/ssl/nginx.crt;
    ssl_certificate_key /etc/nginx/ssl/nginx.key;

    location / {
        proxy_pass http://localhost:3000;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }

    location /cache {
        proxy_cache cache_zone;
        proxy_cache_key \$uri\$is_args\$args;
        proxy_cache_valid 200 302 10m;
        proxy_cache_valid 404 1m;
    }
}

proxy_cache_path /var/cache/nginx levels=1:2 keys_zone=cache_zone:10m max_size=10g inactive=60m use_temp_path=off;
EOF

# Restartowanie serwera Nginx
sudo service nginx restart

# Uruchomienie kontenera Docker z Nginx
docker run -d -p 80:80 -p 443:443 -v /var/cache/nginx:/var/cache/nginx --name nginx-proxy nginx

echo "Kontener Docker z reverse proxy serwerem Nginx został utworzony."