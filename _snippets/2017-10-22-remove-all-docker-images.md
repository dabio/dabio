---
layout: snippet
title: "Remove all Docker Images"
tags:
    - bash
    - docker
    - fish
---

### Fish shell

```bash
$ docker rmi -f (docker images -a -q)
```

### Bash

```bash
$ docker rmi -f $(docker images -a -q)
```
