local apply_tokyonight = require("utils.apply_tokyonight")
return {
    {
        "folke/tokyonight.nvim",
        -- enabled = false,
        lazy = false,
        priority = 1000,

        keys = {
            {
                "<leader>utn",
                function()
                    apply_tokyonight("night")
                end,
                mode = "n",
                desc = "Tokyo Night",
            },
            {
                "<leader>utm",
                function()
                    apply_tokyonight("moon")
                end,
                mode = "n",
                desc = "Tokyo Night Moon",
            },
            {
                "<leader>uts",
                function()
                    apply_tokyonight("storm")
                end,
                mode = "n",
                desc = "Tokyo Night Storm",
            },
            {
                "<leader>utd",
                function()
                    apply_tokyonight("day")
                end,
                mode = "n",
                desc = "Tokyo Night Day",
            },
        },

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
        end,
    }
}
