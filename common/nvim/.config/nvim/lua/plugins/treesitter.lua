-- Parsers to keep installed
local parsers = {
    "bash", "c", "cpp", "css", "html", "javascript",
    "json", "latex", "lua", "markdown", "markdown_inline",
    "powershell", "python", "query", "regex", "ruby", "rust",
    "toml", "typescript", "vim", "vimdoc", "yaml",
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,        -- main branch does NOT support lazy-loading
        build = ":TSUpdate",

        config = function()
            -- Install/update our parsers (async; no-op if already present)
            require("nvim-treesitter").install(parsers)

            -- `jsonc` has no parser of its own; reuse the `json` parser for it
            vim.treesitter.language.register("json", "jsonc")

            local group =
                vim.api.nvim_create_augroup("treesitter", { clear = true })

            vim.api.nvim_create_autocmd("FileType", {
                group = group,
                callback = function(args)
                    -- Start highlighting; pcall guards filetypes with no parser
                    if not pcall(vim.treesitter.start, args.buf) then
                        return
                    end

                    -- Experimental Treesitter indentation.
                    -- Delete this line to keep native/LSP indent instead.
                    vim.bo[args.buf].indentexpr =
                        "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end,
    }
}
