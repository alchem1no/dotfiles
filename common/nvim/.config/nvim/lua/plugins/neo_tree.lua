return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        enabled = true,
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },

        keys = {
            {
                "<F10>",
                "<cmd>Neotree toggle<cr>",
                mode = "n",
                desc = "Toggle Neotree",
            },
            {
                "<leader>tn",
                "<cmd>Neotree toggle<cr>",
                mode = "n",
                desc = "Toggle Neotree",
            },
        },
    }
}
