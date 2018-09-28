---
title: "Create macOS Mojave USB Installer"
created_at: 2017-10-19
kind: article
tags:
    - macOS
    - usb
    - installer
    - high sierra
    - mojave
---

[Download the official image][app-store] from the app store and quit the installer.

Open your terminal and type the following command to create the usb. Use the name of your usb.

~~~bash
$ sudo /Applications/Install\ macOS\ Mojave.app/Contents/Resources/createinstallmedia \
    --volume /Volumes/[volume]
Password:
Ready to start.
To continue we need to erase the volume at /Volumes/Install macOS High Sierra.
If you wish to continue type (Y) then press return: Y
Erasing disk: 0%... 10%... 20%... 30%... 100%
Copying to disk: 0%... 10%... 20%... 30%... 40%... 50%... 60%... 70%... 80%... 90%... 100%
Making disk bootable...
Copying boot files...
Install media now available at "/Volumes/Install macOS Mojave"
~~~

  [app-store]: https://itunes.apple.com/app/macos-mojave/id1398502828?ls=1&mt=12
