---
title: "Store ssh key in Keychain"
created_at: 2017-10-21
kind: article
tags:
    - bash
    - terminal
    - ssh
---

~~~bash
ssh-add -K ~/.ssh/id_rsa
~~~

Add this to your `~/.ssh/config` file:

~~~
Host *
    UseKeychain yes
    AddKeysToAgent yes
    IdentityFile ~/.ssh/id_rsa
~~~
