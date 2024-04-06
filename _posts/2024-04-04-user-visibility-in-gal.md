---
author: rs
title: Hide or Unhide User from GAL using ADUC
date: 2024-04-04 13:01:00 -0500 
categories: [active directory, office365, email]
tags: [active directory, office365, email]
---
Just in case you didn't know-  
GAL=Global Address List  
ADUC=Active Directory Users & Computers

This is going to apply when using AzureAD Connect, now known as Microsoft Entra Connect. Active Directory now becomes the authority. Respect My Authoritah!

Find **msExchHideFromAddressLists** and set it to TRUE or FALSE depending on your needs. You may also need to look for **showInAddressBook** and delete it if necessary.

![.](images/step-0.png)