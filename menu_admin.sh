#!/bin/bash

while true
do
    clear
    echo "=============================="
    echo "       MENU ADMIN SYSTEME     "
    echo "=============================="
    echo "1. Sauvegarde /home avec tar"
    echo "2. Sauvegarde incrémentale rsync"
    echo "3. Restaurer une archive"
    echo "4. Vérifier les logs fail2ban"
    echo "5. Monitoring système"
    echo "6. Quitter"
    echo "=============================="
    read -p "Choisissez une option : " CHOICE

    case $CHOICE in
        1)
            echo "Lancement de la sauvegarde tar..."
            sudo /home/theo/backup_home.sh
            read -p "Appuyez sur Entrée pour continuer..."
            ;;
        2)
            echo "Lancement de la sauvegarde rsync..."
            sudo /home/theo/backup_rsync.sh
            read -p "Appuyez sur Entrée pour continuer..."
            ;;
        3)
            read -p "Entrez le chemin complet de l'archive : " ARCHIVE
            sudo /home/theo/restore_compare.sh "$ARCHIVE"
            read -p "Appuyez sur Entrée pour continuer..."
            ;;
        4)
            echo "Analyse des logs fail2ban..."
            sudo /home/theo/fail2ban_summary.sh
            cat /home/theo/fail2ban_alert.log
            read -p "Appuyez sur Entrée pour continuer..."
            ;;
        5)
            echo "Lancement du monitoring système..."
            /home/theo/system_alert.sh
            read -p "Appuyez sur Entrée pour continuer..."
            ;;
        6)
            echo "Fermeture du menu."
            exit 0
            ;;
        *)
            echo "Option invalide."
            read -p "Appuyez sur Entrée pour continuer..."
            ;;
    esac
done