local apply_tokyonight =
    require("utils.apply_tokyonight").apply_tokyonight
local is_dark_mode =
    require("utils.is_dark_mode").is_dark_mode
local HEX_TRANSPARENCY = "cc"
local THEME_DARK = "night"
local THEME_LIGHT = "storm"

if vim.g.neovide then
    apply_tokyonight(
        is_dark_mode() and THEME_DARK or THEME_LIGHT,
        HEX_TRANSPARENCY
    )
else
    apply_tokyonight(THEME_DARK, HEX_TRANSPARENCY)
end
