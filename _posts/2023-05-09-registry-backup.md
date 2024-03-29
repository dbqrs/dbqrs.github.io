---
author: rs
title: Re-enable Registry Backup Win10/11 
date: 2023-05-09 02:00:00 -0500 
categories: [windows]
tags: [windows, registry]
---
In Windows 10/11 system restore points and registry backups are disabled. Here is a workaround to re-enable regsitry backups. Enabling system restore is a no-brainer. 

Merge this [registry file](https://www.dbqrs.com/files/posts/regbackup.reg)

```text
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Configuration Manager]
"EnablePeriodicBackup"=dword:00000001
"BackupCount"=dword:00000003
```

Create a new task in task scheduler to run daily/weekly with this command

```text
schtasks /run /i /tn "\Microsoft\Windows\Registry\RegIdleBackup"
```

Check C:\Windows\System32\config\RegBack for created files

![RegBackup](https://www.dbqrs.com/images/posts/regbackup.png)
