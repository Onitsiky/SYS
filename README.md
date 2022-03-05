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

# Configure Apache Virtual Hosts In Ubuntu and Debian
Configure name-based virtual hosts Before starting, the apache server must be installed 
Create web directory for each host create two virtual hosts, namely ostechnix1.lan and ostechnix2.lan. After, Let us create a directory for first virtual host ostechnix1.lan. This directory is required for storing the data of our virtual hosts. Open a Terminal and you need to switch to superuser mode.

        $ su
To do so, enter:

      mkdir -p /var/www/html/ostechnix1.lan/public_html
Likewise, create a directory for second virtual host ostechnix2.lan as shown below.

      mkdir -p /var/www/html/ostechnix2.lan/public_html
Next, set read permissions to the Apache root directory i.e /var/www/html/ using command:

         chmod -R 755 /var/www/html/
### Create demo web pages for each host Let us create a sample page for ostechnix1.lan site. To do so, run:

         nano vi /var/www/html/ostechnix1.lan/public_html/index.html
Likewise, create a sample page for ostechnix2.lan site:

        nano vi /var/www/html/ostechnix1.lan/public_html/index.html
Save and close the file. 
Create configuration file for each host Next, we need to create configuration files for each virtual host. First, let us do this for ostechnix1.lan site. Copy the default virtual host file called 000-default.conf contents to the new virtual host files like below.

     cp /etc/apache2/sites-available/000-default.conf     
     
     /etc/apache2/sites-available/ostechnix1.lan.conf
Please be mindful that you must save all configuration files with .conf extension at the end, otherwise it will not work. Now, modify the configuration files to match with our virtual hosts. Edit ostechnix.lan1.conf file:

        nano /etc/apache2/sites-available/ostechnix1.lan.conf
Edit/modify ServerAdmin, ServerName, ServerAlias and DocumentRoot values matches to virtual host.

<VirtualHost *:80>
 * The ServerName directive sets the request scheme, hostname and port that
 * the server uses to identify itself. This is used when creating
 * redirection URLs. In the context of virtual hosts, the ServerName
 * specifies what hostname must appear in the request's Host: header to
 * match this virtual host. For the default virtual host (this file) this
 * value is not decisive as it is used as a last resort host regardless.
 * However, you must set it for any further virtual host explicitly.
 *ServerName www.example.com

   ServerAdmin webmaster@ostechnix1.lan
   ServerName ostechnix1.lan
   ServerAlias www.ostechnix1.lan
   DocumentRoot /var/www/html/ostechnix1.lan/public_html
 Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
 error, crit, alert, emerg.
  It is also possible to configure the loglevel for particular
 modules, e.g.
 LogLevel info ssl:warn
ErrorLog ${APACHE_LOG_DIR}/error.log
 CustomLog ${APACHE_LOG_DIR}/access.log combined

# For most configuration files from conf-available/, which are
 * enabled or disabled at a global level, it is possible to
 * include a line for only one particular virtual host. For example the
 * following line enables the CGI configuration for this host only
 * after it has been globally disabled with "a2disconf".
 *Include conf-available/serve-cgi-bin.conf

    * </VirtualHost>
Save/close the file. 
    * Enable virtual host configuration files After making the necessary changes, disable the default virtual host config file i.e 000.default.conf, and enable all newly created virtual host config files as shown below.

        a2dissite 000-default.conf
        a2ensite ostechnix1.lan.conf
        Restart apache web server to take effect the changes.

        
          systemctl restart apache2
        

That's it. We have successfully configured virtual hosts in Apache.
