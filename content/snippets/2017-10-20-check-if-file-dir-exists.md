---
title: "Check if File or Directory Exists"
created_at: 2017-10-20
kind: article
tags:
    - bash
    - terminal
---

For files:

~~~bash
#!/usr/bin/env bash
if [ -e x.txt ]; then
    echo "file exists"
else
    echo "file is missing"
fi
~~~

For directories:

~~~bash
#!/usr/bin/env bash
if [ -d "dir" ]; then
    echo "dir exists"
else
    echo "dir is missing"
fi
~~~
