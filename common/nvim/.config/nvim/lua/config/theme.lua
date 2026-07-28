local CONST = require("constants")

local apply_tokyonight =
    require("utils.apply_tokyonight")
local is_dark_mode =
    require("utils.is_dark_mode").is_dark_mode

if vim.g.neovide then
    apply_tokyonight(
        is_dark_mode() and CONST.THEME_DARK or CONST.THEME_LIGHT,
        CONST.HEX_TRANSPARENCY
    )
else
    apply_tokyonight(CONST.THEME_DARK, CONST.HEX_TRANSPARENCY)
end
