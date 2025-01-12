---
author: rs
title: Retrieve Uninstall Strings for Installed Software
date: 2025-1-12 02:00:00 -0500 
categories: [automation]
tags: [automation,uninstall]
---

### PowerShell Script to Find Uninstall Strings for Installed Software (Excluding Microsoft Store Apps)

```powershell
# Define the registry paths
$paths = @(
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall",
    "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall"
)

# Create an array to store the results
$uninstallInfo = @()

# Loop through each registry path
foreach ($path in $paths) {
    # Get all subkeys in the path
    Get-ChildItem -Path $path -ErrorAction SilentlyContinue | ForEach-Object {
        $app = Get-ItemProperty -Path $_.PsPath -ErrorAction SilentlyContinue
        # Collect app details
        [PSCustomObject]@{
            Name           = $app.DisplayName
            Publisher      = $app.Publisher
            Version        = $app.DisplayVersion
            UninstallString = $app.UninstallString
        }
    } | Where-Object { $_.Name -ne $null } | ForEach-Object {
        $uninstallInfo += $_
    }
}

# Create folder if it does not exist
$folderPath = "C:\shit"

if (-Not (Test-Path -Path $folderPath)) {
    New-Item -Path $folderPath -ItemType Directory
}


# Export to a CSV file without truncation
$filePath = "$folderPath\UninstallStrings_Full.csv"
$uninstallInfo | Export-Csv -Path $filePath -NoTypeInformation -Encoding UTF8

# Export to a text file with detailed formatting
 #$textFilePath = "$folderPath\UninstallStrings_Full.txt"
 #$uninstallInfo | ForEach-Object {
 #    "Name: $_.Name`nPublisher: $_.Publisher`nVersion: $_.Version`nUninstall String: $_.UninstallString`n`n"
 #} | Out-File -FilePath $textFilePath -Encoding UTF8

Write-Host "Exported uninstall details to $filePath" # and $textFilePath"

pause
```
