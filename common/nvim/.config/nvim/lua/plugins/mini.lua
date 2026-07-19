return {
    {
        "echasnovski/mini.nvim",

        version = false,

        config = function()
            local map = require("mini.map")
            local icons = require("mini.icons")
            local folder = "󰉋"
            local lua = "󰢱"

            map.setup({
                integrations = {
                    map.gen_integration.builtin_search(),
                    map.gen_integration.diagnostic(),
                    map.gen_integration.gitsigns(),
                },

                symbols = {
                    encode = map.gen_encode_symbols.dot("4x2"),
                },
            })

            icons.setup({
                default = {
                    directory = {
                        glyph = folder,
                        hl = "MiniIconsBlue",
                    },
                },

                -- by file extension
                extension = {
                    lua = {
                        glyph = lua,
                        hl = "MiniIconsBlue",
                    },
                --     css = {
                --         glyph = "",
                --         hl = "MiniIconsAzure",
                --     },
                },

                -- by exact filename
                -- file = {
                --     ["init.lua"] = {
                --         glyph = "",
                --         hl = "MiniIconsGreen",
                --     },
                --     [".gitignore"] = {
                --         glyph = "",
                --         hl = "MiniIconsGrey",
                --     },
                -- },

                -- by filetype
                -- filetype = {
                --     hyprland = {
                --         glyph = "",
                --         hl = "MiniIconsCyan",
                --     },
                -- },

                -- also: directory, os, lsp
            })
            icons.mock_nvim_web_devicons()
        end,
    }
}
