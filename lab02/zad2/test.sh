#!/bin/bash

if docker ps | grep -q "node:14"; then
    echo "Test zaliczony. Kontener został uruchomiony."
else
    echo "Błąd: Kontener nie został uruchomiony."
    exit 1
fi