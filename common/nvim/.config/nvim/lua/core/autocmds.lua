local api = vim.api
local cmd = vim.cmd
local fn  = vim.fn
local g   = vim.g
local opt = vim.opt
local v   = vim.v

local deps = { "node", "luarocks", "rg", "fd", "clang" }

------------------------------------------------------------
-- Autocmd groups
------------------------------------------------------------

local title_group =
    api.nvim_create_augroup("Title", { clear = true })

local startup_group =
    api.nvim_create_augroup("Startup", { clear = true })

local terminal_group =
    api.nvim_create_augroup("Terminal", { clear = true })

------------------------------------------------------------
-- Window name
------------------------------------------------------------
-- %t - filename
-- %F - full path
-- %m - shows [+] when file contents change
-- %a - shows (R0) if opened in read-only mode

api.nvim_create_autocmd(
    { "BufEnter", "BufModifiedSet" },
    {
        group = title_group,

        callback = function()
            local filename = fn.expand("%:t")

            if filename == "" then
                filename = "[No Name]"
            end

            local modified = vim.bo.modified and " [+]" or ""
            local readonly = vim.bo.readonly and " [R0]" or ""

            local app = g.neovide and "Neovide" or "Neovim"

            opt.titlestring =
                string.format("%s%s%s - %s",
                    filename,
                    readonly,
                    modified,
                    app
                )
        end
})

------------------------------------------------------------
-- Enter in ~/Dev directory on launch
------------------------------------------------------------

api.nvim_create_autocmd("VimEnter", {
    group = startup_group,

    callback = function()
        if fn.argc() == 0 then
            cmd.cd("~")
        end
    end
})

-- Set cursor at the beginning in terminal after leaving Neovim
api.nvim_create_autocmd("VimLeave", {
    group = terminal_group,

	callback = function()
		fn.chansend(v.stderr, "\27[5 q")
	end
})

-- Warning if dependencies not installed
for _, dep in ipairs(deps) do
    if vim.fn.executable(dep) == 0 then
        vim.notify(
            "Missing dependency: " .. dep,
            vim.log.levels.WARN,
            { title = "nvim deps" }
        )
    end
end
