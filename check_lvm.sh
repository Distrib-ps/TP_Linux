#!/bin/bash

echo "=== Vérification des Logical Volumes ==="

# Récupère les LV montés avec leur utilisation
df -h | grep "/dev/mapper/" | while read line
do
    # Extraction des infos
    LV=$(echo $line | awk '{print $1}')
    USAGE=$(echo $line | awk '{print $5}' | sed 's/%//')
    MOUNT=$(echo $line | awk '{print $6}')

    echo "Volume : $LV | Utilisation : $USAGE% | Monté sur : $MOUNT"

    # Vérification seuil
    if [ "$USAGE" -ge 80 ]; then
        echo "ALERTE : $LV est utilisé à plus de 80% !"
    fi
done