---
title: "Docker on macOS"
created_at: 2018-01-18 10:00
kind: article
tags:
    - bash
    - docker
    - dlite
---

This is an update to a <%= link_to('former description', @items['/*/2017-10-22-running-docker-on-macos.*']) %> of how to get docker up and running with decent speed for local development.

## Remove Outdated Installation

If you followed my other description, use these steps to remove the old version of [`dlite`][dlite].

~~~ bash
$ sudo dlite uninstall
$ brew uninstall dlite
$ sudo rm /var/run/docker.sock
$ rm /etc/exports
~~~

Do the last step only when there is only one entry in your `/etc/exports` file. Otherwise locate the `dlite` entry and remove it manually.

## Install Latest dlite Version

I assume you have [Homebrew][brew] installed and you are familiar with it.

Install the required dependencies first.

~~~ bash
$ brew install libev docker
~~~

[Docker][docker] is obviously needed and `libev` is necessary for building the system for `dlite`.

Install the latest version of `dlite`.

~~~ bash
$ curl -OL https://github.com/nlf/dlite/releases/download/2.0.0-beta9/dlite
$ mv dlite /usr/local/bin/
$ chmod 0755 /usr/local/bin/dlite
~~~

Init and start it.

~~~ bash
$ dlite init
$ dlite start
~~~

Check if everything is working fine with `docker version`.

  [brew]: https://brew.sh
  [docker]: https://www.docker.com/
  [dlite]: https://github.com/nlf/dlite
