local M = {}

local uname = vim.uv.os_uname().sysname

local name_map = {
    Windows_NT  = "windows",
    Linux       = "linux",
    Darwin      = "macos",
}

M.current_os = name_map[uname] or uname
M.is_windows = uname == "Windows_NT"
M.is_linux   = uname == "Linux"
M.is_macos   = uname == "Darwin"

return M
