function CheckIfRunAsAdmin{
    $admin = [bool](([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544")
    if($admin -eq $false){
        throw "script should be run as admin!"
    }
}

function CheckIfChocoInstalled {
    $ChocoInstalled = $false
    if (Get-Command choco.exe -ErrorAction SilentlyContinue) {
        $ChocoInstalled = $true
    }
    return $ChocoInstalled
}

function InstallChoco {
Set-ExecutionPolicy Bypass -Scope Process -Force; `
  iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# docs here: https://gist.github.com/jchandra74/5b0c94385175c7a8d1cb39bc5157365e
function InstallPowerlineFonts {
    git clone https://github.com/powerline/fonts.git
    cd fonts
    .\install.ps1
}

function InstallAndConfigureOhMyPosh {
    Install-Module -Name 'oh-my-posh'
    Install-Module -Name 'posh-git'
    Import-Module 'posh-git'
    Import-Module 'oh-my-posh'
    Set-Theme agnoster
}

function InstallPowerShellNugetPackageProvider {
    Install-PackageProvider -Name NuGet -MinimumVersion '2.8.5.201' -Force
    Import-PackageProvider -Name NuGet -MinimumVersion '2.8.5.201'
}

#Main-function
function main {
    # Check if Chocolatey is installed, otherwise install it
    CheckIfRunAsAdmin
    $ChocoInstalled = CheckIfChocoInstalled
    if ($ChocoInstalled -eq $false){
        InstallChoco
        choco install chocolatey
    }
}

#Entry point
main

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
choco install azure-functions-core-tools
choco install dotpeek
choco install postman

# Install nice to haves using choco
choco install lightshot
choco install keeweb
choco install spotify
choco install plexmediaplayer
choco install telegram.install
choco install whatsapp

#as some of the custom install scripts might need environment variables/path stuff that just has been installed
refreshenv
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")

#stuff that has to be installed through powershell
Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted
InstallPowerShellNugetPackageProvider
InstallPowerlineFonts
InstallAndConfigureOhMyPosh

#Section for stuff that can't be scripted but shouldn't be forgotten
# CodeSys3

#Unpin as much as you can from start
(New-Object -Com Shell.Application).NameSpace('shell:::{4234d49b-0245-4df3-b780-3893943456e1}').Items()| foreach { ($_).Verbs() | ?{$_.Name.Replace('&', '') -match 'From "Start" UnPin|Unpin from Start'} | %{$_.DoIt()}  }

#Remove the desktop icons just made by the choco installations
$DesktopPath = [Environment]::GetFolderPath("Desktop")
Get-ChildItem -Path $DesktopPath -Include *.* -File -Recurse | foreach { $_.Delete()}
$DesktopPath = [Environment]::GetFolderPath("CommonDesktopDirectory")
Get-ChildItem -Path $DesktopPath -Include *.* -File -Recurse | foreach { $_.Delete()}

#set the global confirmation flag to disable
choco feature disable -n allowGlobalConfirmation