$ConfigFile = "$Env:KOMOREBI_CONFIG_HOME\komorebi.json"
$Json = Get-Content $ConfigFile | ConvertFrom-Json

if ($Json.theme.name -eq "TokyoNightDark") {
    $Json.theme.name = "TokyoNightLight"
}
else {
    $Json.theme.name = "TokyoNightDark"
}

$Json | ConvertTo-Json -Depth 10 | Set-Content $ConfigFile -Encoding UTF8

# Komorebi config reload
komorebic reload-configuration
