return {
	{
		"mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim"
        },
        opts = function()
            local ensure = {
                "lua_ls",
                "pyright",
                "bashls",
                "yamlls",
                "clangd",
                "html",
                "cssls",
                "jsonls",
                "powershell_es",
            }

            if vim.fn.has("linux") == 1 then
                table.insert(ensure, "hyprls")
            end

            return {
                ensure_installed = ensure,
                automatic_enable = false,
            }
        end
	},
}

