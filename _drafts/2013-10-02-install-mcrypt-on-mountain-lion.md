---
layout: blog
title: "Install mcrypt on Mountain Lion"
date: 2013-10-02 14:16
category: blog
---

After following my last tutorial about [starting with Symfony on a new Mac](/blog/start-with-symfony-on-mountain-lion.html), you might struggle with an extension, a few bundles need: [mcrypt](http://mcrypt.sourceforge.net).

I presume you have [Homebrew](http://brew.sh) installed. If not, head over to my [tutorial](/blog/start-with-symfony-on-mountain-lion.html) and work your way through the process.

Install mcrypt as follows:

```bash
$ brew install mcrypt
```

Get your [PHP](http://php.net) version with `php -v`:

```bash
$ php -v
PHP 5.3.26 (cli) (built: Jul  7 2013 19:05:08)
Copyright (c) 1997-2013 The PHP Group
Zend Engine v2.3.0, Copyright (c) 1998-2013 Zend Technologies
$
```

I have PHP 5.3.26 installed. Now download your PHP here [www.php.net/get/php-5.3.26.tar.gz/from/a/mirror](www.php.net/get/php-5.3.26.tar.gz/from/a/mirror) (replace with your version) and extract it:

```bash
cd ~/Downloads && tar xfz php-5.3.26.tar.gz
```

Now compile the mcrypt PHP-extension.

```bash
cd php-5.3.26/ext/mcrypt/
phpize
./configure
make
sudo make install
echo "echo 'extension=\"mcrypt\"' >> /etc/php.ini" | sudo bash
```

Restart Apache `sudo apachectl restart` and the mcrypt extension should be installed as expected.
