$Computers = "HV01","HV02","HV03"
invoke-command $Computers -ScriptBlock {Set-Service -ServiceName HealthService -StartupType Disabled}
invoke-command $Computers -ScriptBlock {Stop-Service -ServiceName HealthService}
invoke-command $Computers -ScriptBlock {Get-Service HealthService | Select-Object -Property Name, StartType, Status}