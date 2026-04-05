#!/bin/bash

echo "===== MONITORING SYSTEME ====="
echo

# Nom de la machine
echo "Nom de la machine : $(hostname)"
echo

# Version du noyau
echo "Version du noyau : $(uname -r)"
echo

# CPU
echo "Utilisation CPU (load average) :"
uptime
echo

# Mémoire
echo "Utilisation mémoire :"
free -h
echo

# Swap
echo "Utilisation du swap :"
free -h | awk '/Swap/ {printf "Utilisé: %s / Total: %s\n", $3, $2}'

SWAP_USED=$(free | awk '/Swap/ {print $3}')
SWAP_TOTAL=$(free | awk '/Swap/ {print $2}')

if [ "$SWAP_TOTAL" -gt 0 ]; then
    SWAP_PERCENT=$((SWAP_USED * 100 / SWAP_TOTAL))
    echo "Pourcentage swap utilisé : ${SWAP_PERCENT}%"

    if [ "$SWAP_PERCENT" -gt 50 ]; then
        echo "ALERTE : le swap dépasse 50% d'utilisation."
    fi
else
    echo "Aucun swap configuré."
fi

echo

# Disques
echo "Utilisation des disques :"
df -h --output=source,target,pcent | grep '^/dev'
echo

echo "Analyse des seuils disques :"
df -h --output=source,target,pcent | grep '^/dev' | while read FS MOUNT USE
do
    PERCENT=$(echo "$USE" | sed 's/%//')
    echo "$FS monté sur $MOUNT : $USE utilisé"

    if [ "$PERCENT" -gt 80 ]; then
        echo "ALERTE : $FS dépasse 80% d'utilisation."
    fi
done

echo
echo "===== FIN ====="