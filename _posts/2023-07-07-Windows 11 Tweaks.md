---
author: rs
title: Windows 11 Tweaks
date: 2023-07-07 02:00:00 -0500 
categories: [Windows 11]
tags: [windows 11, tweaks, bing, right-click, telemetry]
---

This may or may not get updated. My DD is Mint, but at work it is Windows 11. These are the things most important to me.

### Restore The Classic Right-Click Menu - cmd as user
```text
reg.exe add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
```

### Disable Bing in the Start Menu - cmd as Administrator
```text
reg.exe add HKLM\Software\Policies\Microsoft\Windows\Explorer /v DisableSearchBoxSuggestions /t REG_DWORD /d 00000001
```

### Disable Some Telemetry - cmd as Administrator
```text
reg.exe add HKLM\Software\Policies\Microsoft\Windows\DataCollection /v AllowTelemetry /t REG_DWORD /d 00000000
```

Disable **Connected User Experiences and Telemetry Service** in Services or run these PowerShell commands as Administrator:
```powershell
stop-service diagtrack
```

```powershell
set-service diagtrack -startuptype disabled
```


### Generate Hash Values with right-click
This is one of my favorite tweaks to Windows 11! Save with .reg extension and merge.    
**Source:** https://www.tenforums.com/tutorials/78681-add-file-hash-context-menu-windows-8-10-a.html

```text
Windows Registry Editor Version 5.00

; Created by: Shawn Brink
; Created on: March 5th 2017
; Updated on: March 8, 2024
; Tutorial: https://www.tenforums.com/tutorials/78681-file-hash-context-menu-add-windows-8-windows-10-a.html


[HKEY_CLASSES_ROOT\*\shell\hash]
"MUIVerb"="Hash"
"SubCommands"=""

; SHA1
[HKEY_CLASSES_ROOT\*\shell\hash\shell\01menu]
"MUIVerb"="SHA1"

[HKEY_CLASSES_ROOT\*\shell\hash\shell\01menu\command]
@="powershell -noexit get-filehash -literalpath \\\"%1\\\" -algorithm SHA1 | format-list"


; SHA256
[HKEY_CLASSES_ROOT\*\shell\hash\shell\02menu]
"MUIVerb"="SHA256"

[HKEY_CLASSES_ROOT\*\shell\hash\shell\02menu\command]
@="powershell -noexit get-filehash -literalpath \\\"%1\\\" -algorithm SHA256 | format-list"


; SHA384
[HKEY_CLASSES_ROOT\*\shell\hash\shell\03menu]
"MUIVerb"="SHA384"

[HKEY_CLASSES_ROOT\*\shell\hash\shell\03menu\command]
@="powershell -noexit get-filehash -literalpath \\\"%1\\\" -algorithm SHA384 | format-list"


; SHA512
[HKEY_CLASSES_ROOT\*\shell\hash\shell\04menu]
"MUIVerb"="SHA512"

[HKEY_CLASSES_ROOT\*\shell\hash\shell\04menu\command]
@="powershell -noexit get-filehash -literalpath \\\"%1\\\" -algorithm SHA512 | format-list"


; MACTripleDES
[HKEY_CLASSES_ROOT\*\shell\hash\shell\05menu]
"MUIVerb"="MACTripleDES"

[HKEY_CLASSES_ROOT\*\shell\hash\shell\05menu\command]
@="powershell -noexit get-filehash -literalpath \\\"%1\\\" -algorithm MACTripleDES | format-list"


; MD5
[HKEY_CLASSES_ROOT\*\shell\hash\shell\06menu]
"MUIVerb"="MD5"

[HKEY_CLASSES_ROOT\*\shell\hash\shell\06menu\command]
@="powershell -noexit get-filehash -literalpath \\\"%1\\\" -algorithm MD5 | format-list"


; RIPEMD160
[HKEY_CLASSES_ROOT\*\shell\hash\shell\07menu]
"MUIVerb"="RIPEMD160"

[HKEY_CLASSES_ROOT\*\shell\hash\shell\07menu\command]
@="powershell -noexit get-filehash -literalpath \\\"%1\\\" -algorithm RIPEMD160 | format-list"


; Allget-filehash -literalpath '%1' -algorithm RIPEMD160 | format-list
[HKEY_CLASSES_ROOT\*\shell\hash\shell\08menu]
"CommandFlags"=dword:00000020
"MUIVerb"="Show all"

[HKEY_CLASSES_ROOT\*\shell\hash\shell\08menu\command]
@="powershell -noexit get-filehash -literalpath \\\"%1\\\" -algorithm SHA1 | format-list;get-filehash -literalpath \\\"%1\\\" -algorithm SHA256 | format-list;get-filehash -literalpath \\\"%1\\\" -algorithm SHA384 | format-list;get-filehash -literalpath \\\"%1\\\" -algorithm SHA512 | format-list;get-filehash -literalpath \\\"%1\\\" -algorithm MACTripleDES | format-list;get-filehash -literalpath \\\"%1\\\" -algorithm MD5 | format-list;get-filehash -literalpath \\\"%1\\\" -algorithm RIPEMD160 | format-list"
```