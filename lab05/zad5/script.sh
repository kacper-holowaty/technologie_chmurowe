#!/bin/bash

docker build -t stepik5-zad5 .

docker run -d -p 80:80 stepik5-zad5 