#Copied to C:\Support\Scripts
try {
    Get-ItemProperty -Path "Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" -Name "{374DE290-123F-4565-9164-39C4925E467B}" -ErrorAction Stop
    Get-ItemProperty -Path "Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "{374DE290-123F-4565-9164-39C4925E467B}" -ErrorAction Stop
    Unregister-ScheduledTask -TaskName "SetDownloadFolderRedirection" -Confirm:$false
}
catch {"Error, will retry when policy is applied"}
