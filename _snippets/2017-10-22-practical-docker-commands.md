---
layout: snippet
title: "Practical Docker Commands"
tags:
    - bash
    - docker
    - fish
---

List of Docker commands that I use regularly. For Fish and Bash.

### Remove all Images

```bash
$ # fish
$ docker rmi -f (docker images -a -q)
$ # bash
$ docker rmi -f $(docker images -a -q)
```

### Remove all Containers

```bash
# fish
$ docker container rm (docker container ls -a -q)
# bash
$ docker container rm $(docker container ls -a -q)
```
