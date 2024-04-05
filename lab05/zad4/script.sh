#!/bin/bash

docker build --build-arg PYTHON_VERSION=3.11.8 --build-arg PORT=8000 -t stepik5-zad4 .

docker run -d -p 8000:8000 stepik5-zad4 