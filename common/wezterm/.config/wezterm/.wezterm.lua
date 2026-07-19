local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local mux = wezterm.mux
local screen = { width = 1920, height = 1080 }

default_prog = { 'pwsh.exe' }

config.initial_cols = 100
config.initial_rows = 24

local FONT = 'CaskaydiaCove Nerd Font'
config.font = wezterm.font(FONT)

config.font_size = 14

config.color_scheme = 'Tokyo Night'

-- Dropdown menu
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true

config.keys = {
    {
        key = 'F12',
        action = wezterm.action.ToggleFullScreen,
    },
}

wezterm.on('gui-startup', function()
    local _, _, window = mux.spawn_window({})
    local gui_window = window:gui_window()

    gui_window:set_position(screen.width / 24, 0)
    gui_window:set_inner_size(screen.width * (22 / 24), screen.height * 0.48)
end)

return config
