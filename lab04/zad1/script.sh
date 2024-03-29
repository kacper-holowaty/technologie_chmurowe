#!/bin/bash

docker volume create nginx_data

docker run -d --name zad1_nginx -p 80:80 -v nginx_data:/usr/share/nginx/html nginx

docker exec -it zad1_nginx bash -c "echo 'Nginx string!' > /usr/share/nginx/html/index.html"