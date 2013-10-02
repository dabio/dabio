---
layout: blog
title: "Start with Symfony on Mountain Lion"
date: 2013-10-01 22:43
category: blog
---

Start developing [Symfony](http://symfony.com/) on a Mac is quite easy. Mountain Lion ships with some of the required libraries, but a few are hidden in the depth of the system.

This is a guide with shows you how to get [Symfony](http://symfony.com/) running on  Mac OS X Mountain Lion (10.8 that is).

## Xcode

First and foremost you need to install Xcode. Don't worry you can download it for free at [the App Store](https://itunes.apple.com/de/app/xcode/id497799835?mt=12).

After downloading and installation, start Xcode and go to downloads area in the preferences (⌘, > Downloads) and install the Command Line Tools.

![Xcode Preferences Panel](/images/blog/xcode-downloads.png)

## Homebrew

[Homebrew](http://brew.sh) is a package manager which helps us installing and configuring a few needed packages for our development platform.

Paste the following command into the terminal to install [Homebrew](http://brew.sh):

```bash
$ ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
```

After that you need to run `brew doctor` to finalize you installation.

## Database

You can decide which database you would like to use. Running [PostgreSQL](http://www.postgresql.org) is far easier than running [MySQL](http://www.mysql.com). Just use the [Postgres.app](http://postgresapp.com).

If you prefer running MySQL I'd like to refer to [MariaDB](https://mariadb.org) an enhanced, drop-in replacement for MySQL. You can install it with [Homebrew](http://brew.sh):

```bash
$ brew install mariadb
```

If you get errors that no compilers are available install the `apple-gcc42`compiler and re-run `brew install mariadb`.

```bash
$ brew install apple-gcc42
```

For now, just start your freshly installed MariaDB with `mysql.server start` and test your connection with `mysql -uroot`. If you get a warm welcome, everything works as expected. Terminate your connection with `\q`.

## Apache

Mountain Lion ships with Apache, but it is not running per default. You can start with `sudo apachectl start` and stop through `sudo apachectl stop`. But first we need to change some settings.

Open the file `/private/etc/apache2/httpd.conf` in your favorite editor and remove the `#` infront of theese two lines:

```apache
#Include /private/etc/apache2/extra/httpd-vhosts.conf
…
#LoadModule php5_module libexec/apache2/libphp5.so
```

Now open the file `/private/etc/apache2/extra/httpd-vhosts.conf` and remove all `<VirtualHost>` instances and add the following:

```apache
<Directory "/Users/[username]/symfony">
    Options Indexes FollowSymLinks MultiViews
    AllowOverride All
    Order allow,deny
    Allow from all
</Directory>

<VirtualHost *:80>
    DocumentRoot "/Users/[username]/symfony/web"
    ServerName dev.symfony
    ErrorLog "/Users/[username]/symfony/app/logs/apache_error.log"
    CustomLog "/Users/[username]/symfony/app/logs/apache_access.log" common
</VirtualHost>
```

Replace `[username]` with your actual username. If you don't know it, start a new terminal and type `whoami`, which outputs your username.

Open your hosts file located at `/etc/hosts` and add a new entry for your `ServerName` specified in the Apache configuration above.

```
127.0.0.1   dev.symfony
```

We do not start Apache yet.

## PHP

You need to copy the default `php.ini` file to the correct place and add `detect_unicode = Off` to the end of the file.

```bash
$ sudo cp /etc/php.ini.default /etc/php.ini
$ echo "echo 'detect_unicode = Off' >> /etc/php.ini" | sudo bash
```

Open the file `/etc/php.ini`, search for `date.timezone` and set your timezone accordingly.

```
date.timezone = Europe/Berlin
```

Don't forget to remove the `;` at the beginning of the file. Save the file.

## Symfony

We use [Composer](http://getcomposer.org) to install [Symfony](http://symfony.com/). Start the install process:

```bash
$ cd
$ curl -sS https://getcomposer.org/installer | php
$ mv composer.phar /usr/local/bin/composer
```

Now you can run get the current Symfony version with the command:

```bash
$ composer create-project symfony/framework-standard-edition symfony/ 2.3.5
$ cd symfony
$ chmod 0777 app/{logs,cache}
```

Answer the questions you get asked accordingly to your configuration. You also might need to replace `2.3.5` with the current version of symfony.

You now have a fresh installation of your Symfony in your home directory.

Now start Apache with `sudo apachectl start`.

## PECL and PEAR

Head over to your browser and type [http://dev.sympfony/config.php](http://dev.symfony/config.php) (or the ServerName you set above).

Correct all open major problems if there are some left.

Install PECL and PEAR:

```bash
$ sudo php /usr/lib/php/install-pear-nozlib.phar
$ pear config-set php_ini /private/etc/php.ini
$ pecl config-set php_ini /private/etc/php.ini
$ sudo pear upgrade-all
$ sudo pear channel-update pear.php.net
$ sudo pecl channel-update pecl.php.net
```

Install the open recommendation `intl` and the PHP accelerator `apc`:

```bash
$ brew install icu4c
$ sudo pecl install intl
```

Answer with the path `/usr/local/opt/icu4c` when asked for the ICU libraries and headers.

```bash
$ brew install pcre
$ sudo ln -s /usr/local/include/pcre.h /usr/include/
$ sudo pecl install apc
````

Restart Apache `sudo apachectl restart`.

Reload your browser [http://dev.sympfony/config.php](http://dev.symfony/config.php) and watch for open recommendations.
