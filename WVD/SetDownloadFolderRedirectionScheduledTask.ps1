Invoke-WebRequest https://raw.githubusercontent.com/TimHayward/PowerShell/master/FolderRedirection/SetDownloadFolderRedirection.ps1 -OutFile C:\Support\Scripts\SetDownloadFolderRedirection.ps1
$action = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument '-NoProfile -WindowStyle Hidden -ExecutionPolicy Bypass -File C:\Support\Scripts\SetDownloadFolderRedirection.ps1'

$trigger =  @(
    $(New-ScheduledTaskTrigger -AtLogOn)
)

Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "SetDownloadFolderRedirection" -Description "Set Download Folder Redirection"