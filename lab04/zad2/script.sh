#!/bin/bash

docker volume create nodejs_data

docker run -itd --name stepik4-zad2 -p 3000:3000 --volume nodejs_data:/app node:latest

docker volume create all_volumes

docker run --rm -v nginx_data:/usr/share/nginx/html -v all_volumes:/all_volumes busybox cp -r /usr/share/nginx/html/. /all_volumes

docker exec -it stepik4-zad2 cp -r /app/. /all_volumes
