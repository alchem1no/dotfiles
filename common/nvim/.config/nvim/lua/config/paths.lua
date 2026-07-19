local stdpath = vim.fn.stdpath
local expand = vim.fn.expand
local joinpath = vim.fs.joinpath

local myos = require("core.myos")

-- Helper functions
local function find_package_dir(package_name)
    local packages = joinpath(
        os.getenv("LOCALAPPDATA"),
        "Packages"
    )

    for name, type in vim.fs.dir(packages) do
        if type == "directory" and name:find(package_name, 1, true) then
            return joinpath(packages, name)
        end
    end

    return nil
end

-- Local variables
local wt_package = myos.is_windows
    and find_package_dir("Microsoft.WindowsTerminal")
    or nil

local M = {}

--Universal paths
M.nvimconf  = stdpath("config")
M.data      = stdpath("data")
M.state     = stdpath("state")
M.cache     = stdpath("cache")
M.log       = stdpath("log")
M.run       = stdpath("run")

M.user    = expand("~")
M.dotconf = expand("~/.config")
M.git     = expand("~/Dev/Git")

M.lazypath = M.data .. "/lazy/lazy.nvim"

-- Linux-specifix paths
if myos.is_linux then
    M.zshrc    = expand("~/.zshrc")
    M.zshenv   = expand("~/.zshenv")
    M.zprofile = expand("~/.zprofile")
    M.localbin = expand("~/.local/bin")
end

-- Windows-specific paths
if myos.is_windows then
    M.wtconf       = wt_package and joinpath(
        wt_package,
        "LocalState",
        "settings.json"
    )

    M.visual_studio_repos = expand("~/source/repos/")
    M.labs                = expand("~/source/repos/University-Labs")
end

return M
