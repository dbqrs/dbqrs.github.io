---
author: rs
title: Install UniFi Controller on Debian 12
date: 2024-01-13 13:01:00 -0500 
categories: [debian, unifi]
tags: [linux, debian, bookworm, unifi]
---

### Install LibSSL, MongoDB and OpenJDK

If not already installed, install sudo and add your username to the sudo group.
```bash
/sbin/adduser USERNAME sudo
```

Download and install LibSSL 1.1.1 needed for MongoDB
```bash
wget http://ftp.debian.org/debian/pool/main/o/openssl/libssl1.1_1.1.1w-0+deb11u1_amd64.deb -O libssl.deb && sudo dpkg -i libssl.deb
```

Download and install MongoDB 4.4.27 - current highest version supported UniFi Controller 8.0
```bash
wget https://repo.mongodb.org/apt/debian/dists/buster/mongodb-org/4.4/main/binary-amd64/mongodb-org-server_4.4.27_amd64.deb -O mongodb.deb && sudo dpkg -i mongodb.deb
``` 

Enable and start MongoDB
```bash
sudo systemctl enable mongodb && sudo systemctl start mongodb
```

Install the OpenJDK 17 runtime needed by the UniFi Controller 
```bash
sudo apt install openjdk-17-jre-headless
```
  
  
### Install UniFi Controller

Add UniFi Repository
```bash
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/ubiquiti-archive-keyring.gpg] https://www.ui.com/downloads/unifi/debian stable ubiquiti' | sudo tee /etc/apt/sources.list.d/100-ubnt-unifi.list >/dev/null
```

Add GPG key for UniFi Repository
```bash
curl https://dl.ui.com/unifi/unifi-repo.gpg | sudo tee /usr/share/keyrings/ubiquiti-archive-keyring.gpg >/dev/null
```

Update APT and Install
```bash
sudo apt update && sudo apt install unifi
```

Access UniFi Controller 
https://IPADDRESS:8443





