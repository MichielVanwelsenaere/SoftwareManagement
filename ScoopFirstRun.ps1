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

#Set the execution policy so scoop can be installed
Set-ExecutionPolicy RemoteSigned -scope CurrentUser

#Will do nothing is Scoop is already installed
if(!CheckIfScoopInstalled){
    InstallScoop
}

#Install some extras buckets
scoop bucket add extras
scoop bucket add Ash258 'https://github.com/Ash258/scoop-Ash258.git'

# Install aria2 to use multi-connection downloads
scoop install aria2

# Install essentials using Scoop
scoop install cmder-full
scoop install git
scoop install oh-my-posh
scoop install vscode
# scoop install vscode-docker
# scoop install vscode-gitlens
# scoop install vscode-csharp
# scoop install vscode-powershell
# scoop install vscode-azurerm-tools
# scoop install visualstudio2017enterprise
scoop install dotnet-sdk
scoop install docker
scoop install docker-compose
scoop install storageexplorer
scoop install azure-ps
scoop install servicebusexplorer
scoop install azure-cli
scoop install winscp
# scoop install sql-server-management-studio
scoop install azure-functions-core-tools
scoop install dotpeek
scoop install postman
scoop install soapui
scoop install wireshark
scoop install Chrome

# Install nice to haves using Scoop
scoop install lightshot
scoop install keeweb
scoop install telegram
scoop install whatsapp

# Installs software workonly
# scoop install microsoft-teams
scoop install slack

# Software not downloadable with Scoop but that shouldn't be forgotten
# plexmediaplayer
# Spotify
# office365proplus
