#!/bin/bash

docker build -t hello-docker .

docker run -d hello-docker