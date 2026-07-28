$sw = [Diagnostics.Stopwatch]::StartNew()
function Lap($label) {
    Write-Host ("{0,6} ms  {1}" -f $sw.ElapsedMilliseconds, $label)
    $sw.Restart()
}

Import-Module -Name Microsoft.WinGet.CommandNotFound; Lap 'WinGet.CommandNotFound'
. ([ScriptBlock]::Create((& scoop-search --hook | Out-String))); Lap 'scoop-search --hook'
Invoke-Expression (&starship init powershell); Lap 'starship init'
Import-Module Terminal-Icons; Lap 'Terminal-Icons'
Import-Module ZLocation;      Lap 'ZLocation'
Import-Module posh-git;       Lap 'posh-git'
Import-Module PSFzf;          Lap 'PSFzf'
