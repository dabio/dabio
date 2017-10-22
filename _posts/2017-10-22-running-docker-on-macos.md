---
layout: post
title: "Running Docker on macOS"
date: 2017-10-22 19:55
tags:
    - bash
    - docker
    - dlite
---
I use the [docker][docker]+[dlite][dlite] method, which is fast and works fine for me. I haven't tried the official [macOS binaries][docker-mac] yet.

```bash
$ brew install docker dlite
$ sudo dlite install
$ dlite start
$ ssh docker@local.docker
```

If connecting is not working, reinstalling did the thing.

```bash
$ dlite stop
$ sudo dlite uninstall
$ rm /var/run/docker.sock
```

Connection should be fine now.

If docker fails with the error message "_Error response from daemon: client is newer than server (client API version: 1.24, server API version: 1.22)_", try setting the environment variable to the given server version `DOCKER_API_VERSION=1.22`.

  [docker-mac]: https://www.docker.com/docker-mac
  [docker]: https://www.docker.com/
  [dlite]: https://github.com/nlf/dlite
