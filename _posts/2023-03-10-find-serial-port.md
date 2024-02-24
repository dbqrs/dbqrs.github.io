---
author: rs
title: USB to Serial Cable Notes
date: 2023-03-10 01:00:00 -0500 
categories: [Linux]
tags: [linux,usb,serial,console] 
---

To use USB to serial adapter, add user to dialout group  
*Ubuntu:*
```bash
sudo usermod -aG dialout USERNAME
```  
*Fedora:*
```bash
sudo usermod -a -G tty USERNAME
```

Found this in a random note for Ubuntu:
```bash
sudo chmod a+rw /dev/ttyUSB0
```

find serial ports  
```bash
dmesg | grep tty or dmesg | grep ttyUSB
```
```example
$ dmesg | grep ttyUSB
[167395.675741] usb 1-6: MCT U232 converter now attached to ttyUSB0
```  

Use screen to connect to a session 
```bash
screen /dev/ttyUSB0
```
