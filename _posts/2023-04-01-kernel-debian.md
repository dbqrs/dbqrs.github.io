---
author: rs
title: Build Kernel 5.3.5 for Debian 10.1
date: 2023-04-01 01:00:00 -0500 
categories: [linux, kernel]
tags: [linux,debian,kernel] 
---

### These are old notes

**Build Kernel 5.3.5 for Debian 10.1**

apt-get install build-essential libncurses-dev bison flex libssl-dev libelf-dev	bc		**<--installs prerequisites**  

wget https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.3.5.tar.xz		**<--downloads kernel**  

wget https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.3.5.tar.sign		**<--downloads kenel signature**  

gpg --verify linux-5.3.5.tar.sign		**<--verifies kernel**  

unxz -v linux-5.3.5.tar.xz		**<--uzips .tar**   

tar xvf linux-5.3.5.tar		**<--unpacks .tar**  

cd linux-5.3.5		**<--enter kernel directory**  

cp -v /boot/config-$(uname -r) .config		**<-- copies current kernel config ex:/boot/config-4.19.0-6-amd64**  

make -j $(nproc)		**<--starts compiling a compressed kernel**  

make modules_install		**<--installs the kenel modules**  