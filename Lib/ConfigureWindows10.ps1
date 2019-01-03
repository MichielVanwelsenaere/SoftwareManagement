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

