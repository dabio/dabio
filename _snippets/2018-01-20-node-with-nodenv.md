---
layout: snippet
title: "Node with nodenv"
tags:
    - node
    - node-build
    - nodenv
    - versions
---

Using [nodenv](https://github.com/nodenv/nodenv) has several advantages. One main advantage for my usage is that my development machine doesn't heat up on every new [Node.js](https://nodejs.org/en/)release because [Homebrew](https://brew.sh) compiles this version from scratch.

Here is how I have Node.js installed.

```bash
$ brew install node-build --without-autoconf --without-openssl --without-pkg-config
$ brew install nodenv --without-bash-extension
```

Now I can list and install every release I want.

```bash
$ nodenv install -l
$ nodenv install 9.4.0
```
