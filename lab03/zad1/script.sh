#!/bin/bash

docker build -t nginx .

docker run -d -p 80:80 -v ${PWD}:/usr/share/nginx/html nginx
