#!/bin/bash

SOURCE="/home/"
DEST="/backup_rsync/"
LOGFILE="/var/log/backup_rsync.log"

mkdir -p "$DEST"

rsync -av --delete \
  --exclude="*.tmp" \
  --exclude="*.temp" \
  --exclude="*~" \
  --exclude=".cache/" \
  --exclude="tmp/" \
  "$SOURCE" "$DEST" >> "$LOGFILE" 2>&1

if [ $? -eq 0 ]; then
    echo "Sauvegarde rsync réussie vers $DEST"
else
    echo "Erreur lors de la sauvegarde rsync"
    exit 1
fi