# Serveur HTTP Apache 2

Un serveur HTTP permet à un site web de communiquer avec un navigateur en utilisant le protocole HTTP(S) et ses extensions (WebDAV, etc.). Apache est probablement le serveur HTTP le plus populaire. C'est donc lui qui met à disposition la plupart des sites Web du WWW.
Il est produit par la Apache Software Foundation. C'est un logiciel libre fourni sous la licence spécifique Apache.

On utilise généralement Apache en conjonction avec d'autres logiciels, permettant d'interpréter du code et d'accéder à des bases de données. Le cas le plus courant est celui d'un serveur LAMP (Linux Apache MySQL PHP).

# Installation du serveur Apache

## 1 - Sous Fedora/CentOS/Red Hat Enterprise Linux

### Ici nous allons installer Apache HTTPD sur Fedora

* Installation des packages HTTPD

    ```sh
        sudo dnf installer httpd -y
     ```

* Démarrage du service HTTPD

    ```sh
        sudo systemctl démarrer httpd.service
    ```

* À la suite de cette installation votre serveur doit fonctionner et être accessible à l'adresse <http://localhost>

## 2 - Sous Ubuntu et/ou Debian

* Installation des packages :

   ```sh
        sudo apt install apache2
   ```

* Pour vérifier que Apache est bien installé , tapez sur la ligne de commande :

    ```sh
        etc/init.d/apache2
    ```

* Démarrage du service :

    ```sh
        sudo service apache2 start
    ```

* À la suite de cette installation votre serveur doit fonctionner et être accessible à l'adresse <http://localhost>

## 3-Lancement

 Apache 2 se lance automatiquement dès son installation, et se relance automatiquement à chaque démarrage. C'est l'idéal pour un serveur qui doit continuellement fournir du contenu en ligne, mais pour un serveur de test (on dit de développement) on peut éventuellement désirer un comportement différent.

### Empêcher Apache de démarrer automatiquement

Pour empêcher cela :

```sh
         sudo systemctl disable apache2
```

### Réactiver le démarrage automatique

Pour de nouveau relancer Apache automatiquement au démarrage de la machine, c'est simple :

```sh
         sudo systemctl enable apache2
```

### Autres commandes utiles

Pour arrêter apache2 :

```sh
            sudo systemctl stop apache2
```

Pour lancer apache2 :

```sh
            sudo systemctl start apache2
```

Pour relancer apache2 :

```sh
            sudo systemctl restart apache2
```

Pour recharger la configuration d'apache2 :

```sh
            sudo systemctl reload apache2
```

Pour voir la version d'Apache utilisée :

```sh
            sudo apache2ctl -v
```

Pour tester l'ensemble de la configuration d'Apache :

```sh
            sudo apache2ctl -t
```

Pour tester la configuration des hôtes virtuels :

```sh
            sudo apache2ctl -t -D DUMP_VHOSTS
```

Pour voir les modules d'Apache chargés :

```sh
            sudo apache2ctl -M
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
      /etc/apache2/sites-enabled/000-default
    ```

* Et enfin redémarrer le service , apache :

    ```sh
      /etc/init.d/apache2 restart
    ```
# Configuration de virtualhost sur VirtualBox
* Entrer dans configuration
* Entrer dans Réseau
* Puis changer le pont d'accès réseau en NAT
* Ajouter un port de redirection en utilisant l'ip 127.0.0.1 et le port 8080.

