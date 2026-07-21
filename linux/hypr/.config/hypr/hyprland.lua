-- Author: alchem1no
-- GitHub: github.com/alchem1no

-- Dont change this file!
require("hyprland.reload_config_keybind")

-- Import safe-loading function
local try_require = require("lib.try_require")

-- Load configs
try_require("hyprland.monitors")
try_require("hyprland.permissions")
try_require("hyprland.autostart")
try_require("hyprland.look_and_feel")
try_require("hyprland.input")
try_require("hyprland.keybinds")
try_require("hyprland.windows_and_workspaces")
-- try_require("hyprland.debug")

-- HyprMod managed settings
try_require("hyprland.hyprland-gui")
