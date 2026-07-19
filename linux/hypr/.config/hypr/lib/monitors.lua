local M = {}

--[[
function M.get_all()
    local handle = io.popen("hyprctl monitors | awk '/^Monitor/{print $2}'")
    local output = handle:read("*a")
    handle:close()

    local monitors = {}
    for name in output:gmatch("[^\n]+") do
        table.insert(monitors, name)
    end
    return monitors
end
]]

local function read_trim(path)
    local f = io.open(path, "r")
    if not f then return nil end
    local v = (f:read("*a") or ""):gsub("%s+", "")
    f:close()
    return v
end

function M.get_all()
    local monitors = {}
    local drm = "/sys/class/drm/"

    local entries
    local ok, pdir = pcall(require, "posix.dirent")
    if ok then
        entries = pdir.dir(drm)
    else
        entries = {}
        local p = io.popen("ls -1 " .. drm .." 2>/dev/null")
        if p then
            for e in p:lines() do
                entries[#entries + 1] = e
            end
            p:close()
        end
    end

    for _, entry in ipairs(entries) do
        local name = entry:match("^card%d+%-(.+)$")
        if name then
            local base    = drm .. entry .. "/"
            local status  = read_trim(base .. "status")
            local enabled = read_trim(base .. "enabled")

            if status ~= "disconnected" and enabled == "enabled" then
                monitors[#monitors + 1] = name
            end
        end
    end

    return monitors
end

--[[
function M.get_primary()
    local all = M.get_all()
    return all[1]
end
]]

function M.is_screen_on()
    local drm = "/sys/class/drm/"
    local p = io.popen("ls -1 " .. drm .. " 2>/dev/null")
    if not p then return true end

    for entry in p:lines() do
        if entry:match("^card%d+%-(.+)$") then
            local dpms = read_trim(drm .. entry .. "/dpms")
            if dpms == "On" then
                p:close()
                return true
            end
        end
    end

    p:close()
    return false
end

return M
