Param (
   [Parameter(ValueFromPipelineByPropertyName)]
   [switch] $ReplaceProfile = $false
)

$appdataPath=[Environment]::GetFolderPath("LocalApplicationData");
$docsPath=[Environment]::GetFolderPath("MyDocuments");
$powershellSettingsFilename="ParadoxJ.psm1";
$winTerminalFilename="settings.json";

Write-Host "Copying current Powershell and Windows Terminal settings..."

Copy-Item "$docsPath\PowerShell\Modules\oh-my-posh\2.0.496\Themes\$powershellSettingsFilename" -Destination $PSScriptRoot
Copy-Item "$appdataPath\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\$winTerminalFilename" -Destination $PSScriptRoot

if ($replaceProfile) {
    Write-Host "Copying local Powershell profile..."
    Copy-Item "$PROFILE" -Destination $PSScriptRoot
}

