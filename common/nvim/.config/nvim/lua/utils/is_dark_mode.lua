local M = {}

function M.is_dark_mode()
    local handle = io.popen(
        'powershell -NoProfile '
        .. '"(Get-ItemProperty '
        .. '-Path HKCU:\\SOFTWARE\\Microsoft\\Windows\\'
        .. 'CurrentVersion\\Themes\\Personalize'
        .. ').AppsUseLightTheme'
    )

    if not handle then
        return true
    end

    local result = handle:read("*a")
    handle:close()

    return tonumber(result) == 0
end

return M
