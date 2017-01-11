---
layout: post
title: "Run gvt on Heroku"
date: 2017-01-11 12:43
draft: true
---
Currently [gvt](https://github.com/FiloSottile/gvt "gvt is the go vendoring tool for the GO15VENDOREXPERIMENT") is not on the [list of supported dependency managers](https://devcenter.heroku.com/articles/go-support#supported-dependency-vendor-managers "Supported Dependency/Vendor Managers") for using [Go](https://golang.org "The Go Programming Language") on [Heroku](https://www.heroku.com "Cloud Application Platform"). Here is a hack on how to get gvt projects running on Heroku.

gvt is my package manager of choice when using Go. gvt is based on gb-vendor which is part of [gb][gb], a manager supported by Heroku. gb was built at a pre Go 1.5 era, when Go did not support basic vendoring.

 [gb]: https://github.com/constabulary/gb "gb, the project based build tool for Go"

