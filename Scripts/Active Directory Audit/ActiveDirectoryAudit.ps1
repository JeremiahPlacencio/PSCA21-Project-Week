# Active Directory Audit Script
#The purpose of this script is to review and report on Active Directory user accounts


# Retrieve all Active Directory user accounts
$Users = Get-ADUser -Filter * -Properties Enabled, Department

# Retrieving relevant information for the report
$Report = $Users | Select-Object Name, SamAccountName, Enabled, Department

# Displaying results in a table format
$Report | Format-Table -AutoSize

# Exporting the report to a CSV file
$Report | Export-Csv -Path C:\ActiveDirectoryAudits\ADUserAudit.csv