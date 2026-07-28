# ============================================================================
#  Helpers
# ============================================================================

# Cache an external tool's `init` output to disk and dot-source it. Regenerates
# only when the tool's binary is newer than the cache (or the cache is missing/
# empty), so we pay the process-spawn cost ~once per update instead of on every
# shell launch.
function Import-CachedHook {
    param(
        [Parameter(Mandatory)][string]$Name,
        [Parameter(Mandatory)][string]$Command,
        [Parameter(Mandatory)][scriptblock]$Generator
    )
    if (-not (Get-Command $Command -ErrorAction SilentlyContinue)) { return }
    $cacheDir = Join-Path $HOME '.cache\pwsh-init'
    $cache    = Join-Path $cacheDir "$Name.ps1"
    $src      = (Get-Command $Command).Source
    $stale = (-not (Test-Path $cache)) -or ((Get-Item $cache).Length -eq 0)
    if (-not $stale -and $src) {
        $stale = (Get-Item $src).LastWriteTimeUtc -gt (Get-Item $cache).LastWriteTimeUtc
    }
    if ($stale) {
        New-Item -ItemType Directory -Force -Path $cacheDir | Out-Null
        (& $Generator | Out-String) | Set-Content -LiteralPath $cache -Encoding utf8
    }
    . $cache
}

# ============================================================================
#  Functions
# ============================================================================

function which {
    (Get-Command $args[0]).Path
}

function Get-Path {
    param([string]$ProgramName)
    Split-Path (Get-Command $ProgramName).Source
}

function Get-ProgramDirectory {
    param([string]$ProgramName)
    Get-Path $ProgramName
}

function Set-LocationVisible {
    param([string]$Path)
    Set-Location $Path && Get-ChildItem
}

function Q { exit }

# eza-backed directory listings
function ls { eza --icons $args }
function ll { eza -l --icons $args }
function la { eza -la --icons $args }
function lt { eza --tree --icons $args }

# ============================================================================
#  Aliases
# ============================================================================

Set-Alias fcd  Get-ProgramDirectory   # find a program's directory
Set-Alias cdls Set-LocationVisible
Set-Alias v    nvim
Set-Alias vi   nvim

# ============================================================================
#  PSReadLine — editing, prediction, keybindings, colors
# ============================================================================

# vi editing with a cursor that reflects the current mode
Set-PsReadlineOption -EditMode vi
Set-PSReadLineOption -ViModeIndicator Script -ViModeChangeHandler {
    param($mode)
    if ($mode -eq 'Command') {
        Write-Host -NoNewLine "`e[2 q"   # normal mode — block
    } else {
        Write-Host -NoNewLine "`e[6 q"   # insert mode — vertical line
    }
}

# Fish/zsh-style history-based autocomplete
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView   # dropdown list, or InlineView

# Keybindings
Set-PSReadLineKeyHandler -Key Tab       -Function MenuComplete
Set-PSReadLineKeyHandler -Key UpArrow   -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# PSFzf — lazy-load on first Ctrl+R, then hand off to the real fzf handler.
# Keeps 262ms off startup; the first Ctrl+R pays it once.
Set-PSReadLineKeyHandler -Chord 'Ctrl+r' -ScriptBlock {
    Import-Module PSFzf
    Set-PsFzfOption -PSReadlineChordReverseHistory 'Ctrl+r'
    Invoke-FzfPsReadlineHandlerHistory
}

# Syntax highlighting colors
Set-PSReadLineOption -Colors @{
    Command   = 'Cyan'
    Parameter = 'DarkCyan'
    String    = 'Yellow'
    Error     = 'Red'
}

# ============================================================================
#  Shell integrations
# ============================================================================

# Prompt
Import-CachedHook -Name 'starship' -Command 'starship' -Generator { starship init powershell }

# Directory jumping: prefer zoxide (fast init); fall back to ZLocation if it
# isn't installed yet.  Install with:  scoop install zoxide
if (Get-Command zoxide -ErrorAction SilentlyContinue) {
    Import-CachedHook -Name 'zoxide' -Command 'zoxide' -Generator { zoxide init powershell }
} else {
    Import-Module ZLocation
}

# ============================================================================
#  Windows-only
# ============================================================================

if ($IsWindows) {
    #f45873b3-b655-43a6-b217-97c00aa0db58 PowerToys CommandNotFound module
    Import-Module -Name Microsoft.WinGet.CommandNotFound
    #f45873b3-b655-43a6-b217-97c00aa0db58

    # scoop-search hook (cached)
    Import-CachedHook -Name 'scoop-search' -Command 'scoop-search' -Generator { scoop-search --hook }

    function wtconf {
        nvim "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
    }
}
