$appdataPath=[Environment]::GetFolderPath("LocalApplicationData");
$docsPath=[Environment]::GetFolderPath("MyDocuments");
$powershellSettingsFilename="ParadoxJ.psm1";
$winTerminalFilename="settings.json";

Write-Host "Updating local Powershell and Windows Terminal settings..."

Copy-Item "$PSScriptRoot\$powershellSettingsFilename" -Destination "$docsPath\PowerShell\Modules\oh-my-posh\2.0.465\Themes" 
Copy-Item "$PSScriptRoot\$winTerminalFilename" -Destination "$appdataPath\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"
