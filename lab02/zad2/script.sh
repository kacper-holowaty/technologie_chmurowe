#!/bin/bash

container_id=$(docker run -p 8080:8080 -it -d -v ${PWD}/server.js:/server.js node:14)

docker exec -it "$container_id" bash -c "npm install express"

docker exec -it "$container_id" bash -c "node ./server.js"