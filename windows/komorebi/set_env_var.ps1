$configHome = "$HOME\.config\komorebi"
$currentValue = [Environment]::GetEnvironmentVariable(
    "KOMOREBI_CONFIG_HOME",
    "User"
)

if ($currentValue -ne $configHome) {
    [Environment]::SetEnvironmentVariable(
        "KOMOREBI_CONFIG_HOME",
        $configHome,
        "User"
    )

    Write-Host "Updated KOMOREBI_CONFIG_HOME"
}
else {
    Write-Host "KOMOREBI_CONFIG_HOME already configured"
}
