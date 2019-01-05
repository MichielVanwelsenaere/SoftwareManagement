function ClearStart{
    #Unpin as much as you can from start
    (New-Object -Com Shell.Application).NameSpace('shell:::{4234d49b-0245-4df3-b780-3893943456e1}').Items()| foreach { ($_).Verbs() | ?{$_.Name.Replace('&', '') -match 'From "Start" UnPin|Unpin from Start'} | %{$_.DoIt()}  }
}

function ClearDesktop{
    #Remove the desktop icons just made by the choco installations
    $DesktopPath = [Environment]::GetFolderPath("Desktop")
    Get-ChildItem -Path $DesktopPath -Include *.* -File -Recurse | foreach { $_.Delete()}
    $DesktopPath = [Environment]::GetFolderPath("CommonDesktopDirectory")
    Get-ChildItem -Path $DesktopPath -Include *.* -File -Recurse | foreach { $_.Delete()}
}

function ConfigureFileExplorer{
    $key = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
    Write-Host "1. Enabling showing hidden files"
    Set-ItemProperty $key Hidden 1
    Write-Host "2. Disabling hiding extensions for known files"
    Set-ItemProperty $key HideFileExt 0
    Write-Host "3. Disabling showing hidden operation system files"
    Set-ItemProperty $key ShowSuperHidden 0
    Write-Host "Restarting explorer shell to apply registry changes"
    Stop-Process -processname explorer
}