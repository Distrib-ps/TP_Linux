#!/bin/bash

ARCHIVE="$1"
RESTORE_DIR="/restore_test"
ORIGINAL_DIR="/home"

# Vérifier qu'une archive a bien été fournie
if [ -z "$ARCHIVE" ]; then
    echo "Usage : $0 <archive.tar.gz>"
    exit 1
fi
# Vérifier que l'archive existe
if [ ! -f "$ARCHIVE" ]; then
    echo "Erreur : archive introuvable : $ARCHIVE"
    exit 1
fi

# Nettoyage de l'ancien dossier de restauration
sudo rm -rf "$RESTORE_DIR"
sudo mkdir -p "$RESTORE_DIR"

# Restauration de l’archive
sudo tar -xzf "$ARCHIVE" -C "$RESTORE_DIR"
if [ $? -ne 0 ]; then
    echo "Erreur lors de la restauration"
    exit 1
fi

echo "Restauration effectuée dans $RESTORE_DIR"
# Comparaison avec l'original
echo "Comparaison entre $ORIGINAL_DIR et $RESTORE_DIR/home ..."
diff -r "$ORIGINAL_DIR" "$RESTORE_DIR/home" > /tmp/restore_diff.txt
if [ $? -eq 0 ]; then
    echo "Comparaison OK : les fichiers restaurés sont identiques à l'original."
else
    echo "Des différences ont été trouvées :"
    cat /tmp/restore_diff.txt
fi