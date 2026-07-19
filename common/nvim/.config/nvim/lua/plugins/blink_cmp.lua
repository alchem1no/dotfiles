return {
    {
        "saghen/blink.cmp",
        version = "1.*",

        dependencies = {
            "saghen/blink.lib",
            "rafamadriz/friendly-snippets",
        },

        build = function()
            require("blink.cmp").build():wait(60000)
        end,

        opts = function()
            local has_autopairs =
                require("lazy.core.config").plugins["nvim-autopairs"] ~= nil

            return {
                appearance = {
                    nerd_font_variant = "mono",
                },

                cmdline = {
                    enabled = true,
                },

                completion = {
                    accept = {
                        auto_brackets = {
                            enabled = not has_autopairs,
                        },
                    },

                    documentation = {
                        auto_show = true,
                        auto_show_delay_ms = 200,
                    },

                    ghost_text = {
                        enabled = true
                    },

                    list = {
                        selection = {
                            preselect = false,
                        },
                    },

                    menu = {
                        border = "rounded",
                    },
                },

                fuzzy = {
                    implementation = "prefer_rust"
                },

                keymap = {
                    preset = "default",

                    ["<Tab>"] = { "select_next", "fallback" },
                    ["<S-Tab>"] = { "select_prev", "fallback" },
                    ["<CR>"] = { "accept", "fallback" },
                },

                signature = {
                    enabled = true,
                },

                sources = {
                    default = {
                        "lsp",
                        "path",
                        "snippets",
                        "buffer",
                    },

                    providers = {
                        lazydev = {
                            name = "LazyDev",
                            module = "lazydev.integrations.blink",
                            score_offset = 100,
                        },
                    },
                },
            }
        end,
    }
}
