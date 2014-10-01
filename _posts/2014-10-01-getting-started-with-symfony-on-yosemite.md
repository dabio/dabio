---
layout: post
title: "Getting Started with Symfony on Yosemite"
date: 2014-10-01 14:37:56
---

Apple just released the Golden Master of their newest OS X to registered beta users, which indicates that the public release of their system is just around the corner.

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
sudo cp /etc/php.ini.default /etc/php.ini
```

Open the config file `/etc/php.ini`, find the line that sets your timezone and update it correspondingly.

```ini
date.timezone = Europe/Berlin
```

Do not forget to remove the `;` at the beginning.

## Symfony

