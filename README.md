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

    > Pour vérifier que Apache est bien installé , tapez sur la ligne de commande : 
    ```sh
        etc/init.d/apache2
    ```
# Configuration Apache (Linux)

* Tapez sur la ligne de commande : 
    ```sh
       nano /etc/apache2/apache2.conf
    ```
Les fichiers de configuration de apache se trouve dans : apache2.conf
* Ensuite vous allez modifier le repertoire dans lequel vous voulez mettre votre configuration
    ```sh
       nano /etc/apache2/apache2.conf
    ```
* Et apliquer la configuration sur : 
    ```sh
      /etc/apache2/site-enabled/000-default
    ```
* Et enfin redémarrer le service , apache :
    ```sh
      /etc/init.d/apache2 restart
    ```
