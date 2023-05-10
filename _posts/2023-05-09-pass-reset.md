---
author: rs
title: Reset Admin Pass
date: 2023-05-08 01:00:00 -0500 
categories: [windows]
tags: [windows, password]
---

in directory \windows\system32> ren Utilman.exe Utilman.bak

copy cmd.exe Utilman.exe

reboot

net user administrator newpassword
