# Software management

Get your software working stack installed **and managed** in a breeze.

# How?

By using [Scoop](https://github.com/lukesampson/scoop), it's possible to install your software stack using simple powershell commands.
The scripts in this repo take care of installing a number of programs I use daily for workpurposes.

# Installation

Download the repo and execute `ScoopFirstRun.ps`, this will:
- install all apps defined in the script (`ScoopFirstRun.ps`)
- install some vscode extentions (`Lib/ConfigureSoftware.ps1`)
- install PowerlineFonts (`Lib/ConfigureSoftware.ps1`)
- install and configure OhMyPosh (`Lib/ConfigureSoftware.ps1`)
- configure file explorer: show extentions and hidden files (`Lib/ConfigureWindows10.ps1`)
- clear the desktop (`Lib/ConfigureWindows10.ps1`)
- set the keyboard (`Lib/ConfigureWindows10.ps1`)
- set the Windows 10 UI language (`Lib/ConfigureWindows10.ps1`)

This is my personal setup, best to make modifications to fit your personal needs.

# Management
Scoop has some commands to easily manage your installed software using the powershell commandline: 

### Search for software:
```ps
λ  scoop search azure
'extras' bucket:
    azure-cli (2.0.63)
    azure-functions-core-tools (2.6.1064)
    azure-ps (6.13.1.24243)
    azuredatastudio-insiders (1.6.0)
    azuredatastudio (1.6.0)
```

### Install software
```ps
λ  scoop install postman
```

### Open homepage software
```ps
λ  scoop home postman
```

### Reset shortcut to a specific version
allows pointing the shortcut to specific version:
```ps
λ  scoop reset postman@7.0.5
```
reset to the latest version using:
```ps
λ  scoop reset postman
```

### Check for updates
```ps
λ  scoop status
```

### Install all available updates
```ps
λ  scoop update *
```

### Update scoop itself
```ps
λ  scoop update
```

### Uninstall software
```ps
λ  scoop uninstall postman
```