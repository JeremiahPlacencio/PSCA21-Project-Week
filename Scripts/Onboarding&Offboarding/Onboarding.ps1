#Onboarding Script
# The purpose of this script is to automate the onboarding process for new users in Active Directory.

# Retreiving new user information
$FirstName = Read-Host "Enter the first name of the new user"
$LastName = Read-Host "Enter the last name of the new user"
$Username = Read-Host "Enter the desired username for the new user"
$Password = Read-Host "Enter Password for the new user" -AsSecureString

# Create New user
New-ADUser `
    -Name "$FirstName $LastName" `
    -GivenName $FirstName `
    -Surname $LastName `
    -SamAccountName $Username `
    -UserPrincipalName "$Username@adatum.com" `
    -Path "OU=Sales,DC=adatum,DC=com" `
    -AccountPassword $Password `
    -Enabled $true `
    -ChangePasswordAtLogon $true

    Write-Host "User $Username has been created successfully."

