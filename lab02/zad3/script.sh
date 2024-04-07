#!/bin/bash

docker build -t mongo_express .

docker run -d -p 8080:8080 --link test-mongo mongo_express
