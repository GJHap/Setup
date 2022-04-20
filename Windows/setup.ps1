Invoke-Expression './winget-install.ps1'

$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

Invoke-Expression './cargo-install.ps1'
Invoke-Expression './go-install.ps1'
Invoke-Expression './powershell-setup.ps1'
Invoke-Expression './powershell-config-setup.ps1'
Invoke-Expression './nvim-setup.ps1'
