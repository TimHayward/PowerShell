# Download the package
function download() {$ProgressPreference="SilentlyContinue"; Invoke-WebRequest -Uri https://aka.ms/AzureConnectedMachineAgent -OutFile AzureConnectedMachineAgent.msi}
download

# Install the package
msiexec /i AzureConnectedMachineAgent.msi /l*v installationlog.txt /qn | Out-String

# Run connect command
& "$env:ProgramFiles\AzureConnectedMachineAgent\azcmagent.exe" connect `
  --service-principal-id "3946555d-ea1a-4b45-8e66-3c754213d630" `
  --service-principal-secret "62ddc186-b9f1-4d8c-9905-0f6065926231" `
  --resource-group "HaywardMXResourceGroup" `
  --tenant-id "e46961f8-ed6d-467d-ba3c-896ffd17e73d" `
  --location "West Europe" `
  --subscription-id "344292df-e7ef-4c78-bd9a-52dc0b9f8bfd"