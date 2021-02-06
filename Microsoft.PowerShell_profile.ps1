Import-Module posh-git
Import-Module oh-my-posh
Set-Theme ParadoxJ
# Reference any helper scripts
$psdir="C:\Dev\DevConfig\Scripts"
Get-ChildItem "${psdir}\*.ps1" | %{.$_}