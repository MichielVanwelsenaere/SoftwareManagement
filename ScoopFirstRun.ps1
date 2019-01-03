function InstallScoop{
    [environment]::setEnvironmentVariable('SCOOP','C:\Scoop','User')
    $env:SCOOP='D:\Scoop'
    iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
}

function CheckIfScoopInstalled {    
    $ScoopInstalled = $false
    if (Get-Command scoop.exe -ErrorAction SilentlyContinue) {
        $ScoopInstalled = $true
    }
    return $ScoopInstalled
}

Write-Host "Checking if Scoop is installed"
if(CheckIfScoopInstalled){
    Write-Host "Scoop is already installed, skipping installation"
}else{
    Write-Host "Scoop installation not found, installing now.."
    InstallScoop
}