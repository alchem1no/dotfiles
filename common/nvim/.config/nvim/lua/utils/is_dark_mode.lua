local myos = require("core.myos")

local M = {}

function M.is_dark_mode()
    if myos.is_linux then
        -- 'ss' represents two string arguments passed to the Read method
        local obj = vim.system({
            "busctl", "--user", "call",
            "org.freedesktop.portal.Desktop",
            "/org/freedesktop/portal/desktop",
            "org.freedesktop.portal.Settings",
            "Read", "ss",
            "org.freedesktop.appearance", "color-scheme"
        }):wait()

        -- Check exit code first
          if obj.code ~= 0 then
            -- Optional: inspect obj.stderr to see what failed
            return false
          end

          -- Parse stdout (obj.stdout is a string)
          local mode = obj.stdout:match("(%d+)%s*$")
          return mode == "1"

    elseif myos.is_windows then
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
end

return M
