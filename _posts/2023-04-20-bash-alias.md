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
---
# executes neofetch
alias nn='neofetch'

![Neofetch](/images/neofetch.png)

# updates the os and logs the update
alias update='sudo apt update && sudo apt upgrade -y 2>&1 | tee ~/.loggy/"$(date+%F)-upgrade.log"'

# clear screen, windows command
alias cls='clear'

# put the apt update and upgrade in one command, creates a dated log file
alias update='sudo apt update && sudo apt upgrade -y 2>&1 | tee ~/.loggy/"$(date +%F)-upgrade.log" '

# search apt for packages
alias pksearch='sudo apt search'
alias pkgs='sudo apt search'

# install packages
alias ainstall='sudo apt install'
alias dinstall='sudo dpkg -i'

# typical cleanup commands 
alias cleanup='sudo apt autoremove && sudo apt autoclean && sudo apt clean'

# automatically set to resume partially downloaded file
alias wget='wget -c'

# displays system information and current dns  
alias ii='inxi -b -A -i && nmcli dev show | grep 'IP4.DNS' '

# systemctl start
alias sstart='sudo systemctl start'
# systemctl stop
alias sstop='sudo systemctl stop'
# systemctl restart
alias srestart='sudo systemctl restart' 
# systemctl status
alias sstatus='sudo systemctl status'

# ping tester with log file
# alias pingtest='ping -i 1 -s 1000 8.8.8.8 | while read line; do echo "$(date "+%Y-%m-%d %H:%M:%S") - $line"; done | tee -a "/home/robear/$(date "+%Y-%m-%d")-ping.log"'
alias pingtest='ping -i 1 -s 1472 8.8.8.8 | while read line; do echo "$(date "+%Y-%m-%d %H:%M:%S") - $line"; done | tee -a ~/logs/"$(date "+%F")-ping.log"'




# my local ip address
alias myip="ip -o -4 addr show | awk '{print \$2, \$4}'"


# Get Public IP information

pubip() {
    # Define the API URL (you can change it if needed)
    local api_url="http://ipinfo.io/json"
    
    # Fetch data using curl and parse it with jq
    if command -v jq >/dev/null 2>&1; then
        # Ensure jq is installed
        curl -s "$api_url" | jq -r '
            "IP: \(.ip)",
            "Hostname: \(.hostname)",
            "City: \(.city)",
            "Region: \(.region)",
            "Country: \(.country)",
            "Org: \(.org)"
        '
    else
        echo "jq is required but not installed. Install jq and try again."
    fi
}