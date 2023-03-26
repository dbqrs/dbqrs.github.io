---
author: rs
title: USB Serial Cable Notes
date: 2023-03-10 01:00:00 -0500 
categories: [Linux]
tags: [linux,usb,serial,console] 
---

To use USB to serial adapter, add user to dialout group
```bash
sudo usermod -aG dialout USERNAME
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
