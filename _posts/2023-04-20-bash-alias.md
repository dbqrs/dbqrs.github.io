---
author: rs
title: My Bash Aliases
date: 2023-04-20 01:00:00 -0500 
categories: [linux, bash]
tags: [linux,bash,commandline]
---
to edit bash, must be in /home 
```bash
nano .bashrc
```

to load new edits into bash
```bash
source .bashrc
```

**#clear screen, windows command**  
alias cls='clear'  

**#apt update and apt upgrade in one command, creates a dated log file**  
alias update='sudo apt update && sudo apt upgrade -y 2>&1 | tee ~/.loggy/"$(date +%F)-upgrade.log" '

**#search apt for packages
alias pksearch='sudo apt search'

**#install packages
alias install='sudo apt install'

**#runs the typical cleanup commands**   
alias cleanup='sudo apt autoremove && sudo apt autoclean && sudo apt clean'

**#executes neofetch**  
alias nn='neofetch'

![](/images/neofetch.png)

**#set to auto resume partially downloaded file**  
alias wget='wget -c'

**#changes directory, builds and serves jekyll site**  
alias jb='cd ~/repos/dbqrs.github.io && bundle exec jekyll serve'
