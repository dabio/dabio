---
layout: post
title: "Run gvt on Heroku"
date: 2017-01-11 12:43
draft: true
---
Currently [gvt][gvt] is not on the [list of supported dependency managers][heroku-go] for using [Go] on [Heroku][heroku]. Follow the basic rules to make your project appear to be a [gb][gb] project to get gvt projects running on Heroku.

gvt is my package manager of choice when using Go. gvt is based on gb-vendor which is part of [gb][gb]. gb was built at a pre Go 1.5 era, when Go did not support basic vendoring. gb is supported by the official Heroku buildpack. The buildpack detects the file structure of your project and decides which dependency manager to use.

If you bring your project into the following file structure, you can run go apps on Heroku using gvt.

```bash
dan@case ~/g/s/g/d/go-gvt> tree
.
├── Procfile
├── src
│   └── web
│       └── web.go
└── vendor
    ├── github.com
    │   └── [your dependencies]
    ├── manifest
    └── src -> ../vendor
```

A `src/[dir]/` directory with your go files and a static link inside the `vendor/` folder are required. Heroku will detect a [gb][gb] project, build and run your app on their platform.

Find an [example project on GitHub][go-gvt]. 

 [gvt]: https://github.com/FiloSottile/gvt "gvt is the go vendoring tool for the GO15VENDOREXPERIMENT"
 [heroku-go]: https://devcenter.heroku.com/articles/go-support#supported-dependency-vendor-managers "Supported Dependency/Vendor Managers"
 [go]: https://golang.org "The Go Programming Language"
 [heroku]: https://www.heroku.com "Cloud Application Platform"
 [gb]: https://github.com/constabulary/gb "gb, the project based build tool for Go"
 [go-gvt]: https://github.com/dabio/heroku-go-gvt "Make gvt work on Heroku"
