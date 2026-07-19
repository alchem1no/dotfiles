vim.g.autoformat = false

return {
	{
		"stevearc/conform.nvim",
        
        keys = {
            vim.keymap.set("n", "<F7>", function()
                require("conform").format({ async = true })
            end, {
                desc = "Format File",
            }),
        },

		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
                python = { "isort", "black" },
                javascript = { "prettier" },
			},

			format_on_save = function()
				if vim.g.autoformat then
					return {
						timeout_ms = 500,
						lsp_format = "fallback",
					}
				end

				return false
			end,
		},
	},
}
