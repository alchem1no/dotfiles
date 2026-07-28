local pwsh = "pwsh -NoLogo"

-- Lazily-built table of terminals
local terms = {}
local function get_terms()
    if not terms.default then
        local Terminal = require("toggleterm.terminal").Terminal
        terms.default  = Terminal:new({ hidden = true })
        terms.zsh      = Terminal:new({ cmd = "zsh",  hidden = true })
        terms.pwsh     = Terminal:new({ cmd = pwsh,   hidden = true })
        terms.bash     = Terminal:new({ cmd = "bash", hidden = true })
        terms.cmd      = Terminal:new({ cmd = "cmd",  hidden = true })
    end
    return terms
end

-- Base keys
local keys = {
    { "<F12>", "<cmd>ToggleTerm<cr>", desc = "ToggleTerm" },
}

-- Add a key spec only if the shell exists
local function termmap(lhs, shell, term_key, desc)
    if shell == nil or vim.fn.executable(shell) == 1 then
        table.insert(keys, {
            lhs,
            function()
                get_terms()[term_key]:toggle()
            end,
            desc = desc,
        })
    end
end

-- <leader> maps
termmap("<leader>ttt", nil,    "default", "ToggleTerm")
termmap("<leader>ttz", "zsh",  "zsh",     "ToggleTerm Zsh")
termmap("<leader>ttp", "pwsh", "pwsh",    "ToggleTerm PowerShell")
termmap("<leader>ttb", "bash", "bash",    "ToggleTerm Bash")
termmap("<leader>ttc", "cmd",  "cmd",     "ToggleTerm CMD (Win)")

-- Function-key maps
termmap("<F6>",       nil,    "default", "ToggleTerm")
termmap("<C-F6>",     "zsh",  "zsh",     "ToggleTerm Zsh")
termmap("<S-F6>",     "pwsh", "pwsh",    "ToggleTerm PowerShell")
termmap("<C-S-F6>",   "bash", "bash",    "ToggleTerm Bash")
termmap("<C-A-S-F6>", "cmd",  "cmd",     "ToggleTerm CMD (Win)")

return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",

        cmd = "ToggleTerm",
        keys = keys,

        config = function()
            local main_shell = os.getenv("SHELL")
            local comspec    = os.getenv("COMSPEC")
            local pspath     = os.getenv("PSModulePath")

            local default_shell
            if main_shell then
                default_shell = main_shell
            elseif pspath then
                default_shell = "pwsh.exe"
                .. " -NoLogo"
                .. " -NoExit"
                .. " -ExecutionPolicy RemoteSigned"
            elseif comspec then
                default_shell = comspec
            else
                default_shell = "sh"
            end

            require("toggleterm").setup({
                shell = default_shell
            })
        end,
    },
}
