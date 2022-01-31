[string]$PROFILE_DIRECTORY = Split-Path $PROFILE
oh-my-posh --init --shell pwsh --config "${profile_directory}\oh-my-posh-config.json" | Invoke-Expression

Import-Module -Name Terminal-Icons
Import-Module -Name posh-git

Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView