---
author: rs
title: Right-Click File Hash Check - Linux Mint
date: 2024-09-12 02:00:00 -0500 
categories: [linux]
tags: [bash,file,hash,menu]
---

Here's how you can integrate a file hash check script into the right-click menu in Linux Mint:

### 1. Create the File Hash Script

1. **Create the script** (`/usr/local/bin/hash-check.sh`):

   ```bash
   sudo nano /usr/local/bin/hash-check.sh
   ```

2. **Paste the script** below and save it:

   ```bash
   #!/bin/bash

   # Get file path from the context menu
   file="$1"

   # Check if file exists
   if [ ! -f "$file" ]; then
     echo "File not found!"
     exit 1
   fi

   # Choose algorithm
   echo "Choose a hash algorithm:"
   echo "1) SHA1"
   echo "2) SHA256"
   echo "3) SHA384"
   echo "4) SHA512"
   echo "5) MD5"
   echo "6) Show all"

   read -p "Enter choice [1-7]: " choice

   case $choice in
     1)
       sha1sum "$file"
       ;;
     2)
       sha256sum "$file"
       ;;
     3)
       sha384sum "$file"
       ;;
     4)
       sha512sum "$file"
       ;;
     5)
       md5sum "$file"
       ;;
     6)
       echo "SHA1:"
       sha1sum "$file"
       echo "SHA256:"
       sha256sum "$file"
       echo "SHA384:"
       sha384sum "$file"
       echo "SHA512:"
       sha512sum "$file"
       echo "MD5:"
       md5sum "$file"
       ;;
     *)
       echo "Invalid choice! Press Enter to quit dumbass"
       ;;
   esac
   ```

3. **Make the script executable**:

   ```bash
   sudo chmod +x /usr/local/bin/hash-check.sh
   ```

    You can also verify the permissions with:

    ```bash
    ls -l /usr/local/bin/hash-check.sh
    ```

    You should see something like this for the file:

    ```bash
    -rwxr-xr-x 1 root root ... /usr/local/bin/hash-check.sh
    ```

    The `x` means it’s executable.


### 2. Create Nemo Action for Mint
Nemo supports custom actions through the `.nemo_action` file. You can define the right-click menu item for your hash-check script like this:

1. **Create a custom action file** in the Nemo actions folder:

   ```bash
   mkdir -p ~/.local/share/nemo/actions
   nano ~/.local/share/nemo/actions/hash-check.nemo_action
   ```

2. **Add the following content** to the file:

   ```ini
   [Nemo Action]
   Name=Check File Hash
   Comment=Calculate file hash (MD5, SHA1, SHA256, etc.)
   Exec=/usr/local/bin/hash-check.sh %F
   Icon=utilities-terminal
   Selection=Any
   Extensions=any;
   Terminal=true
   ```

   - `Exec=/usr/local/bin/hash-check.sh %F`: This will pass the selected file(s) to the hash-check script.
   - `Terminal=true`: Ensures that it opens in a terminal window so you can see the output.

3. **Save and close** the file.

### 3. Testing File Hash Script
1. **Restart Nemo** to apply the new action:

   ```bash
   nemo --quit
   ```

2. **Right-click a file** in Nemo, and you should see a new menu option called **"Check File Hash"**. Selecting it will run the hash-check script, allowing you to choose the algorithm and see the results in the terminal.  

>*ChatGPT can be credited for this script. I only made a few minor changes.*