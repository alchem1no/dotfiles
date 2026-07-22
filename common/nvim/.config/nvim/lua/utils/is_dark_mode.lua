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
        local obj = vim.system({
            "reg", "query",
            "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize",
            "/v", "AppsUseLightTheme"
        }):wait()

        -- key/value missing entirely (e.g. never toggled) -> assume light
        if obj.code ~= 0 then
            return false
        end

        -- obj.stdout looks like:
        --     AppsUseLightTheme   REG_DWORD   0x0
        local hex = obj.stdout:match("0x(%x+)")
        if not hex then
            return false
        end

        return tonumber(hex, 16) == 0
    end
end

return M
