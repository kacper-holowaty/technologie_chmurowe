#!/bin/bash

docker run -p 8080:8080 -it -d -v ${PWD}/server.js:/server.js node:12 node server.js

# takie coś działa w konsoli windowsowej:
# docker run -p 8080:8080 -it -d -v ${PWD}\server.js:/server.js node:12 node server.js

# takie coś w wsl:
# docker run -p 8080:8080 -it -d -v ${PWD}/server.js:/server.js node:12 node server.js