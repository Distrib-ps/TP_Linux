#!/bin/bash

LOGFILE="/var/log/fail2ban.log"
OUTPUT="/home/theo/fail2ban_alert.log"
DATE=$(date "+%Y-%m-%d %H:%M:%S")

echo "===== Résumé Fail2Ban du $DATE =====" > "$OUTPUT"

if [ ! -f "$LOGFILE" ]; then
    echo "Fichier log introuvable : $LOGFILE" >> "$OUTPUT"
    exit 1
fi

BANNED_IPS=$(grep "Ban " "$LOGFILE" | awk '{print $NF}' | sort | uniq)

if [ -z "$BANNED_IPS" ]; then
    echo "Aucune IP bannie trouvée." >> "$OUTPUT"
else
    echo "IP bannies :" >> "$OUTPUT"
    echo "$BANNED_IPS" >> "$OUTPUT"
fi

echo "" >> "$OUTPUT"
echo "Nombre total d'IP bannies : $(grep 'Ban ' "$LOGFILE" | awk '{print $NF}' | sort | uniq | wc -l)" >> "$OUTPUT"

echo "Résumé généré dans $OUTPUT"