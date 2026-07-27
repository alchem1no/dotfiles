if ($IsWindows) {

    $platform = "windows"


    # Enable Toast Messages if installed
    $toastEnabled = $null -ne (Get-Module -ListAvailable BurntToast)
    if ($toastEnabled) {
        Import-Module BurntToast -ErrorAction SilentlyContinue
    }

    function Show-Message {
        param (
            [string]$Title
            [string]$Message
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
                    -Test $Title, $Message
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

    
}
elseif (IsLinux) {

    $platform = "linux"

    WriteHost "In development..."

}
