#System Health Script
# The purpose of this script is to collect and report basic system health information

# Get computer information
Get-ComputerInfo |
    Select-Object CsName, WindowsProductName, WindowsVersion, OsArchitecture, CsProcessors, CsTotalPhysicalMemory
# Get disk space information
Get-PSDrive -PSProvider FileSystem 

# What services are running
Get-Service | 
    Where-Object {$_.Status -eq "Running"} |
    Select-Object Name, Status

Write-Host "System health check completed."