return {
	{
		"L3MON4D3/LuaSnip",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },

        build = "make install_jsregexp",

        config = function()
            local luasnip = require("luasnip")

            require("snippets.general")
            luasnip.add_snippets("lua", require("snippets.general"))
            require("luasnip.loaders.from_vscode").lazy_load({
                paths = {
                    vim.fs.joinpath(vim.fn.stdpath("config"), "snippets")
                },
            })

            luasnip.filetype_extend("jsonc", { "json" })

            luasnip.config.setup({
                history = true,
                updateevents = "TextChanged,TextChangedI",
            })
        end,
	},
}
