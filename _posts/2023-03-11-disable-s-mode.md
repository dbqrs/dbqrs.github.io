---
author: rs
title: Disable Windows S Mode
date: 2023-03-11 01:00:00 -0500 
categories: [Windows, Registry]
tags: [s mode,windows,registry] 
---


## Disable Windows S Mode Through Windows Recovery

Boot into recovery mode and load hive at
c:\windows\system32\config\SYSTEM

```
[HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\CI\Policy]
"SkuPolicyRequired"=dword:00000000

"SkuPolicyRequired"=dword:00000000 <--disabled
"SkuPolicyRequired"=dword:00000001 <--enabled
```