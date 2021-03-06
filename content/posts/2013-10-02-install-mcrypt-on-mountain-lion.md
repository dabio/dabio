---
title: "Install mcrypt on Mountain Lion"
created_at: 2013-10-02 14:16
kind: article
tags:
    - php
    - mcrypt
---

After following my last tutorial about <%= link_to('starting with Symfony on a new Mac', @items['/*/2013-10-01-start-with-symfony-on-mountain-lion.*']) %>, you might struggle with an extension, a few bundles need: [mcrypt](http://mcrypt.sourceforge.net).

I presume you have [Homebrew][homebrew] installed. If not, head over to my <%= link_to('tutorial', @items['/*/2013-10-01-start-with-symfony-on-mountain-lion.*']) %> and work your way through the process.

Install mcrypt as follows:

~~~ sh
$ brew install mcrypt
~~~

Get your [PHP][php] version with `php -v`:

~~~ sh
$ php -v
PHP 5.3.26 (cli) (built: Jul  7 2013 19:05:08)
Copyright (c) 1997-2013 The PHP Group
Zend Engine v2.3.0, Copyright (c) 1998-2013 Zend Technologies
~~~

I have PHP 5.3.26 installed. Now download your PHP here [php.net/get/php-5.3.26.tar.gz/from/a/mirror][php-download-link] (replace with your version) and extract it:

~~~ sh
cd ~/Downloads && tar xfz php-5.3.26.tar.gz
~~~

Now compile the mcrypt PHP-extension.

~~~ sh
cd php-5.3.26/ext/mcrypt/
phpize
./configure
make
sudo make install
echo "echo 'extension=\"mcrypt.so\"' >> /etc/php.ini" | sudo bash
~~~

Restart Apache `sudo apachectl restart` and the mcrypt extension should be installed as expected.

  [php]: http://php.net
  [php-download-link]: http://www.php.net/get/php-5.3.26.tar.gz/from/a/mirror
  [homebrew]: http://brew.sh
