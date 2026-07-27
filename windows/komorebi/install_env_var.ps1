$configFolderKomorebi = "$HOME\.config\komorebi"
$configFolder     = "$HOME\.config"

[Environment]::SetEnvironmentVariable(
    "KOMOREBI_CONFIG_HOME",
    $configFolderKomorebi,
    "User"
)

$storedValueKomorebi = [Environment]::GetEnvironmentVariable(
    "WHKD_CONFIG_HOME",
    "User"
)

[Environment]::SetEnvironmentVariable(
    "KOMOREBI_CONFIG_HOME",
    $configFolder,
    "User"
)

$storedValueWhkd = [Environment]::GetEnvironmentVariable(
    "KOMOREBI_CONFIG_HOME",
    "User"
)

if ($storedValueKomorebi -eq $configFolderKomorebi) {
    Write-Host "KOMOREBI_CONFIG_HOME successfully set to: $storedValueKomorebi"
}
else {
    Write-Host "Failed to set KOMOREBI_CONFIG_HOME"
}

if ($storedValueWhkd -eq $configFolder) {
    Write-Host "WHKD_CONFIG_HOME successfully set to: $storedValueWhkd"
}
else {
    Write-Host "Failed to set WHKD_CONFIG_HOME"
}
