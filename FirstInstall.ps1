function CheckIfChocoInstalled {
    $ChocoInstalled = $false
    if (Get-Command choco.exe -ErrorAction SilentlyContinue) {
        $ChocoInstalled = $true
    }
    return $ChocoInstalled
}

function InstallChoco {
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Check if Chocolatey is installed, otherwise install it
if (CheckIfChocoInstalled -eq $false){
    InstallChoco
}
#set the global confirmation flag to enable
choco feature enable -n allowGlobalConfirmation

# Install essentials using choco
choco install cmder
choco install git.install
choco install poshgit
choco install vscode
choco install vscode-docker
choco install vscode-gitlens
choco install vscode-csharp
choco install vscode-powershell
choco install vscode-azurerm-tools
choco install visualstudio2017enterprise
choco install googlechrome
choco install office365proplus
choco install dotnetcore-sdk
choco install docker
choco install docker-compose
choco install microsoftazurestorageexplorer
choco install azurepowershell
choco install servicebusexplorer
choco install azure-cli
choco install winscp.install
choco install sql-server-management-studio
choco install microsoft-teams

# Install nice to haves using choco
choco install lightshot
choco install keeweb
choco install spotify

#set the global confirmation flag to disable
choco feature disable -n allowGlobalConfirmation