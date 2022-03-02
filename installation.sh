#!/bin/bash

#Mettre à jour la liste des packets
sudo apt-get update

#Installer  un serveur apache
sudo apt-get install apache2

#Installer un serveur ssh pour pouvoir accéder à  distance à la machine virtuelle
sudo apt-get install openssh-server

#Connecter la machine réelle avec  la machine virtuelle
read -p "Saisir le nom d'utilisateur de la machine réelle" hostname
read -p "Saisir l'ip de la machine réelle" serveur
ssh $hostname@$serveur

#créer un lien symbolic mettant en relation apache et notre site web
sudo ln -s ./Desktop/Exam SYS/Web/  /var/www/html/

#Appliquer la nouvelle configuration
sudo service apache2 reload
