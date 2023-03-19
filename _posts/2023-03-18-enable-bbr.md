---
author: rs
title: Enable BBR Congestion Control
date: 2023-18-03 01:00:00 -0500 
categories: [linux, network]
tags: [linx,network,bbr] 
---


# Enable TCP BBR in Linux
Requires atleast linux kernel 4.9 or above. This is not an issue on modern linux distros. Everyone is kernel version 5.x.x


```bash
sudo nano /etc/sysctl.conf
```

Add the following at the end of the file.

```text
## Enable BBR Congestion Control
net.core.default_qdisc=fq
net.ipv4.tcp_congestion_control=bbr

## Enable Window Scaling
net.ipv4.tcp_window_scaling = 1
```

Reload sysctl config
```bash
sudo sysctl -p
```

Output should be  
net.core.default_qdisc = fq  
net.ipv4.tcp_congestion_control = bbr  
net.ipv4.tcp_window_scaling = 1