$PackageIds = @(
      "Microsoft.PowerShell",
      "Microsoft.WindowsTerminal",
      "Starship.Starship",
      "Microsoft.VisualStudioCode",
      "Neovim.Neovim",
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
      "TheDocumentFoundation.LibreOffice",
      "GoLang.Go"
      )

foreach ($PackageId in $PackageIds)
{
   winget install -e --id $PackageId -h
}
