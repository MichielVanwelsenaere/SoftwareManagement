# docs here: https://gist.github.com/jchandra74/5b0c94385175c7a8d1cb39bc5157365e
function InstallPowerlineFonts {
    git clone https://github.com/powerline/fonts.git
    cd fonts
    .\install.ps1
}

function ConfigureOhMyPosh {
    Import-Module 'posh-git'
    Import-Module 'oh-my-posh'
    Set-Theme agnoster
}