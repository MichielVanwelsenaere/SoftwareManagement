function CheckIfRunAsAdmin{
    $admin = [bool](([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544")
    if($admin -eq $ false){
        throw "script should be run as admin!"
    }
}

CheckIfRunAsAdmin
choco upgrade all -y