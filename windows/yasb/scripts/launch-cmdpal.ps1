$exe = Get-ChildItem `
    -Path "$env:LOCALAPPDATA\Microsoft\PowerToys\CmdPal" `
    -Filter "Microsoft.CmdPal.UI.exe" `
    -Recurse -ErrorAction SilentlyContinue

if ($exe) {
    Start-Process $exe
}
else {
    $appID = Get-StartApps |
        Where-Object Name -match 'Command Palette' |
        Select-Object -ExpandProperty AppID
    Start-Process explorer.exe "shell:AppsFolder\$($appID)"
}


