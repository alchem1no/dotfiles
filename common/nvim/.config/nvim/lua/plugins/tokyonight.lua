return {
    {
        "folke/tokyonight.nvim",
        -- enabled = false,
        lazy = false,
        priority = 1000,

        opts = {
            styles = {
                -- Set background color for sidebars
                sidebars = "dark",
            },

            -- Enable the built-in styles for bufferline
            plugins = {
                auto = true,
            },

        },

        config = function()
            -- Load the colorscheme
            vim.cmd([[colorscheme tokyonight-night]])
        end
    },
}
