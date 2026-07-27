return {
    {
        "folke/which-key.nvim",

        event = "VeryLazy",

        config = function()
            local wk = require("which-key")

            wk.setup()

            wk.add({
                { "<leader>f", group = "Search" },
                { "<leader>g", group = "Git" },
                { "<leader>l", group = "LazyGit" },
                { "<leader>s", group = "Split" },
                { "<leader>t", group = "Toggle" },
                { "<leader>u", group = "UI" },
                { "<leader>x", group = "Trouble" },
                { "<leader>b", group = "Bufferline" },
                { "<leader>h", group = "Harpoon" },
                { "<leader>c", group = "Code_Runner" }
            })
        end,
    },
}
