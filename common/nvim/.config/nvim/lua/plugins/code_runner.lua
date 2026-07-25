return {
    {
        "CRAG666/code_runner.nvim",

        config = function()
            require('code_runner').setup({
                filetype = {
                    python = "python3 -u",
                    typescript = "deno run",
                    javascript = "node",
                    rust = "cd $dir && cargo run",
                    c = "cd $dir && gcc $fileName -o $fileNameWithoutExt"
                        .. " && $dir/$fileNameWithoutExt",
                },
            })
        end,
        keys = {
            { '<leader>rr',  '<cmd>RunCode<CR>', desc = 'Run Code' },
            { '<leader>rf', '<cmd>RunFile<CR>', desc = 'Run File' },
            { '<leader>rc', '<cmd>RunClose<CR>', desc = 'Close Runner Window' },
        },
    }
}
