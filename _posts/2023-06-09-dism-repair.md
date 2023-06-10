---
author: rs
title: Use DISM To Maintain/Repair A Windows Installation
date: 2023-06-08 02:00:00 -0500 
categories: [windows]
tags: [repair, shared, windows, dism]
---

Use this command to restore the health of your Windows install
```text 
DISM /Online /Cleanup-Image /RestoreHealth
```

Use this command to restore the health of your Windows install while offline. You will have mount an image or use a bootable flashdrive.
```text
DISM /Online /Cleanup-Image /RestoreHealth /Source:D:\Sources\install.esd
```

Analyze the component store to see what can be removed
```text
DISM /Online /Cleanup-Image /AnalyzeComponentStore
```
Cleanup old files
```text
DISM /Online /Cleanup-Image /StartComponentCleanup
```
Reset the base to cleanup even further
```text
DISM /Online /Cleanup-Image /StartComponentCleanup /ResetBase
```
