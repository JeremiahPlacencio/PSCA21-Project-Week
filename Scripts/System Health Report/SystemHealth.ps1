#System Health Script
# The purpose of this script is to collect and report basic system health information

$OS = Get-CimInstance -ClassName Win32_OperatingSystem

$LastBootUpTime = $OS.LastBootUpTime
$Uptime = (Get-Date) - $Lastboot

$SystemHealthReport = [PSCustomObject]@{
    ComputerName = $env:COMPUTERNAME
    OperatingSystem = $OS.Caption
    OSVersion = $OS.Version
    LastBootTime = $LastBoot
    UptimeDays = [math]::Round($Uptime.TotalDays, 2)
    CollectedAt = Get-Date
}

# Information on Memory
$MemoryReport = []