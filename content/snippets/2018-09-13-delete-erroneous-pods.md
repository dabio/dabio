---
title: "Delete Erroneuos Kubernetes Pods"
created_at: 2018-09-13
kind: article
tags:
    - bash
    - kubernetes
    - pod
---

Get the list of erroneuos pods:

~~~ bash
$ kubectl get po -n NAMESPACE | grep Error
~~~

Delete all of them:

~~~ bash
$ kubectl get po -n NAMESPACE | grep Error | cut -d' ' -f1 | xargs kubectl delete po -n NAMESPACE
~~~
