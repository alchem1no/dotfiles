vim.g.autoformat = true

return {
	{
		"stevearc/conform.nvim",

        keys = {
            {
                "<F7>",
                function()
                    require("conform").format({ async = true })
                end,
                mode = "n",
                desc = "Format File",
            },
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
