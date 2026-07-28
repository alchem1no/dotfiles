return {
    {
        "folke/which-key.nvim",

        event = "VeryLazy",

        config = function()
            local wk = require("which-key")

            wk.setup()

            wk.add({
                { "<leader>a", group = "CodeCompanion" },
                { "<leader>b", group = "Bufferline" },
                { "<leader>c", group = "Code_Runner" },
                { "<leader>f", group = "Search" },
                { "<leader>g", group = "Git" },
                { "<leader>h", group = "Harpoon" },
                { "<leader>l", group = "LazyGit" },
                { "<leader>q", group = "Persistence" },
                { "<leader>r", group = "Runner" },
                { "<leader>s", group = "Split" },
                { "<leader>t", group = "Toggle" },
                { "<leader>u", group = "UI" },
                { "<leader>ut", group = "Set Tokyo Night theme" },
                { "<leader>x", group = "Trouble" },
            })
        end,
    },
}
