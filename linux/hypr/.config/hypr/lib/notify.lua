-- notify.lua — run a command and announce the result via notify-send.
--
-- cmd(command, title, text, icon, separator) -> string
--     Builds a shell command that runs `command`, then fires notify-send.
--     `title` and `text` are shell-quoted here — pass them raw, do NOT pre-quote.
--     `icon` and `separator` are optional; separator defaults to "&&", so the
--     notification only fires if `command` succeeded. Pass "" when `command`
--     already ends in an operator (e.g. a backgrounding "&").
--
-- toggle(name)                    -> function()    (state checked at press time)
-- reload_config(command, title, icon) -> dispatcher    (bind directly)
--     `title` is capitalized and quoted here — pass it raw.

local proc = require("lib.proc")
local str  = require("lib.str")

-- q for quote
local function q(s)
    return "'" .. tostring(s):gsub("'", [['\'']]) .. "'"
end

local M = {}

function M.cmd(command, title, text, icon, separator)
    local icon_flag = icon and (" --icon " .. icon) or ""
    return command
        .. " " .. (separator or "&&")
        .. " notify-send"
        .. " " .. q(title)
        .. " " .. q(text)
        .. icon_flag
end

function M.toggle(name, icon)
    icon = icon or "dialog-information"

    return function()
        local running = proc.is_running(name)
        local command = running and ("pkill -x " .. name) or (name .. " &")
        local state   = running and "is off" or "is on"
        local sep     = running and "&&" or ""

        hl.dispatch(hl.dsp.exec_cmd(
            M.cmd(
                command,
                "Toggle apps",
                str.capitalize(name) .. " " .. state,
                icon,
                sep
            )
        ))
    end
end

function M.reload_config(command, title, icon)
    return hl.dsp.exec_cmd(
        M.cmd(
            command,
            str.capitalize(title),
            "Config reloaded",
            icon
        )
    )
end

return M
