-- proc.lua — process introspection.
--
-- is_running(name) -> boolean
--     True if a process matching `name` exactly (pgrep -x) is running.
--     `name` is interpolated into a shell command unquoted — callers must
--     pass a literal process name, not user input.
--
--     Detection is by stdout, not exit code: io.popen's close() does not
--     reliably return a status inside Hyprland (LuaJIT drops it entirely,
--     and the compositor may reap the child before pclose sees it). An
--     exit-code check silently returns false forever — toggle() then only
--     ever launches, never kills.

local M = {}

function M.is_running(name)
    local handle = io.popen("pgrep -x " .. name)
    if not handle then return false end
    local out = handle:read("*a") or ""
    handle:close()
    return out:match("%d") ~= nil
end

return M
