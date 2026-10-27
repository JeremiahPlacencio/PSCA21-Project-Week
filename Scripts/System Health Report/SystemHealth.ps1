#System Health Script
# The purpose of this script is to collect and report basic system health information

$OS = Get-CimInstance -ClassName Win32_OperatingSystem

$LastBootUpTime = $OS.LastBootUpTime
$Uptime = (Get-Date) - $LastBootUpTime

$SystemHealthReport = [PSCustomObject]@{
    ComputerName = $env:COMPUTERNAME
    OperatingSystem = $OS.Caption
    OSVersion = $OS.Version
    LastBootTime = $LastBootUpTime
    UptimeDays = [math]::Round($Uptime.TotalDays, 2)
    CollectedAt = Get-Date
}

# Information on Memory
$MemoryReport = [PSCustomObject]@{
    TotalMemory =  [math]::Round($OS.TotalVisibleMemorySize / 1MB, 2)
    FreeMemory = [math]::Round($OS.FreePhysicalMemory / 1MB, 2)
}

$MemoryReport | Add-Member -NotePropertyName UsedMemory -NotePropertyValue (
    [math]::Round(
        ($MemoryReport.TotalMemory - $MemoryReport.FreeMemory),
        2
    )
)

# Information on Disk Usage
$DiskReport = Get-CimInstance -ClassName Win32_LogicalDisk
    -Filter "DriveType = 3" |
    Select-Object
        @{Name='Drive';Expression={$_.DeviceID}},
        @{Name='Volume';Expression={$_.VolumeName}},
        @{Name='TotalSizeGB';Expression={[math]::Round($_.Size / 1GB, 2)
        }},
        @{Name='FreeSpaceGB'; Expression={
            [math]::Round($_.FreeSpace / 1GB, 2)
        }},
        @{Name=}