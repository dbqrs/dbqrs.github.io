---
author: rs
title: Install Wazuh on Ubunutu 22.04 
date: 2023-11-19 02:00:00 -0500 
categories: [siem]
tags: [ubuntu,siem,wazuh]
image: https://wazuh.com/uploads/2016/04/wazuh-standard-featured-picture.png
---



Install depencies.
```bash
sudo apt update && sudo apt install curl apt-transport-https unzip wget libcap2-bin software-properties-common lsb-release gnupg2
```

Install Wazuh. note: Check the current version of Wazuh and adjust version in the command accordingly.
```bash
curl -sO https://packages.wazuh.com/4.6/wazuh-install.sh && chmod 744 wazuh-install.sh && bash ./wazuh-install.sh -a
```

Nicked from [Krishnendu](https://krishnendu.com/install-wazuh-4-x-on-ubuntu-single-host-with-single-command/)  
Wazuh [Quick Start Guide](https://documentation.wazuh.com/current/quickstart.html)