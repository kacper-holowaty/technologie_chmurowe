#!/bin/bash

CONTAINER_NAME="zad2-stepik3"
if docker ps --format '{{.Names}}' | grep -q "$CONTAINER_NAME"; then
    echo "Kontener $CONTAINER_NAME jest uruchomiony."
else
    echo "Kontener $CONTAINER_NAME nie jest uruchomiony."
fi
