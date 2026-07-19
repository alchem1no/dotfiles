return {
	{
		"neovim/nvim-lspconfig",
        dependencies = {
            "saghen/blink.cmp",
            "mason-org/mason-lspconfig.nvim",
            "b0o/schemastore.nvim",
            "folke/lazydev.nvim",
        },

        config = function()
            local capabilities =
                require("blink.cmp").get_lsp_capabilities()

            local servers = {
                "lua_ls",
                "pyright",
                "bashls",
                "yamlls",
                "clangd",
                "html",
            }

            for _, server in ipairs(servers) do
                vim.lsp.config(server, {
                    capabilities = capabilities,
                })
            end

            vim.lsp.config("jsonls", {
                capabilities = capabilities,
                settings = {
                    json = {
                        schemas = require("schemastore").json.schemas(),
                        validate = { enable = true },
                    },
                },
            })
            table.insert(servers, "jsonls")

            local gtk_css_dirs = {
                "waybar",
                "walker",
            }

            local css_lint = {
                unknownAtRules = "ignore",
                unknownProperties = "ignore",
                unknownVendorSpecificProperties = "ignore",
            }

            vim.lsp.config("cssls", {
                capabilities = capabilities,
                settings = {
                    css  = { lint = css_lint },
                    scss = { lint = css_lint },
                    less = { lint = css_lint },
                },
                on_attach = function(_, bufnr)
                    local name = vim.api.nvim_buf_get_name(bufnr)
                    for _, dir in ipairs(gtk_css_dirs) do
                        if name:match(dir) then
                            vim.diagnostic.enable(false, {
                                bufnr = bufnr
                            })
                            return
                        end
                    end
                end,
            })
            table.insert(servers, "cssls")

            if vim.fn.has("linux") == 1 then
                vim.lsp.config("hyprls", {
                    capabilities = capabilities,
                })
                table.insert(servers, "hyprls")
            end

            local pses = vim.fs.joinpath(
                vim.fn.stdpath("data"),
                "mason", "packages", "powershell-editor-services"
            )
            local shell = (vim.fn.executable("pwsh") == 1) and "pwsh"
            or (vim.fn.executable("powershell") == 1) and "powershell"
            or nil

            if shell then
                vim.lsp.config("powershell_es", {
                    capabilities = capabilities,
                    bundle_path  = pses,
                    shell        = shell,
                })
                table.insert(servers, "powershell_es")
            end

            vim.lsp.enable(servers)

        end,
	},
}
