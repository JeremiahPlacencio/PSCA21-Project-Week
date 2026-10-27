Get-Help Get-ADUser -Examples -Full
# This command retrieves help information for PowerShell cmdlets, functions, scripts, and workflows. It provides detailed descriptions, syntax, parameters, and examples to assist users in understanding how to use specific commands effectively.
Update-Help
# This command updates the help files for PowerShell modules installed on the system. It downloads the latest help content from the internet and ensures that users have access to the most up-to-date information for cmdlets, functions, scripts, and workflows.


# --Manage user accounts in Powershell--

New-ADUser
# Creates a user account
Get-ADUser
# Retrieves user account 
# Use -Properties with a comma-separated list or "*" to review other properties
Set-ADUser
# Modifies user account properties
Remove-ADUser
# Deletes a user account
Set-ADAccountPassword
# Resets the password of a user account
Unlock-ADAccount
# Unlocks a user account that has been locked due to failed login attempts
Enable-ADAccount
# Enables a user account
Disable-ADAccount
# Disables a user account

# --Manage group memberships in Powershell/ Common Parameters--

New-ADGroup
# Creates a new Active Directory group
Get-ADGroup
# Retrieves properties about an Active Directory group
Set-ADGroup
# Modifies properties of an Active Directory group
Remove-ADGroup
# Deletes an Active Directory group
Add-ADGroupMember
# Adds one or more users to an Active Directory group
Remove-ADGroupMember
# Removes one or more users from an Active Directory group
Add-ADPrincipalGroupMembership
# Adds a user to one or more Active Directory groups
Get-ADPrincipalGroupMembership
# Retrieves the groups that a user is a member of
Remove-ADPrincipalGroupMembership
# Removes a user from one or more Active Directory groups
#--Parameters---
# -Name <String>
# Specifies the name of the Active Directory object (user, group, etc.) to be managed
# -GroupScope <String>
#  Defines the scope of a group as DomainLocal, Global, or Universal
# -GroupCategory <String>
# Specifies the category of a group as Security or Distribution 
# -DisplayName <String>
# Defines the LDAP display name for the Active Directory object
# -ManagedBy <String>
# Defines a user or group that can manage a group
# -Path <String>
# Defines the OU or container in which a group is created
# -SamAccountName <String>
# Defines a name that is backward-compatible with older operating systems

# --Managing Computers in PowerShell--
New-ADComputer
# Creates a new computer account in Active Directory
Get-ADComputer
# Retrieves properties about an Active Directory computer account
Set-ADComputer
# Modifies properties of an Active Directory computer account
Remove-ADComputer
# Deletes an Active Directory computer account
Test-ComputerSecureChannel
# Tests the secure channel between a computer and its domain controller
Reset-ComputerMachinePassword
# Resets the machine account password for a computer in Active Directory
# New-ADComputer -Name LON-CL10 -Path "ou=marketing,dc=adatum,dc=com" -Enabled $true

# --OU Management in PowerShell--
New-ADOrganizationalUnit
# Creates a new organizational unit (OU) in Active Directory
Get-ADOrganizationalUnit
# Retrieves properties about an Active Directory organizational unit (OU)
Set-ADOrganizationalUnit
# Modifies properties of an Active Directory organizational unit (OU)
Remove-ADOrganizationalUnit
# Deletes an Active Directory organizational unit (OU)

# --Managing AD Objects in PowerShell--
New-ADObject
# Creates a new Active Directory object
Get-ADObject
# Retrieves properties about an Active Directory object
Set-ADObject
# Modifies properties of an Active Directory object
Remove-ADObject
# Deletes an AD object
Rename-ADObject
# Renames an AD object
Restore-ADObject
# Restores a deleted AD object from the Active Directory Recycle Bin
Move-ADObject
# Moves an AD object to a different container or organizational unit (OU)
Sync-ADObject
# Sync an AD Object b/w two DC
