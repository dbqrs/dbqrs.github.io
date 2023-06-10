---
author: rs
title: Hyper-V One Way Communication, Host To VMs
date: 2023-06-09 02:00:00 -0500 
categories: [hyper-v]
tags: [repair, communication, virtual switch]
---

I recently encountered an issue with Hyper-V where the host system was able to successfully ping the virtual machines (VMs), but the VMs were unable to ping the host. However, the VMs were able to communicate with each other and other devices connected to the physical network without any problems.

This issue appears to be relatively common, yet there is a lack of definitive solutions available. In order to resolve the problem, I removed and re-added the virtual switch, and I also removed and re-added the network cards associated with each VM. 


