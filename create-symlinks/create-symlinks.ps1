# Enable Toast Messages if installed
$toastEnabled = $null -ne (Get-Module -ListAvailable BurntToast)
if ($toastEnabled) {
    Import-Module BurntToast -ErrorAction SilentlyContinue
}

$successIconPath = "$PSScriptRoot\assets\success.png"
$warningIconPath = "$PSScriptRoot\assets\warning.png"

$links = @(
    @{
        Link   = "$env:LOCALAPPDATA\nvim"
        Target = "$PSScriptRoot\common\nvim"
        Logo   = "$PSScriptRoot\assets\neovim.png"
    },
    @{
        Link   = "$env:APPDATA\neovide"
        Target = "$PSScriptRoot\common\neovide"
        Logo   = "$PSScriptRoot\assets\neovide.png"
    }
)

# Helper function for displaying messages with available method
function Show-Message {
    param (
        [string]$Title,
        [string]$Message,
        [string]$LogoPath
    )

    if ($toastEnabled) {

        if ($LogoPath -and (Test-Path $LogoPath)) {
            New-BurntToastNotification `
                -Text $Title, $Message `
                -AppLogo $LogoPath
        }
        else {
            New-BurntToastNotification `
                -Text $Title, $Message
        }
        
    }
    else {
        Write-Host "$Title`n$Message`n"
    }
}

# Function checks whether item is a symlink link or junction
function Test-ReparsePoint {
    param (
        [string]$Path
    )

    $item = Get-Item $Path -ErrorAction SilentlyContinue

    return (
        $null -ne $item -and
        ($item.Attributes -band [IO.FileAttributes]::ReparsePoint)
    )
}

# Main processing loop
foreach ($entry in $links) {

    $linkPath   = $entry.Link
    $targetPath = $entry.Target
    $logoPath   = $entry.Logo

    # Check if symlink already exists
    if (Test-Path $linkPath) {

        if (Test-ReparsePoint $linkPath) {
            Show-Message `
                "Reparse point already exists" `
                $linkPath `
                $logoPath
        }
        else {
            Show-Message `
                "Item exists but isn't a symbolic link or junction" `
                $linkPath `
                $warningIconPath
        }

        continue
    }

    # Check if target exists
    if (-not (Test-Path $targetPath)) {
        Show-Message `
            "Target does not exist" `
            $targetPath `
            $logoPath
        continue
    }

    # Check if item is a folder or a file
    $itemType = if (Test-Path $targetPath -PathType Container) {
        "Junction"
    }
    else {
        "SymbolicLink"
    }

    try {

        New-Item `
            -ItemType $itemType `
            -Path $linkPath `
            -Target $targetPath

        Show-Message `
            "Created $itemType" `
            "$linkPath -> $targetPath" `
            $logoPath

    }
    catch {

        Show-Message `
            "Failed to create $itemType" `
            $_.Exception.Message `
            $warningIconPath
        
    }

}

# End Message
Show-Message `
    "Setup complete" `
    "All symlinks created" `
    $successIconPath

# if ($Host.Name -eq "ConsoleHost") {
#     Read-Host "Press Enter to exit"
# }
