return {
    {
        "olimorris/codecompanion.nvim",
        enabled = true,
        version = "19.0.0",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        
        cmd = {
            "CodeCompanion",
            "CodeCompanionChat",
            "CodeCompanionActions",
            "CodeCompanionCmd"
        },
        keys = {
            {
                "<leader>aa",
                "<cmd>CodeCompanionActions<cr>",
                mode = { "n", "v" },
                desc = "Actions (CodeCompanion)",
            },
            {
                "<leader>ac",
                "<cmd>CodeCompanionChat Toggle<cr>",
                mode = { "n", "v" },
                desc = "Toggle chat (CodeCompanion)",
            },
            {
                "<leader>an",
                "<cmd>CodeCompanionChat<cr>",
                mode = "n",
                desc = "New chat (CodeCompanion)",
            },
            {
                "<leader>ai",
                ":CodeCompanion ",
                mode = { "n", "v" },
                desc = "Inline prompt (CodeCompanion)",
            },
            {
                "<leader>am",
                ":CodeCompanionCmd ",
                mode = "n",
                desc = "Generate command (CodeCompanion)",
            },
        },

        opts = {
            adapters = {
                acp = {
                    claude_code = function()
                        return require("codecompanion.adapters").extend("claude_code", {})
                    end,
                },
            },
            strategies = {
                chat = {
                    adapter = "claude_code",
                },
            },
        },
    }
}
