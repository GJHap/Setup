Copy-Item -Force -Recurse ../nvim ~/AppData/Local/

[string]$PROFILE_DIRECTORY = Split-Path $PROFILE
New-Item -ItemType File -Path $PROFILE -Force
Copy-Item ".\PowerShell_profile.ps1" -Destination $PROFILE -Force
Copy-Item "..\oh-my-posh-config.json" -Destination $PROFILE_DIRECTORY -Force
