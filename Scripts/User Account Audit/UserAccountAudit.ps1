# Retrieve all local user accounts on the system
Get-LocalUser

#User Account Audit Script
# The purpose of this script is to inventory local Windows user accounts

$Users = Get-LocalUser

$Report = foreach ($User in $Users) {
    [PSCustomObject]@{
        UserName = $User.Name
        Enabled = $User.Enabled
        LastLogon = $User.LastLogon
        PasswordResetRequired = $User.PasswordResetRequired
    }
}

# Displaying the report in a table format
$Report | Format-Table -AutoSize

#Exporting the report to a CSV file
$Report | Export-Csv -Path C:\UserAcctAudits\UserAudit.csv -NoTypeInformation


