# Installation du serveur Apache 

## 1 - Sous Fedora/CentOS/Red Hat Enterprise Linux
  ###  Ici nous allons installer Apache HTTPD sur Fedora : 

 * Installation des packages HTTPD : 
    ```sh
        sudo dnf installer httpd -y
     ```

 * Démarrage du service HTTPD : 
    ```sh
        sudo systemctl démarrer httpd.service
    ```

## 2 - Sous Ubuntu et/ou Debian

 * Installation des packages : 
   ```sh
        sudo apt install apache2
   ```

 * Démarrage du service : 
    ```sh
        sudo service apache2 start
    ```
##3- Installer un serveur ssh pour une communication à distance entre machine réelle et machine virtuel

    '''sudo apt-get install openssh-server


##Pour lier le fichier html au localohost, il faut configurer le réseau local de la machine virtuel
    '''Setting -> Réseau ->Port de redirection : changer l'ip en 127.0.0.1 et spécifier le port


##Après avoir installer tous les packets, il faut connecter la machine virtuelle 
    '''ssh [nom d'utilisateur]@[ip machine virtuel]

