return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",

        config = function()
            require("nvim-treesitter").setup({
                ensure_installed = {
                    "bash", "c", "cpp", "css", "html", "javascript",
                    "json", "jsonc", "latex", "lua", "markdown", "markdown_inline",
                    "powershell", "python", "query", "regex", "ruby", "rust",
                    "toml", "typescript", "vim", "vimdoc", "yaml",
                },

                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    }
}
