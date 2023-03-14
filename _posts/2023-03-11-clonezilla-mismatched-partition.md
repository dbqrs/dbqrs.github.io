---
author: rs
title: Clonezilla mismatched GPT and MBR partition error
date: 2023-03-11 01:00:00 -0500 
categories: [Linux, Data Backup]
tags: [clonezilla,mismatched] 
---

## Clonezilla mismatched GPT and MBR partition error

go to  command line and enter 
```bash
sudo gdisk /dev/sda
```

Found valid MBR and GPT. Which do you want to use?
 1 – MBR
 2 – GPT
 3 – Create blank GPT

Select: **1**

Command (? for help): **x**

Expert command (? for help): **z**
    
About to wipe out GPT on /dev/sda. Proceed? (Y/N): **y**

GPT data structures destroyed! You may now partition the disk using fdisk or other utilities.
Blank out MBR? (Y/N): **n**

