$configKomorebi = "$HOME\.config\komorebi"
$configWhkd     = "$HOME\.config"

[Environment]::SetEnvironmentVariable(
    "KOMOREBI_CONFIG_HOME",
    $configKomorebi,
    "User"
)

$storedValueKomorebi = [Environment]::GetEnvironmentVariable(
    "WHKD_CONFIG_HOME",
    "User"
)

[Environment]::SetEnvironmentVariable(
    "KOMOREBI_CONFIG_HOME",
    $configWhkd,
    "User"
)

$storedValueWhkd = [Environment]::GetEnvironmentVariable(
    "KOMOREBI_CONFIG_HOME",
    "User"
)

if ($storedValueKomorebi -eq $configKomorebi) {
    Write-Host "KOMOREBI_CONFIG_HOME successfully set to: $storedValueKomorebi"
}
else {
    Write-Host "Failed to set KOMOREBI_CONFIG_HOME"
}

if ($storedValueWhkd -eq $configWhkd) {
    Write-Host "WHKD_CONFIG_HOME successfully set to: $storedValueWhkd"
}
else {
    Write-Host "Failed to set WHKD_CONFIG_HOME"
}
