#!/bin/bash

SOURCE="/home"
DEST="/backup"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
ARCHIVE="backup_home_$DATE.tar.gz"

mkdir -p "$DEST"

tar -czf "$DEST/$ARCHIVE" "$SOURCE"

if [ $? -eq 0 ]; then
    echo "Sauvegarde réussie : $DEST/$ARCHIVE"
else
    echo "Erreur lors de la sauvegarde"
    exit 1
fi