#!/bin/bash

echo "===== MONITORING SYSTEME ====="
echo ""

# Nom machine
echo "Nom de la machine : $(hostname)"
echo ""

# Version noyau
echo "Version du noyau : $(uname -r)"
echo ""

# CPU (charge moyenne)
echo "Utilisation CPU (load average) :"
uptime
echo ""

# Mémoire RAM
echo "Utilisation mémoire :"
free -h
echo ""

# Swap
echo "Utilisation du swap :"
free -h | awk '/Swap/ {printf "Utilisé: %s / Total: %s (%.2f%%)\n", $3, $2, ($3/$2)*100 }'
echo ""

# Disques
echo "Utilisation des disques :"
df -h | grep "^/dev"
echo ""

echo "===== FIN ====="