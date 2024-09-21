---
author: rs
title: CHIRP Install Linux Mint
date: 2024-09-12 02:00:00 -0500 
categories: [linux]
tags: [chirp,radio,pyhton]
---

#### Official Instructions
The official instructions for installing CHIRP on Linux are here:  
[**https://chirpmyradio.com/projects/chirp/wiki/ChirpOnLinux**](https://chirpmyradio.com/projects/chirp/wiki/ChirpOnLinux)

---

#### My Issue
I encountered a problem with **Step 2** in the official instructions. Possibly from too many step twos.

- I initially installed CHIRP using `pipx` as instructed.
- When I tried to update to a newer version, I uninstalled CHIRP with `pipx`. 
- During the reinstall, `pipx` complained about not being able to build `yattag`.

#### How I Fixed It
To resolve this issue:

1. I installed `python3-pip` using the following command:
   ```bash
   sudo apt install python3-pip
   ```

2. Then I installed the new version of CHIRP:
   ```bash
   pip3 install ./chirp-20240911-py3-none-any.whl
   ```

---

#### My Unofficial Install Instructions

##### **Step 1: Install Required Packages**
```bash
sudo apt install python3-wxgtk4.0 python3-pip pipx
```

##### **Step 2: Install CHIRP**
Navigate to the directory where your CHIRP `.whl` package is located and install it with:
```bash
pipx install ./chirp-xxxxxxxx-py3-none-any.whl
```

--- 