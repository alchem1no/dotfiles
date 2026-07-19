return {
    {
        "olimorris/codecompanion.nvim",
        enabled = false,
        version = "19.0.0",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },

        opts = {
            interactions = {
                chat = {
                    adapter = {
                        name = "ollama",
                        model = "gemma4:latest",
                    },
                },

                inline = {
                    adapter = {
                        name = "ollama",
                        model = "gemma4:latest",
                    },
                },
            },
        },
    }
}
