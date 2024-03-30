#!/bin/bash

docker_volumes=$(docker volume ls --format '{{.Name}}')

for volume in $docker_volumes; do
    df_output=$(docker run --rm -v $volume:/$volume alpine df -h /$volume | awk 'NR==2 {print $5}')
    echo "Wolumin: $volume - Zużycie: $df_output"
done
