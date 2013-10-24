---
layout: post
title: "Install Symfony on OS X Mavericks"
date: 2013-10-23 17:59:56
category: posts
---

[Mavericks](http://www.apple.com/osx/) is out and my manual for [getting Symfony to run on Mountain Lion](/posts/start-with-symfony-on-mountain-lion.html) is already outdated. This guide is an update to the old manual.

![Fresh installed Mavericks](/images/blog/mavericks-start.jpg)

Apples newest version of OS X ships with a newer, but still not the latest stable version of [PHP][php]:

```sh
$ php -v
PHP 5.4.17 (cli) (built: Aug 25 2013 02:03:38) 
Copyright (c) 1997-2013 The PHP Group
Zend Engine v2.4.0, Copyright (c) 1998-2013 Zend Technologies
```

We start again with [downloading the latest version of Xcode][xcode-appstore] from the Mac App Store.

After installing, get the Command Line Developer Tools through the following command and follow the on-screen instructions.

```sh
$ xcode-select --install
```

## Homebrew

We need to get [Homebrew][homebrew]. Paste that at your terminal prompt.

```sh
$ ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
```

Run `brew doctor` to finish the installation of homebrew.

## Database

Which database you want to use is up to you. Sadly PHP on Mavericks does not ship with [PostgreSQL][postgresql] support, so I need to drop my preferred solution using [Postgres.app][postgresapp].

I will use [MariaDB][mariadb], which is an enhanced, drop-in replacement for MySQL. The installation with [Homebrew][homebrew] is quite easy:

```sh
$ brew install apple-gcc42
$ brew install mariadb
```

The `brew install apple-gcc42` command is needed because Mavericks does not ship with any compiler needed for installing MariaDB.

Start your fresh MariaDB with `mysql.server start` and test your connection with `mysql -uroot`. If you get a warm welcome, everything works as expected. Terminate the connection with `\q`.

## PHP

To use `php.ini` we need to activate it through copying it to `/etc/php.ini`.

```sh
$ sudo cp /etc/php.ini.default /etc/php.ini
```

Now open the file in your favorite editor and add your timezone.

```ini
date.timezone = Europe/Berlin
```

Choose your timezone accordingly and do not forget to remove the `;` in front of the line.

## Symfony

We are using [Composer][composer] to install [Symfony][symfony]:

```sh
$ cd
$ curl -sS https://getcomposer.org/installer | php
$ mv composer.phar /usr/local/bin/composer
```

Now get the latest Symfony version with:

```sh
$ composer create-project symfony/framework-standard-edition symfony/ 2.3.6
```

Answer the questions you get asked accordingly to your configuration (I just press enter as the prefilled settings are fine for my configuration). You also might need to replace `2.3.6` with the current version of symfony.

Don't forget to set the writing permissions to the cache and log directories.

```sh
$ cd symfony
$ chmod 0777 app/{cache,logs}
$ chmod +a "`whoami` allow delete,write,append,file_inherit,directory_inherit" app/{cache,logs}
```

Start the built-in web server.

```sh
$ php app/console server:run
```

The URL for your application will be [localhost:8000/app_dev.php](http://localhost:8000/app_dev.php). 

![Start site of a newly installed symfony](/images/blog/symfony-start.png)

Check if symfony complains about some missing extensions with [localhost:8000/config.php](http://localhost:8000/config.php).

![Config script](/images/blog/symfony-config.png)

Mine is missing the `intl` and `APC` extension which I install through `PECL` or `PEAR`.

Stop the built-in server with `ctrl-c`.

## PECL and PEAR

Mavericks ships with `PECL` and `PEAR`, but we need to activate both:

```sh
$ sudo php /usr/lib/php/install-pear-nozlib.phar
$ pear config-set php_ini /private/etc/php.ini
$ pecl config-set php_ini /private/etc/php.ini
$ sudo pear upgrade-all
$ sudo pear channel-update pear.php.net
$ sudo pecl channel-update pecl.php.net
```

Start installing `intl`:

```sh
$ brew install autoconf icu4c
$ sudo pecl install intl
```

When asked for the path to the ICO libraries and headers, answer with `/usr/local/opt/icu4c`.

And now `APC`:

```sh
$ brew install pcre
$ sudo ln -s /usr/local/include/pcre.h /usr/include/
$ sudo pecl install apc
```

I answered all questions while the install process with the default answers (just pressed enter).

Start the server again `php app/console server:run` and head over to [localhost:8000/config.php](http://localhost:8000/config.php) to see if our warnings are gone.

![Config script done](/images/blog/symfony-config-finished.png)

None? Well, we are done. You can start configuring and developing your application.

## Xdebug

If you like to add [Xdebug support][xdebug], just add the following lines to your `/etc/php.ini` and restart your development server.

```ini
zend_extension=/usr/lib/php/extensions/no-debug-non-zts-20100525/xdebug.so
xdebug.remote_enable=On
```

  [apache]: http://httpd.apache.org
  [php]: http://php.net
  [xcode-appstore]: https://itunes.apple.com/de/app/xcode/id497799835?mt=12
  [homebrew]: http://brew.sh
  [postgresql]: http://www.postgresql.org
  [postgresapp]: http://postgresapp.com
  [mariadb]: https://mariadb.org
  [composer]: http://getcomposer.org
  [symfony]: http://symfony.com
  [xdebug]: http://xdebug.org

