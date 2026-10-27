# Account Unlock Tool 
# The purpose is to unlock an active directory user account
# Code works using First name of users in AD in the domain. 

# Prompt for the username
$Username = Read-Host "Enter the username of the account to unlock"

# Find the user and check account status
try {
    $User = Get-ADUser -Identity $Username -Properties LockedOut -ErrorAction Stop

    # Check whether the account is locked
    if ($User.LockedOut) {
        Write-Host "$Username is locked out."

        # Ask for confirmation
        $Confirm = Read-Host "Unlock this account? (Y/N)"

        if ($Confirm -eq "Y") {
            # Unlock the account
            Unlock-ADAccount -Identity $Username -ErrorAction Stop
            Write-Host "Account unlocked."
        }
        else {
            Write-Host "Account remains locked."
        }
    }
    else {
        Write-Host "$Username is not locked out."
    }
}
catch {
    # Display the actual error
    Write-Host "Error: $($_.Exception.Message)"
}

                    