Set-PsReadlineOption -EditMode vi
Set-PSReadLineOption -ViModeIndicator Script -ViModeChangeHandler {
    param($mode)
    if ($mode -eq 'Command') {
        # Normal mode — block
        Write-Host -NoNewLine "`e[2 q"
    } else {
        # Insert mode — vertical line
        Write-Host -NoNewLine "`e[6 q"
    }
}

if ($IsWindows) {
    #f45873b3-b655-43a6-b217-97c00aa0db58 PowerToys CommandNotFound module

    Import-Module -Name Microsoft.WinGet.CommandNotFound
    #f45873b3-b655-43a6-b217-97c00aa0db58

    . ([ScriptBlock]::Create((& scoop-search --hook | Out-String)))

    function wtconf {
        nvim "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
    }
}

function which {
    (Get-Command $args[0]).Path
}

function Get-Path {
    param(
     [string]$ProgramName
    )
    Split-Path (Get-Command $ProgramName).Source
}

function Get-ProgramDirectory {
    param (
        [string]$ProgramName
    )
    Get-Path $ProgramName
}

function Set-LocationVisible {
    param(
        [string]$Path
    )
    Set-Location $Path && Get-ChildItem
}

# fcd - find program directory
Set-Alias fcd  Get-ProgramDirectory
Set-Alias cdls Set-LocationVisible

if ($IsWindows) {
    Remove-Alias ls
}

function ls { eza --icons $args }
function ll { eza -l --icons $args }
function la { eza -la --icons $args }
function lt { eza --tree --icons $args }

# Apply Starship theme
Invoke-Expression (&starship init powershell)

# Fish/zsh-style history-based autocomplete
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView   # dropdown list, or InlineView

# Better keybindings
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# Syntax highlighting colors
Set-PSReadLineOption -Colors @{
    Command   = 'Cyan'
    Parameter = 'DarkCyan'
    String    = 'Yellow'
    Error     = 'Red'
}

Import-Module Terminal-Icons
Import-Module ZLocation
Import-Module posh-git
Import-Module PSFzf

# PSFzf — bind Ctrl+R to fzf history search
Set-PsFzfOption -PSReadlineChordReverseHistory 'Ctrl+r'
