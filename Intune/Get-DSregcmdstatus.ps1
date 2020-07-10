function Get-DSregcmdstatus {
    $status = dsregcmd /status
    $status -replace ':', ' ' |
        Select-Object -Index 5, 6, 7, 13, 14, 15, 16, 17, 18, 19, 25, 26, 27, 28, 29, 30, 31, 66 |
        ForEach-Object {$_.Trim() }  |
        ConvertFrom-String -PropertyNames 'State', 'Status'
}

$status = Get-DSregcmdstatus
$status | Where-Object {$_.State -eq "AzureAdPrt" -and $_.Status -eq "YES"}