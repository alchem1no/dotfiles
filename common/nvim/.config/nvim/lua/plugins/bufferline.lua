return {
    {
        "akinsho/bufferline.nvim",
        version = "*",

        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

        config = function()
            require("bufferline").setup({
                options = {
                    mode = "buffers",
                    themable = true,
                    indicator = {
                        -- icon = "➤",
                        style = 'underline'
                    },
                    
                    diagnostics = "nvim_lsp",

                    close_command = "Bdelete! %d",
                    left_mouse_command = "buffer %d",
                    middle_mouse_command = "Bdelete %d",
                    right_mouse_command = "Bdelete! %d",

                    always_show_bufferline = false,
                    auto_toggle_bufferline = true,
                    -- hover = {
                    --     enabled = true,
                    --     delay = 200,
                    --     reveal = { 'close' }
                    -- },

                    show_buffer_close_icons = true,
                    show_close_icon = false,

                    separator_style = "thin",
                },
                highlights = {
                    fill = {
                        bg = "#1a1b26",
                    },
                    -- separator = {
                    --     fg = "none",
                    -- },
                },
            })

            vim.keymap.set(
                "n",
                "<S-h>",
                "<cmd>BufferLineCyclePrev<CR>",
                { desc = "Previous buffer" }
            )

            vim.keymap.set(
                "n",
                "<S-l>",
                "<cmd>BufferLineCycleNext<CR>",
                { desc = "Next buffer" }
            )
        end,
    }
}
