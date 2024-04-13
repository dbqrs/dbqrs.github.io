---
author: rs
title: Install Omada SDN Controller on Debian 12.5
date: 2024-04-12 13:01:00 -0500 
categories: [linux,debian,omada]
tags: [linux, debian, omada, bookwork]
---

I have installed the omada controller on Debian 12.5 using the below method.  
**note: omada controller does not support anything higher than mongodb 4.4.x which is still being patched. Version 4.4.29 was released Feb 28, 2024.  

**These commands are all ran as root.**

#### make sure the system is update and reboot if necessary:
```bash
apt update && apt upgrade
``` 

#### add this export path to the end of the file of root's bashrc:
```bash 
nano /root/.bashrc
``` 
```bash
export PATH=/sbin:/bin:/usr/bin:/usr/sbin:/usr/local/sbin:/usr/local/bin
```

#### reload bash settings:
```bash
source /root/.bashrc
``` 

#### install required packagaes:
```bash
apt install openjdk-17-jre-headless curl jsvc wget
```
```bash
wget http://ftp.debian.org/debian/pool/main/o/openssl/libssl1.1_1.1.1w-0+deb11u1_amd64.deb -O libssl.deb && dpkg -i libssl.deb
```
 
#### install mongodb, enable mongodb on boot and start mongodb: 
```bash
wget https://repo.mongodb.org/apt/debian/dists/buster/mongodb-org/4.4/main/binary-amd64/mongodb-org-server_4.4.29_amd64.deb -O mongodb.deb && dpkg -i mongodb.deb
```
```bash 
systemctl enable mongod && systemctl start mongod
```
 
#### download the current version of the omada SDN controller as of April 12, 2024 and install:
```bash
wget https://static.tp-link.com/upload/software/2024/202402/20240227/Omada_SDN_Controller_v5.13.30.8_linux_x64.deb -O omada.deb && dpkg -i omada.deb
```