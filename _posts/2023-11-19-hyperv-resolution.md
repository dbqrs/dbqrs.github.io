---
author: rs
title: Set Ubuntu 22.04 Resolution in Hyper-V
date: 2023-11-19 02:00:00 -0500 
categories: [virtualization,linux,hyper-v]
tags: [ubuntu,hyper-v,resolution]
---

Here are two ways to set the resolution of Ubuntu 22.04, when virtualizing in Hyper-V

**Method 1**

Run this command in PoweShell. **note:**Change Ubuntu to the name of your virtual machine. 

```powershell
set-vmvideo Ubuntu -horizontalresolution:1920 -verticalresolution:1080 -resolutiontype single
```

Scaling can also be set in bash uing this command.

```bash
gsettings set org.gnome.desktop.interface scaling-factor 2
```


**Method 2**

Edit grub

```bash
sudo nano /etc/default/grub
```

Modify GRUB_CMDLINE_LINUX_DEFAULT= with video=hyperv_fb:1920x1080
note: I usually remove quiet splash.

```bash
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash video=hyperv_fb:1920x1080"
```

Finally update grub and install linux-image-extra-virtual

```bash
sudo update-grub && sudo apt install linux-image-extra-virtual -y
```

Finally reboot.