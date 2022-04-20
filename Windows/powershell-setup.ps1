Install-Module -Name Terminal-Icons -Scope CurrentUser -AcceptLicense 
Install-Module -Name PSReadLine -Scope CurrentUser -AllowPrerelease -AcceptLicense -Force
Install-Module -Name posh-git -Scope CurrentUser -AcceptLicense
Install-Module -Name PSFzf -Scope CurrentUser -AcceptLicense

[string]$PROFILE_DIRECTORY = Split-Path $PROFILE
New-Item -ItemType File -Path $PROFILE -Force
Copy-Item ".\PowerShell_profile.ps1" -Destination $PROFILE -Force
Copy-Item "..\oh-my-posh\oh-my-posh-config.json" -Destination $PROFILE_DIRECTORY -Force
