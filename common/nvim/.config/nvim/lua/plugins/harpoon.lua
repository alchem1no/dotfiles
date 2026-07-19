return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",

        dependencies = {
            "nvim-lua/plenary.nvim",
        },

        config = function()
            local harpoon = require("harpoon")

            harpoon:setup()

            local map = vim.keymap.set

            map("n", "<leader>ha",
                function()
                    harpoon:list():add()
                end,
                { desc = "Harpoon add file" })

            map("n", "<leader>he",
                function()
                    harpoon.ui:toggle_quick_menu(harpoon:list())
                end,
                { desc = "Harpoon menu" })

            map("n", "<leader>1",
                function()
                    harpoon:list():select(1)
                end,
                { desc = "File 1" })

            map("n", "<leader>2",
                function()
                    harpoon:list():select(2)
                end,
                { desc = "File 2" })

            map("n", "<leader>3",
                function()
                    harpoon:list():select(3)
                end,
                { desc = "File 3" })

            map("n", "<leader>4",
                function()
                    harpoon:list():select(4)
                end,
                { desc = "File 4" })

            map("n", "<leader>hh",
                function()
                    harpoon:list():prev()
                end,
                { desc = "Harpoon prev" })

            map("n", "<leader>hl",
                function()
                    harpoon:list():next()
                end,
                { desc = "Harpoon next" })
        end,
    }
}
