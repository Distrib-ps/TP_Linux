#!/bin/bash

# SCRIPT DE CREATION D'UTILISATEUR - PARTIE 1 (3)
# Vérification root - Vérifie que le script est exécuté en tant que root
if [ "$EUID" -ne 0 ]; then
  echo "Ce script doit être exécuté en root (sudo)"
  exit 1
fi

echo "=== Création d'un utilisateur ==="

# Saisie des informations
read -p "Nom de l'utilisateur : " USERNAME
read -s -p "Mot de passe : " PASSWORD
echo
read -p "Groupe : " GROUP

# Vérifier si le groupe existe
if ! getent group "$GROUP" > /dev/null; then
  echo "Le groupe n'existe pas."
  exit 1
fi

# Vérifier si l'utilisateur existe déjà
if id "$USERNAME" &>/dev/null; then
  echo "L'utilisateur existe déjà."
  exit 1
fi

# Création de l'utilisateur
useradd -m -s /bin/bash -g "$GROUP" "$USERNAME"

# Définition du mot de passe
echo "$USERNAME:$PASSWORD" | chpasswd

echo "Utilisateur $USERNAME créé avec succès dans le groupe $GROUP"