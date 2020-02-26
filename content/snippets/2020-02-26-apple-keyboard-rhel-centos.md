---
title: Apple Keyboard for Centos/RHEL8
created_at: 2020-02-26
kind: article
tags:
  - apple
  - keyboard
  - centos
  - rhel
---

~~~bash
echo "options hid_apple swap_opt_cmd=1\noptions iso_layout=0" | sudo tee -a /etc/modprobe.d/hid_apple.conf
sudo dracut -f
reboot
~~~
