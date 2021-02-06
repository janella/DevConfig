Param (
   [Parameter(ValueFromPipelineByPropertyName)]
   [switch] $ReplaceProfile = $false
)

$appdataPath=[Environment]::GetFolderPath("LocalApplicationData");
$docsPath=[Environment]::GetFolderPath("MyDocuments");
$powershellSettingsFilename="ParadoxJ.psm1";
$winTerminalFilename="settings.json";

Write-Host "Updating local Powershell and Windows Terminal settings..."

Copy-Item "$PSScriptRoot\$powershellSettingsFilename" -Destination "$docsPath\PowerShell\Modules\oh-my-posh\2.0.496\Themes" 
Copy-Item "$PSScriptRoot\$winTerminalFilename" -Destination "$appdataPath\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"

if ($replaceProfile) {
    Write-Host "Replacing local Powershell profile..."
    Copy-Item "$PSScriptRoot\Microsoft.PowerShell_profile.ps1" -Destination "$PROFILE"
}