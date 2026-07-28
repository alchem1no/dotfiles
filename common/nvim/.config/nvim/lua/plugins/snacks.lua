return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,

        -- Template for a keybind
        -- keys = {
        --     {
        --         "<F9>",
        --         "",
        --         mode = "n",
        --         desc = "Zen mode",
        --     },
        -- },

        opts = {
            scroll = { enabled = true },
            statuscolumn = { enabled = true },
            animate = { enabled = true },
            dashboard = { enabled = false },
            indent = { enabled = false },
            input = { enabled = true },
            notifier = { enabled = false },
            quickfile = { enabled = true },
            scope = { enabled = false },
            words = { enabled = true },
        }
    }
}
