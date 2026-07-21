local api   = vim.api
local paths = require("config.paths")
local myos  = require("core.myos")

-- Helper functions
local function create_config_command(command, base_path)
    api.nvim_create_user_command(command, function(opts)
        local path

        if opts.args == "." or opts.args == "" then
            path = base_path
        else
            local file = opts.args
            path = vim.fs.joinpath(base_path, file)
        end

        vim.cmd.edit(path)
    end, {
        nargs = "?"
    })
end

local function register_configs(group)
    for _, config in ipairs(group) do
        for _, alias in ipairs(config.aliases) do
            create_config_command(alias, config.path)
        end
    end
end


-- Table of user commands (with syntactic sugar)
local configs = {
    universal = {
        {
            path    = paths.nvimconf,
            aliases = {
                "Conf",
                "Config",
                "ConfNvim",
                "ConfNeovim",
                "NvimConf",
                "NeovimConf",
            },
        },
        {
            path    = paths.git,
            aliases = { "Git" },
        },
        {
            path    = paths.data,
            aliases = { "Data" },
        },
        {
            path    = paths.dotconf,
            aliases = {
                "DotConf",
                "Dotconf",
                "DotConfig",
                "Dotconfig",
            }
        },
        {
            path    = paths.user,
            aliases = { "User", "Home" }
        },
    },

    windows = {
        {
            path    = paths.visual_studio_repos,
            aliases = { "VSProj", "VSProjects" }
        },
        {
            path    = paths.labs,
            aliases = { "Labs", "UniversityLabs" }
        },
        {
            path    = paths.wtconf,
            aliases = {
                "Confwt",
                "ConfWt",
                "ConfWT",
                "WtConf",
            }
        },
    },

    linux = {
        {
            path    = paths.zshrc,
            aliases = { "Zshrc" }
        },
        {
            path    = paths.zshenv,
            aliases = { "Zshenv" }
        },
        {
            path    = paths.zprofile,
            aliases = { "Zprofile" }
        },
        {
            path = paths.localbin,
            aliases = {
                "LocalBin",
                "Localbin",
                "UserBin",
                "Userbin",
            }
        }
    },

    macos = {},
}

-- Register universal paths
register_configs(configs.universal)

-- Register OS-specific paths
local os_configs = {
    windows = configs.windows,
    linux   = configs.linux,
    macos   = configs.macos,
}
local platform = os_configs[myos.current_os]

if platform then
    register_configs(platform)
end

vim.api.nvim_create_user_command("CheckDarkMode", function()
    local is_dark = require("utils.is_dark_mode").is_dark_mode()
    vim.notify("Dark Mode: " .. tostring(is_dark), vim.log.levels.INFO)
end, {})
