$PackageIds = @(
    "Microsoft.PowerShell",
    "Microsoft.WindowsTerminal",
    "JanDeDobbeleer.OhMyPosh",
    "Microsoft.VisualStudioCode",
    "Python.Python.3",
    "Microsoft.dotnet",
    "Rustlang.Rust.GNU",
    "OpenJS.NodeJS",
    "Git.Git",
    "Valve.Steam",
    "Spotify.Spotify",
    "7zip.7zip",
    "flux.flux",
    "Malwarebytes.Malwarebytes",
    "GitHub.cli",
    "TheDocumentFoundation.LibreOffice"
)

foreach ($PackageId in $PackageIds)
{
    winget install -e --id $PackageId -h
}