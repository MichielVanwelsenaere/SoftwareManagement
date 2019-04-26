# docs here: https://gist.github.com/jchandra74/5b0c94385175c7a8d1cb39bc5157365e
function InstallPowerlineFonts {
    git clone https://github.com/powerline/fonts.git
    cd fonts
    .\install.ps1
}

function ConfigureOhMyPosh {
    sudo Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
    Import-Module posh-git -Force
    Import-Module oh-my-posh -Force
    Set-Theme agnoster
}

function InstallVsCodeExtensions{
    code --install-extension peterjausovec.vscode-docker
    code --install-extension eamodio.gitlens
    code --install-extension robertohuertasm.vscode-icons
    code --install-extension ms-vscode.csharp
    code --install-extension ms-vscode.powershell
    code --install-extension ms-vscode.csharp
    code --install-extension dotjoshjohnson.xml
    code --install-extension ms-azuretools.vscode-logicapps
    code --install-extension mitchdenny.ecdc
}