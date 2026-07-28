return {
    {
        "jellydn/quick-code-runner.nvim",
        enabled = false,
        dependencies = { "MunifTanjim/nui.nvim" },

        cmd = {
            "QuickCodeRunner",
            "QuickCodePad",
        },
        keys = {
            {
              "<leader>cr",
              ":QuickCodeRunner<CR>",
              desc = "Quick Code Runner",
              mode = "v",
            },
            {
              "<leader>cp",
              ":QuickCodePad<CR>",
              desc = "Quick Code Pad",
            },
        },

        opts = {
            debug = false,
        },
    }
}
