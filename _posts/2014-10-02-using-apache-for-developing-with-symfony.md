---
layout: post
title: "Using Apache for Developing with Symfony"
date: 2014-10-02 11:49
redirect_from: "/posts/using-apache-for-developing-with-symfony.html"
tags:
    - symfony
    - apache
    - php
    - localhost
---

After [getting Symfony to work]({% post_url 2014-10-01-getting-started-with-symfony-on-yosemite %}), we might want to switch away from the build in PHP web server, to a more reliable one. I'll use the [Apache server](http://httpd.apache.org) because it comes with the latest OS X version.

```bash
$ apachectl -v
Server version: Apache/2.4.9 (Unix)
Server built:   Sep  9 2014 14:48:20
```

Open the apache config file located at `/etc/apache2/httpd.conf` and and remove the comment (`#`) before the following three lines:

```apache
LoadModule php5_module libexec/apache2/libphp5.so           (line ~169)
Include /private/etc/apache2/extra/httpd-vhosts.conf        (line ~499)
Include /private/etc/apache2/extra/httpd-default.conf       (line ~508)
```

Save and close the file. Open the `vhost` configuration file located at `/etc/apache/extra/httpd-vhosts.conf`. Remove everything and add the following configurations:

```apache
<VirtualHost *:80>
    DocumentRoot "/Library/WebServer/Documents"
    ErrorLog "/private/var/log/apache2/default.error.log"
    CustomLog "/private/var/log/apache2/default.access.log" common
</VirtualHost>

<VirtualHost *:80>
    ServerName dev.symfony

    DocumentRoot "/Users/[username]/symfony/web/"
    <Directory "/Users/[username]/symfony/web/">
        Options Indexes FollowSymlinks MultiViews
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog "/Users/[username]/symfony/app/logs/apache.error.log"
    CustomLog "/Users/[username]/symfony/app/logs/apache.access.log" common
</VirtualHost>
```

Do not forget to replace your `[username]` or change your path accordingly.

This configuration adds two new virtual hosts. One for [localhost](http://localhost) and one for [dev.symfony](http://dev.symfony). When you start your apache with `sudo apachectl start` the first one should work out of the box and you should get a *It works!* back.

For the second entry you need to edit your `/etc/hosts` file and add the new domain name:

```
127.0.0.1       localhost dev.symfony
```

Open [dev.symfony](http://dev.symfony) in your browser and you can access your symfony installation (or [dev.symfony/config.php](http://dev.symfony/config.php) if you have a [fresh installation of symfony]({% post_url 2014-10-01-getting-started-with-symfony-on-yosemite %})).
