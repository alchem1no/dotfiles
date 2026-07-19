return {
    {
        "nvim-telescope/telescope.nvim",

        dependencies = {
            "nvim-lua/plenary.nvim",
        },

        config = function()
            local builtin = require("telescope.builtin")

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
                
            vim.keymap.set("n", "<leader>ff",
            builtin.find_files, {
                desc = "Find Files",
            })
            vim.keymap.set("n", "<leader>fg",
            builtin.live_grep, {
                desc = "Live Grep",
            })
            vim.keymap.set("n", "<leader>fb",
            builtin.buffers, {
                desc = "Buffers",
            })
            vim.keymap.set("n", "<leader>fh",
            builtin.help_tags, {
                desc = "Help Tags",
            })
            vim.keymap.set("n", "<leader>fn", function()
                local query = vim.fn.input("Grep config > ")
                if query == "" then
                    return
                end

                builtin.grep_string({
                    search = query,
                    cwd = vim.fn.stdpath("config"),
                })
            end, {
                desc = "Grep Neovim config"
            })
        end,
    },
}
