# Offboarding Script
# The purpose of this script is to automate a user

# User to disable
$Username = Read-Host "Enter the username of the account to disable"

# Disable the account
Disable-ADAccount -Identity $Username
Write-Host "User $Username has been disabled."