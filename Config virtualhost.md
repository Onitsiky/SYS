#Configure Apache Virtual Hosts In Ubuntu and Debian
##Configure name-based virtual hosts
Before starting, the apache server must be installed
###Create web directory for each host
create two virtual hosts, namely ostechnix1.lan and ostechnix2.lan.
After, Let us create a directory for first virtual host ostechnix1.lan. This directory is required for storing the data of our virtual hosts.
Open a Terminal and you need to switch to superuser mode.
```
$ su
```
To do so, enter:
```
# mkdir -p /var/www/html/ostechnix1.lan/public_html
```
Likewise, create a directory for second virtual host ostechnix2.lan as shown below.
```
# mkdir -p /var/www/html/ostechnix2.lan/public_html
```
Next, set read permissions to the Apache root directory i.e /var/www/html/ using command:
```
# chmod -R 755 /var/www/html/
```
###Create demo web pages for each host
Let us create a sample page for ostechnix1.lan site. To do so, run:
```
# nano vi /var/www/html/ostechnix1.lan/public_html/index.html
```
Likewise, create a sample page for ostechnix2.lan site:
```
# nano vi /var/www/html/ostechnix1.lan/public_html/index.html
```
Save and close the file.
###Create configuration file for each host
Next, we need to create configuration files for each virtual host. First, let us do this for ostechnix1.lan site.
Copy the default virtual host file called 000-default.conf contents to the new virtual host files like below.
```
# cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/ostechnix1.lan.conf
```
Please be mindful that you must save all configuration files with .conf extension at the end, otherwise it will not work.
Now, modify the configuration files to match with our virtual hosts.
Edit ostechnix.lan1.conf file:
```
# nano /etc/apache2/sites-available/ostechnix1.lan.conf
```
Edit/modify ServerAdmin, ServerName, ServerAlias and DocumentRoot values matches to virtual host.
```
<VirtualHost *:80>
 # The ServerName directive sets the request scheme, hostname and port that
 # the server uses to identify itself. This is used when creating
 # redirection URLs. In the context of virtual hosts, the ServerName
 # specifies what hostname must appear in the request's Host: header to
 # match this virtual host. For the default virtual host (this file) this
 # value is not decisive as it is used as a last resort host regardless.
 # However, you must set it for any further virtual host explicitly.
 #ServerName www.example.com

   ServerAdmin webmaster@ostechnix1.lan
   ServerName ostechnix1.lan
   ServerAlias www.ostechnix1.lan
   DocumentRoot /var/www/html/ostechnix1.lan/public_html
# Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
 # error, crit, alert, emerg.
 # It is also possible to configure the loglevel for particular
 # modules, e.g.
 #LogLevel info ssl:warn
ErrorLog ${APACHE_LOG_DIR}/error.log
 CustomLog ${APACHE_LOG_DIR}/access.log combined

# For most configuration files from conf-available/, which are
 # enabled or disabled at a global level, it is possible to
 # include a line for only one particular virtual host. For example the
 # following line enables the CGI configuration for this host only
 # after it has been globally disabled with "a2disconf".
 #Include conf-available/serve-cgi-bin.conf
</VirtualHost>
```
Save/close the file.
###Enable virtual host configuration files
After making the necessary changes, disable the default virtual host config file i.e 000.default.conf, and enable all newly created virtual host config files as shown below.
```
# a2dissite 000-default.conf
# a2ensite ostechnix1.lan.conf
```
Restart apache web server to take effect the changes.
```
# systemctl restart apache2
```
That's it. We have successfully configured virtual hosts in Apache. 