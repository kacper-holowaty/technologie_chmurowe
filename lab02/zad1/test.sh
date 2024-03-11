#!/bin/bash

CONTAINERS=$(docker ps)

if [ -n "$CONTAINERS" ]; then
    echo "$CONTAINERS"
else
    echo "Test niezaliczony. Nie uruchomiono żadnego kontenera."
fi

RESPONSE=$(curl http://localhost:8080)
if [[ "$RESPONSE" == "Hello World" ]]; then
  echo "Test zaliczony. Odpowiedź serwera to: '$RESPONSE'"
else
  echo "Test niezaliczony."
fi