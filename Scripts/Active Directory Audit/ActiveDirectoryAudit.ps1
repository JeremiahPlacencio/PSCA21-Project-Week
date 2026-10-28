# Active Directory Audit Script
#The purpose of this script is to review and report on Active Directory user accounts
# Install the Active Directory module from RSAT if it is not already installed
if (Get-Module -ListAvailable -Name ActiveDirectory) {
    Write-Verbose -Message "The ActiveDirectory module is already installed." -Verbose
}
else {
    try {
        if ($env:OS -ne 'Windows_NT') {
            throw 'The ActiveDirectory module can only be installed on Windows.'
        }

        $operatingSystem = Get-CimInstance -ClassName Win32_OperatingSystem -ErrorAction Stop
        if ($operatingSystem.ProductType -eq 1) {
            Add-WindowsCapability -Online -Name 'Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0' -ErrorAction Stop | Out-Null
        }
        else {
            $installation = Install-WindowsFeature -Name RSAT-AD-PowerShell -ErrorAction Stop
            if (-not $installation.Success) {
                throw 'The RSAT-AD-PowerShell feature installation failed.'
            }
        }

        Import-Module ActiveDirectory -ErrorAction Stop
    }
    catch {
        throw "Unable to install or load ActiveDirectory RSAT. Run this script from an elevated PowerShell session on a supported Windows client or server. $($_.Exception.Message)"
    }
}

# Retrieve all Active Directory user accounts
$Users = Get-ADUser -Filter * -Properties Enabled, Department

# Retrieving relevant information for the report
$Report = $Users | Select-Object Name, SamAccountName, Enabled, Department

# Displaying results in a table format
$Report | Format-Table -AutoSize

# Exporting the report to a CSV file
$Report | Export-Csv -Path C:\ActiveDirectoryAudits\ADUserAudit.csv
