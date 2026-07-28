return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },

        keys = {
            {
                "<leader>ff",
                function()
                    require("telescope.builtin").find_files()
                end,
                mode = "n",
                desc = "Find Files",
            },
            {
                "<leader>fg",
                function()
                    require("telescope.builtin").live_grep()
                end,
                mode = "n",
                desc = "Live Grep",
            },
            {
                "<leader>fb",
                function()
                    require("telescope.builtin").buffers()
                end,
                mode = "n",
                desc = "Buffers",
            },
            {
                "<leader>fh",
                function()
                    require("telescope.builtin").help_tags()
                end,
                mode = "n",
                desc = "Help Tags",
            },
            {
                "<leader>fn",
                function()
                    local query = vim.fn.input("Grep config > ")
                    if query == "" then return end

                    require("telescope.builtin").grep_string({
                        search = query,
                        cwd = vim.fn.stdpath("config"),
                    })
                end,
                mode = "n",
                desc = "Grep Neovim config",
            },
        },

        config = function()
            require("telescope").setup({
                defaults = {
                    file_ignore_patterns = {
                        "AppData",
                        "OneDrive",
                        "Downloads",
                        "node_modules",
                        ".git/",
                        "gdrive/",
                    },
                },

                pickers = {
                    find_files = {
                        hidden = false,
                    },
                },
            })
        end,
    }
}
