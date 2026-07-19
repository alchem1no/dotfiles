return {
	{
		"windwp/nvim-autopairs",
        enabled = true,

		event = "InsertEnter",

        opts = {
            check_ts = true,
            map_cr = true,
            fast_wrap = { map = "<M-e>" },
            disable_filetype = {
                "TelescopePrompt",
                -- "markdown",
            }
        },

		config = function(_, opts)
            local autopairs = require("nvim-autopairs")
            local Rule = require("nvim-autopairs.rule"),

            autopairs.setup(opts)

            autopairs.add_rules({
                Rule(" ", " "):with_pair(function(opts)
                    local pair = opts.line:sub(opts.col - 1, opts.col)

                    return vim.tbl_contains({
                        "()",
                        "[]",
                        "{}",
                    }, pair)
                end),
            })
        end,
	}
}
