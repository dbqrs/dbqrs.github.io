---
author: rs
title: Yaesu FT-891 Cat Control
date: 2023-03-30 01:00:00 -0500 
categories: [Radio]
tags: [radio,yaesu,ft891,catcontrol] 
---

Usually the cat control on most rigs is just plain serial so you should be able to get the serial port of the radio like this: unplug the radio, run ls /dev/tty*, plug in the radio, then wait about 2 seconds, run the command again and write down the new device that pops up. It will probably be something like /dev/ttyAMA0 or /dev/ttyUSB0