[string]$PROFILE_DIRECTORY = Split-Path $PROFILE
Invoke-Expression (&starship init powershell)

Import-Module -Name Terminal-Icons

Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -Colors @{
   Parameter = [ConsoleColor]::Magenta
   Operator = [ConsoleColor]::White
}

$ENV:FZF_DEFAULT_COMMAND = 'rg --files'
Set-PsFzfOption -PSReadLineChordProvider 'Ctrl+Shift+f' -PSReadLineChordReverseHistory 'Ctrl+r'
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

function git-stage
{
   Invoke-FuzzyGitStatus | foreach { git add $_ }
}

function git-unstage
{
   function unstage-file
   {
      param ([string]$f)
      if ($f -like '* -> *') { $f = ($f -split ' -> ')[1] }
      git reset $f
   }
   Invoke-FuzzyGitStatus | foreach { unstage-file($_) }
}
