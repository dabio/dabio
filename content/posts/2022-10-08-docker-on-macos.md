---
title: "Docker on macOS"
created_at: 2022-10-08 10:00
kind: article
tags:
    - bash
    - docker
    - colima
    - homebrew
    - brew
---

You can either use the [all in one installer provided by Docker][docker] or use this manual where you manage everything via [Homebrew][brew].

## Install Components

Assuming you have [Homebrew][brew] up and running, install [Colima][colima] and the docker cli.

~~~ bash
$ brew install colima docker
~~~

Start the colima VM. Initially the VM gets downloaded. You can check the status afterwards.

~~~ bash
$ colima start
$ colima status
~~~

Docker is now ready to use. Check with `docker info` or `docker ps`.

  [brew]: https://brew.sh
  [docker]: https://www.docker.com/get-started/
  [colima]: https://github.com/abiosoft/colima
