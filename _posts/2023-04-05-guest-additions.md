---
author: rs
title: Install Virtualbox Guest Additions
date: 2023-04-05 01:00:00 -0500 
categories: [linux, virtualbox]
tags: [linux,debian,fedora,ubuntu,virtualbox] 
---

### VBoxLinuxAdditions.run

**Debian** 
```bash
sudo apt install build-essential module-assistant dkms linux-headers-$(uname -r) 
```
```bash
m-a prepare
```

**Ubuntu**
```bash
sudo apt install build-essential dkms linux-headers-$(uname -r)
```

**Fedora**
```bash
sudo dnf install kernel-headers kernel-devel dkms tar bzip2 kernel-devel-$(uname -r) kernel-headers perl gcc make elfutils-libelf-devel 
```
