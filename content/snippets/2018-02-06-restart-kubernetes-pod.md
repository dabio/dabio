---
title: "Restart Kubernetes Pod"
created_at: 2018-02-06
kind: article
tags:
    - bash
    - kubernetes
---

~~~ bash
$ kubectl get pod POD -n NAMSESPACE -o yaml | kubectl replace --force -f -
~~~
