---
author: rs
title: Install Omada SDN Controller on Debian 12.8 
date: 2024-04-12 13:01:00 -0500 
categories: [linux,debian,omada]
tags: [linux, debian, omada, bookwork]
---



### MongoDB v4.4 End of Life

As of **February 29, 2024**, MongoDB v4.4 has reached end of life and is no longer supported by MongoDB. This guide and script example still uses MongoDB 4.4.  

The latest Omada Controller, **v5.14.32.3** (released on **November 1, 2024**), now supports **MongoDB 7**.

---

### Hardware Requirements for MongoDB 7

To run MongoDB 7, each host must meet the following requirements:

- **Disk Space**: 10 GB of free disk space plus additional space for MongoDB data.
- **RAM**: A minimum of 4 GB.

#### Processor Requirements for Intel x86_64 Architectures
MongoDB 7 requires the following minimum Intel x86_64 microarchitecture:

- **Core Processor**: Sandy Bridge or later
- **Celeron or Pentium Processor**: Tiger Lake or later

---  


### Install Script

**Download and Install omada_setup Script**
```bash
wget https://www.dbqrs.com/files/scripts/omada_setup.sh && chmod +x omada_setup.sh && ./omada_setup.sh
``` 
---
## or
---

### **Manually Run Commands as Root**
- If you have installed sudo or are using an OS such Ubuntu, prefix all commands with sudo.

Ensure the system is up-to-date, and reboot if necessary:
```bash
apt update && apt upgrade
```


Add the following export path to the end of the root user's `.bashrc` file:
```bash
nano /root/.bashrc
```
```bash
export PATH=/sbin:/bin:/usr/bin:/usr/sbin:/usr/local/sbin:/usr/local/bin
```


Apply the new bash settings:
```bash
source /root/.bashrc
```


Install `openjdk`, `curl`, `jsvc`, `wget`, and required OpenSSL libraries:
```bash
apt install openjdk-17-jre-headless curl jsvc wget
```
```bash
wget http://ftp.debian.org/debian/pool/main/o/openssl/libssl1.1_1.1.1w-0+deb11u1_amd64.deb -O libssl.deb && dpkg -i libssl.deb
```

Download and install MongoDB, then enable and start the service:
```bash
wget https://repo.mongodb.org/apt/debian/dists/buster/mongodb-org/4.4/main/binary-amd64/mongodb-org-server_4.4.29_amd64.deb -O mongodb.deb && dpkg -i mongodb.deb
```
```bash 
systemctl enable mongod && systemctl start mongod
```

Download and install the latest Omada SDN Controller version (as of November 01, 2024):
```bash
wget https://static.tp-link.com/upload/software/2024/202411/20241101/Omada_SDN_Controller_v5.14.32.3_linux_x64.deb -O omada.deb && dpkg -i omada.deb
```
---  
  
  
---

