---
author: rs
title: Windows 11 Tweaks
date: 2023-07-07 02:00:00 -0500 
categories: [Windows 11]
tags: [windows 11, tweaks, bing, right-click]
---

This may or may not get updated. My DD is Mint, but at work it is Windows 11. These are the things most important to me.

Restore The Classic Right-Click Menu - cmd as Administrator
```text
reg.exe add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
```

Disable Bing in the Start Menu
```text
reg add HKLM\Software\Policies\Microsoft\Windows\Explorer /v DisableSearchBoxSuggestions /t REG_DWORD /d 00000001
```