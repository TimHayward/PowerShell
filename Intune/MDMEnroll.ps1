{
$MDMEnabled = $null
$MDM = $false
$GPUpdate = {GPupdate /force}
$AppInstalled = $false
Write-Output $MDM
Write-Output $MDMEnabled
}

$status = dsregcmd /status | Select-String -Pattern "DomainJoined"

    if ($status -match "DomainJoined : YES"){
        Write-Output "Domain Joined"
    }

    else{
        Write-Output "Not Domain Joined"
    }

$status = dsregcmd /status | Select-String -Pattern "AzureAdJoined"

    if ($status -match "AzureAdJoined : YES"){
        Write-Output "AzureAD Joined"
    }

    else{
        Write-Output "Not AzureAD Joined"
    }

do {
    $MDMEnabled = (Get-WinEvent -LogName Microsoft-Windows-DeviceManagement-Enterprise-Diagnostics-Provider/Admin | Where-Object {$_.ID -eq 75}).count
    if($MDMEnabled -ge 1){
        Write-Output "MDM Enabled"
        $MDM = $true
    }
    else{
        $MDM = $false
        Write-Output "MDM Not Enabled"
        $GPUpdate
        Start-Sleep -Seconds 20
    }
} until ($MDM -eq $true)

do{
    $software = "Microsoft Office 365 ProPlus - en-us";
    $installed = (Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object { $_.DisplayName -Match $software })
    $installed.displayname
    if ($installed.DisplayName -match "Microsoft Office 365 ProPlus - en-us") {
        Write-Output "installed"
        $AppInstalled = $true
    }else{
        Write-Output "not-installed"
        $AppInstalled = $false
        Start-Sleep -Seconds 20
    }
} until ($AppInstalled -eq $true)
<#
do{
    $software = "Microsoft.CompanyPortal";
    $installed = Get-AppxPackage -AllUsers | Select-Object Name, PackageFullName | Where-Object {$_.Name -match "Microsoft.CompanyPortal"}
    $installed.Name
    if ($installed.Name -match "Microsoft.CompanyPortal") {
        Write-Output "installed"
        $AppInstalled = $true
    }else{
        Write-Output "not-installed"
        $AppInstalled = $false
        Start-Sleep -Seconds 20
    }
} until ($AppInstalled -eq $true)
#>