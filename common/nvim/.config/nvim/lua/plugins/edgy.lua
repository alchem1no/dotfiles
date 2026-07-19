return {
    {
        "folke/edgy.nvim",
        event = "VeryLazy",
        enabled = true,

        init = function()
            -- Default splitting will cause your main
            -- splits to jump when opening an edgebar.
            -- To prevent this, set `splitkeep` to either
            -- `screen` or `topline`.
            vim.opt.splitkeep = "screen"
        end,

        opts = {
            left = {},
            right = {},
            bottom = {
                {
                    ft = "toggleterm",
                    size = { height = 0.4 },

                    filter = function(_, win)
                        return vim.api.nvim_win_get_config(win).relative == ""
                    end,
                },
            },
            top = {},
        },
    }
}
