#!/bin/bash

volume=$1
password=$2

encrypted_dir="encrypted_volumes"

mkdir -p "$encrypted_dir"

echo "Tworzenie archiwum dla woluminu $volume..."
docker run --rm -v $volume:/data -v $(pwd)/$encrypted_dir:/backup alpine tar czf /backup/${volume}.tar.gz /data

echo "Szyfrowanie archiwum $volume..."
gpg --batch --passphrase "$password" -c "$encrypted_dir/${volume}.tar.gz"


echo "Zakończono szyfrowanie woluminu $volume"

for encrypted_archive in "$encrypted_dir"/*.tar.gz.gpg; do
    echo "Deszyfrowanie archiwum $encrypted_archive..."
    gpg --batch --passphrase "$password" -d "$encrypted_archive" | tar xz -C "$encrypted_dir"
done

echo "Zakończono deszyfrowanie wszystkich archiwów."

# uruchomienie: ./script.sh <nazwa_wolumenu> <hasło>
