#!/bin/bash

#Mettre à jour la liste des packets
sudo apt-get update

#Installer  un serveur apache
sudo apt-get install apache2

#Installer un serveur ssh pour pouvoir accéder à  distance à la machine virtuelle
sudo apt-get install openssh-server

#Entrer dans le dossier d'apache
cd /etc/apache2/

#créer un lien symbolic mettant en relation apache et notre site web
sudo ln -s ./Desktop/Exam SYS/web/  /var/www/html/

#Appliquer la nouvelle configuration
sudo service apache2 reload
