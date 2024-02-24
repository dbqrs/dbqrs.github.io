---
author: rs
title: Error 740 When Adding Shared Printer Win10/11
date: 2023-06-08 02:00:00 -0500 
categories: [windows]
tags: [error 740, printers, shared, windows]
---

Error 740 occurs from lack of privileges. It's an easy fix.
 
Open cmd prompt with administrator privileges and enter this command to start the add printer wizard with elevated privileges:

```text
rundll32 printui.dll,PrintUIEntry /il
```

Afterwards add printer as you normally would.
