# 🖥️ INSTALLATION – Environnement système

## 1. Présentation de l’environnement

Le projet a été réalisé sur une **machine virtuelle** afin de garantir un environnement isolé, reproductible et sans risque pour le système hôte.

* **Solution de virtualisation** : UTM
* **Type de machine** : Machine virtuelle
* **Technologie de virtualisation détectée** : QEMU
* **Objectif** : Simuler un serveur Linux dans un environnement contrôlé

---

## 2. Système d’exploitation

* **Distribution** : Ubuntu 24.04.3 LTS
* **Nom de code** : noble
* **Kernel** : Linux 6.8.0-94-generic
* **Architecture** : ARM64 (aarch64)

👉 Le choix d’Ubuntu LTS permet d’avoir :

* une stabilité élevée
* un support long terme
* une compatibilité avec les outils serveur (LVM, firewall, etc.)

---

## 3. Configuration matérielle (VM)

### 🧠 Processeur (CPU)

* **Architecture** : aarch64 (64 bits)
* **Nombre de CPU** : 4
* **Cœurs** : 4
* **Threads par cœur** : 1
* **Modèle** : QEMU Virtual CPU

---

### 🧬 Mémoire (RAM)

* **Mémoire totale** : 1.9 Go
* **Mémoire disponible** : ~1.6 Go

---

### 💾 Stockage

#### Disques et partitions :

* **Disque principal (LVM)** :

  * `/` → 9.8 Go (63% utilisé)
  * Gestion via LVM (`/dev/mapper/ubuntu--vg-ubuntu--lv`)

* **Partitions système** :

  * `/boot` → 1.7 Go
  * `/boot/efi` → 952 Mo

* **Disque secondaire** :

  * `/mnt/disque1` → 2 Go

---

## 4. Réseau

* **Interface réseau** : enp0s1
* **Adresse IPv4** : 192.168.64.11
* **Type** : DHCP (adresse dynamique)

---

## 5. Virtualisation

* **Type détecté** : QEMU
* **Hardware** : QEMU Virtual Machine

---

## 6. Choix techniques

### ✔️ Utilisation d’une VM (UTM)

* Isolation complète du système
* Possibilité de snapshot (sauvegarde rapide)
* Aucun risque pour la machine principale

### ✔️ Ubuntu Server (LTS)

* Distribution stable et largement utilisée en entreprise
* Compatible avec tous les outils demandés (LVM, iptables, scripts…)

### ✔️ Architecture ARM

* Adaptée à UTM sur machine Apple Silicon
* Performances optimisées en virtualisation

---

Chaque commande ou script sont éxécuté via le SSH de ma machine principale

---
