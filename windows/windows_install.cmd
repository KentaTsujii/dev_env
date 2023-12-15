winget install Microsoft.WindowsTerminal.Preview
winget install Microsoft.PowerToys
winget install Microsoft.VisualStudioCode
winget install Microsoft.Powershell
winget install Git.Git
winget install Neovim.Neovim.Nightly
Microsoft.DotNet.SDK.8
winget install AdoptOpenJDK.OpenJDK.17
winget install JanDeDobbeleer.OhMyPosh -s winget

oh-my-posh font install --user

dism /online /Enable-Feature /FeatureName:Microsoft-Windows-Subsystem-Linux
dism /online /Enable-Feature /FeatureName:VirtualMachinePlatform
dism /online /Enable-Feature /FeatureName:Microsoft-Hyper-V-All

winget install ubuntu
wsl --set-default-version 2

