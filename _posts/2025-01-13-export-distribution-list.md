
### Export All Exchange Online Distribution Lists To Excel 

#### This is based off this post: [Exchange Online Quick Tip: Export all distribution lists with members to a CSV file!](https://techcommunity.microsoft.com/discussions/microsoft-365/exchange-online-quick-tip-export-all-distribution-lists-with-members-to-a-csv-fi/3277712) 

This is different because it exports all distribution lists including their members into separate .csv files, then combines all the .csv files into an Excel spreadsheet. Each tab in the spreadsheet is named after the corresponding distribution list.



```powershell
# Set working directory
Set-Location C:\temp
Clear-Host

# Ensure the required module is installed
Write-Host "Checking for ExchangeOnlineManagement module..." -ForegroundColor Green
if (-not (Get-Module -Name ExchangeOnlineManagement -ListAvailable)) {
    Write-Host "Module not found. Installing ExchangeOnlineManagement module..." -ForegroundColor Yellow
    Install-Module -Name ExchangeOnlineManagement -AllowClobber -Force #-Verbose
} else {
    Write-Host "ExchangeOnlineManagement module already installed." -ForegroundColor Green
}

# Import the module
Write-Host "Importing ExchangeOnlineManagement module..." -ForegroundColor Green
Import-Module ExchangeOnlineManagement

# Check the installed version
Write-Host "Checking installed module version..." -ForegroundColor Green
Get-InstalledModule -Name ExchangeOnlineManagement

# Update the module if needed
Write-Host "Updating module if necessary..." -ForegroundColor Green
Update-Module -Name ExchangeOnlineManagement #-Verbose

# Connect to Exchange Online
Write-Host "Connecting to Exchange Online..." -ForegroundColor Green
Connect-ExchangeOnline

# Create output directory for CSV files
$outputDir = "C:\temp"
if (-not (Test-Path -Path $outputDir)) {
    Write-Host "Creating output directory: $outputDir" -ForegroundColor Yellow
    New-Item -Path $outputDir -ItemType Directory -Force
}

# Get all distribution groups
Write-Host "Retrieving all distribution groups..." -ForegroundColor Green
$groups = Get-DistributionGroup -ResultSize Unlimited
$totalGroups = $groups.Count
$i = 1

# Process each distribution group and export members to individual CSV files
Write-Host "Exporting members of distribution groups to individual CSV files..." -ForegroundColor Green
$groups | ForEach-Object {
    $groupName = $_.DisplayName
    Write-Progress -Activity "Processing Distribution Groups" -Status "Processing $groupName ($i of $totalGroups)" -PercentComplete (($i / $totalGroups) * 100)

    # Get members of the current distribution group
    $members = Get-DistributionGroupMember -Identity $groupName -ResultSize Unlimited |
        ForEach-Object {
            $recipient = Get-Recipient -Identity $_.PrimarySMTPAddress -ErrorAction SilentlyContinue
            [PSCustomObject]@{
                DisplayName       = $recipient.DisplayName
                PrimarySMTPAddress = $_.PrimarySMTPAddress
                RecipientType     = $_.RecipientType
            }
        }

    # Define the sanitized file name
    $fileName = "$outputDir\$($groupName -replace '[<>:"/\|?*]', '')-members.csv"

    # Export members to a CSV file
    $members | Export-Csv -Path $fileName -NoTypeInformation -Encoding UTF8

    Write-Host "Exported $groupName to $fileName" -ForegroundColor Cyan
    $i++
}

# Disconnect from Exchange Online
Disconnect-ExchangeOnline

# Combine CSV files into Excel
Write-Host "Combining CSV files into a single Excel file..." -ForegroundColor Green

# Create an Excel application object
$excel = New-Object -ComObject Excel.Application
$excel.Visible = $false  # Set to $true if you want to see the Excel file as it is created
$workbook = $excel.Workbooks.Add()

# Get all CSV files in the folder
$csvFiles = Get-ChildItem -Path $outputDir -Filter "*.csv"

# Loop through each CSV file
$i = 1
$totalFiles = $csvFiles.Count
foreach ($csvFile in $csvFiles) {
    $groupName = [System.IO.Path]::GetFileNameWithoutExtension($csvFile.Name)
    Write-Progress -Activity "Importing CSV files to Excel" -Status "Adding $groupName ($i of $totalFiles)" -PercentComplete (($i / $totalFiles) * 100)

    # Read the CSV file into a PowerShell object
    $csvData = Import-Csv -Path $csvFile.FullName

    # Add a new worksheet for each CSV file
    $sheet = $workbook.Sheets.Add()
    
    # Set the sheet name to the CSV file name without the extension (ensure it's within Excel's name limits)
    $sheet.Name = $groupName.Substring(0, [Math]::Min($groupName.Length, 31))

    # Write data to the Excel sheet
    $rowIndex = 1
    $csvData | ForEach-Object {
        $columnIndex = 1
        foreach ($property in $_.PSObject.Properties) {
            # Add headers in the first row
            if ($rowIndex -eq 1) {
                $sheet.Cells.Item(1, $columnIndex).Value = $property.Name
            }
            # Write data
            $sheet.Cells.Item($rowIndex + 1, $columnIndex).Value = $property.Value
            $columnIndex++
        }
        $rowIndex++
    }
    $i++
}

# Save the workbook to a file
$excelFilePath = "C:\temp\all_dist_lists.xlsx"
$workbook.SaveAs($excelFilePath)

# Close the workbook and Excel
$workbook.Close()
$excel.Quit()

Write-Host "CSV files have been combined into Excel at $excelFilePath" -ForegroundColor Green
```
