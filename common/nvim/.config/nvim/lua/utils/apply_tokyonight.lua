local M = {}

-- hex_transparency is a string of 2 hex symbols, representing
-- alpha channel
function M.apply_tokyonight(theme_style, hex_transparency)
    local dark = theme_style ~= "day"

    vim.o.background = dark and "dark" or "light"

    require("tokyonight").setup({
        style = theme_style,
        transparent = not vim.g.neovide,
        styles = {
            sidebars = "transparent",
            floats = "transparent",
            comments = { italic = true },
            keywords = { italic = true },
        },

        on_highlights = function(hl, c)
            hl.ps1Variable = { fg = c.magenta }
        end,
    })

    vim.cmd.colorscheme("tokyonight")

    --------------------------------------------------
    -- Apply additional theme settings
    --------------------------------------------------

	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1f2335" })
	vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })

    --------------------------------------------------
    -- Neovide background
    --------------------------------------------------

    if vim.g.neovide then
        local colors =
            require("tokyonight.colors").setup({
                style = theme_style,
            })

        vim.g.neovide_background_color = 
            colors.bg .. hex_transparency

        vim.g.neovide_theme = dark and "dark" or "light"
    end
end

return M
