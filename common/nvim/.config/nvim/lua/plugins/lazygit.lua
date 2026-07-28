return {
    {
        "kdheepak/lazygit.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },

        keys = {
            {
                "<leader>lg",
                "<cmd>LazyGitCurrentFile<cr>",
                mode = "n",
                desc = "LazyGit (current file)",
            },
        },
    }
}
