---
layout: snippet
title: "Create macOS High Sierra USB Installer"
tags:
    - macOS
    - usb
    - installer
---

[Download the official image][app-store] from the app store and quit the installer.

Open your terminal and type the following command to create the usb. Use the name of your usb.

```bash
$ sudo /Applications/Install\ macOS\ High\ Sierra.app/Contents/Resources/createinstallmedia \
    --volume /Volumes/[volume]
Password:
Ready to start.
To continue we need to erase the volume at /Volumes/[volume].
If you wish to continue type (Y) then press return: Y
Erasing Disk: 0%... 10%... 20%... 30%...100%...
Copying installer files to disk...
Copy complete.
Making disk bootable...
Copying boot files...
Copy complete.
Done.
```

  [app-store]: https://itunes.apple.com/app/macos-high-sierra/id1246284741?mt=12
