---
layout: post
title: "Getting Started with Symfony on Yosemite"
date: 2014-10-01 14:37:56
tags:
    - symfony
    - macOS
    - homebrew
---

Apple just released the Golden Master of their newest OS X to registered beta users, which indicates that the public release of their system is just around the corner.

![Fresh installed Yosemite](/images/blog/yosemite.png)

I'll continue my series for giving you a step by step instruction to install [Symfony](http://symfony.com) on OS X 10.10.

## Install Xcode

First of all, you need to install [Xcode from the App Store](https://itunes.apple.com/de/app/xcode/id497799835?mt=12). That will take a while. When done start your terminal and install the command line tools:

```bash
$ xcode-select --install
```

Follow the on screen instruction.

## Homebrew

[Homebrew](http://brew.sh/) is the package manager of my choice and is required to install our database. The installation is just a simple command for your terminal:

```bash
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Follow the instructions and complete the installation with `brew doctor`.

## Database

Yosemites [PHP](http://php.net) comes support for MySQL. I'll use the drop in replacement [MariaDB](https://mariadb.org) which can be installed with Homebrew.

```bash
$ brew install mariadb
```

Start your fresh installed server with `mysql.server start` and connect with `mysql -uroot`. If you are greeted with the MariaDB prompt, everything went as expected. You can terminate the connection with `\q`.

## PHP

Yosemite ships with [PHP](http://php.net).

```bash
$ php -v
PHP 5.5.14 (cli) (built: Sep  9 2014 19:09:25)
Copyright (c) 1997-2014 The PHP Group
Zend Engine v2.5.0, Copyright (c) 1998-2014 Zend Technologies
```

We just need to move the configuration file to the right spot and update the timezone.

```bash
$ sudo cp /etc/php.ini.default /etc/php.ini
```

Open the config file `/etc/php.ini`, find the line that sets your timezone and update it correspondingly.

```ini
date.timezone = Europe/Berlin
```

Do not forget to remove the `;` at the beginning.

## Symfony

We use [Composer](https://getcomposer.org) to install [Symfony](http://symfony.com).

```bash
$ cd
$ curl -sS https://getcomposer.org/installer | php
$ mv composer.phar /usr/local/bin/composer
```

Now we are ready to install [Symfony](http://symfony.com).

```bash
$ composer create-project symfony/framework-standard-edition symfony/ "2.5.*"
```

Answer the questions (I just press enter when asked) and set the the writing permissions to the `log/` and `cache/` directories.

```bash
$ cd symfony
$ chmod 0777 app/{cache,logs}
$ chmod +a "`whoami` allow delete,write,append,file_inherit,directory_inherit" app/{cache,logs}
```

Start the build-in webserver and open your browser at [localhost:8000/config.php](http://localhost:8000/config.php).

```bash
$ php app/console server:run
```

![Symfony is working!](/images/blog/yosemite-symfony-start.png)

Great. Symfony now runs at your local machine. But Symfony recommends us to install _intl_ and a _PHP accelerator_. Stop your server with `ctrl+c`.

Yosemite ships with OPcache, which just needs to get activated. Open `/etc/php.ini` and add `zend_extension=opcache.so`. Load the server again (`php app/console server:run`) and visit the [Symfony Configuration site](http://localhost:8000/config.php). Only one recommendation is left: _intl_.

## Intl

We want to install the `intl` extension with `pecl`. [PECL](http://pecl.php.net) is already shipped with Yosemite, but needs to get activated:

```bash
$ sudo php /usr/lib/php/install-pear-nozlib.phar
$ pear config-set php_ini /private/etc/php.ini
$ pecl config-set php_ini /private/etc/php.ini
$ sudo pear upgrade-all
$ sudo pear channel-update pear.php.net
$ sudo pecl channel-update pecl.php.net
```

We need `autoconf` and `icu4c` for `intl`. Install them:

```bash
$ brew install autoconf icu4c
$ sudo pecl install intl
```

When asked for the path to the ICO libraries and headers, answer with `/usr/local/opt/icu4c`.

Start your Symfony server again `php app/console server:run` and head over to [localhost:8000/config.php](http://localhost:8000/config.php) to see if our warnings are gone.

![Symfony works now with all requirements.](/images/blog/yosemite-symfony-success.png)

Now we are done and can start developing our next symfony application.

## Xdebug

If you like to add [Xdebug support](http://xdebug.org), just add the following lines to your `/etc/php.ini` and restart your development server.

```ini
zend_extension=xdebug.so
xdebug.remote_enable=On
```

## Furter Readings

If you need [mcrypt](http://mcrypt.sourceforge.net), I recommend to read my [guide on installing mcrypt on Mountain Lion]({% post_url 2013-10-02-install-mcrypt-on-mountain-lion %}). Just replace the PHP versions accordingly.

If you like to use [Apache server](http://httpd.apache.org) you can read my instruction on how to use [Apache for developing with symfony]({% post_url 2014-10-02-using-apache-for-developing-with-symfony %}).
