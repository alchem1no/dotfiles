return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",

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
