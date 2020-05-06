try {
    Get-ItemProperty -Path Registry::HKEY_CURRENT_USER\SOFTWARE\Microsoft\OneDrive\Accounts\Business1 -Name UserEmail -ErrorAction Stop
    Get-ItemProperty -Path Registry::HKEY_CURRENT_USER\SOFTWARE\Microsoft\OneDrive\Accounts\Business1 -Name KfmAllFoldersProtectedOnce -ErrorAction Stop
    Get-ItemProperty -Path Registry::HKEY_CURRENT_USER\SOFTWARE\Microsoft\OneDrive\Accounts\Business1 -Name FirstRun -ErrorAction Stop
    New-ItemProperty -Path "Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" -Name "{374DE290-123F-4565-9164-39C4925E467B}" -PropertyType String -Value "%userprofile%\OneDrive - haywardmx\Downloads" -ErrorAction Stop
    New-ItemProperty -Path "Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "{374DE290-123F-4565-9164-39C4925E467B}" -PropertyType ExpandString -Value "%userprofile%\OneDrive - haywardmx\Downloads" -ErrorAction Stop
}
catch {"Error, will retry when policy is applied"}
