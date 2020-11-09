function InstallScoop{
    [environment]::setEnvironmentVariable('SCOOP','C:\Scoop','User')
    $env:SCOOP='C:\Scoop'
    iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
}

function CheckIfScoopInstalled {
    $ScoopInstalled = $false
    if (Get-Command 'scoop' -ErrorAction SilentlyContinue) {
        $ScoopInstalled = $true
    }
    return $ScoopInstalled
}

# Set the execution policy so scoop can be installed
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

# Load libraries
. .\Lib\ConfigureSoftware.ps1
. .\Lib\ConfigureWindows10.ps1


# Will do nothing is Scoop is already installed
if(-Not (CheckIfScoopInstalled)){
    Write-Host "Scoop not yet installed, installing now.."
    InstallScoop
}
else{
    Write-Host "Scoop already installed"
}

# Install git first so we can add other buckets
scoop install git

#Install some extras buckets
scoop bucket add extras
scoop bucket add Ash258 'https://github.com/Ash258/scoop-Ash258.git'

# Install aria2 to use multi-connection downloads
scoop install aria2

# Install essentials using Scoop
scoop install cmder-full
scoop install sudo
scoop install oh-my-posh
scoop install openssh
[environment]::setenvironmentvariable('GIT_SSH', (resolve-path (scoop which ssh)), 'USER')
scoop install vscode
scoop install docker-compose
scoop install storageexplorer
scoop install azure-ps
scoop install servicebusexplorer
scoop install azure-cli
scoop install winscp
scoop install azure-functions-core-tools
scoop install dotpeek
scoop install postman
scoop install wireshark
scoop install pwsh
scoop install SpaceSniffer
scoop install azuredatastudio
scoop install nmap
scoop install bfg
scoop install firefox
scoop install greenshot
scoop install lightshot
scoop install mqtt-explorer
scoop install linqpad

# Install nice to haves using Scoop, comment this for work devices
scoop install station

# Software not downloadable with Scoop but that might be of interest
# Docker
# Spotify
# office365proplus
# microsoft-teams
# visualstudio2017enterprise
# sql-server-management-studio
# CodeSys3
# DanSharpXmlViewer

# Configure Windows 10
ClearStart
ClearDesktop
ConfigureFileExplorer
ConfigureKeyBoard
ConfigureUILanguage

# Configure installed software
ConfigureOhMyPosh
InstallVsCodeExtensions
InstallPowerlineFonts
