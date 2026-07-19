local map = vim.keymap.set
local cmd = vim.cmd
local g = vim.g
local notify = vim.notify
local HEX_TRANSPARENCY = "cc"
local apply_tokyonight =
    require("utils.apply_tokyonight").apply_tokyonight
-- local myos = require("core.myos")

--------------------------------------------------
-- Basic
--------------------------------------------------

map("n", "<leader><leader>", "<cmd>source %<CR>", {
    desc = "Source current file"
})
map("n", "<C-s>", "<cmd>w<CR>", {
    desc = "Save file (classic editor shortcut)"
})
map("n", "<C-w>", "<cmd>q<CR>", {
    desc = "Close (classic editor shortcut)"
})
map("n", "<leader>R", "<cmd>restart<CR>", {
    desc = "Restart Neovim (not fully)"
})
map("n", "<Esc>", "<cmd>nohlsearch<CR>", {
    desc = "Clear search highlight"
})
map ("n", "<C-\\>", "<cmd>terminal<CR>", {
    desc = "Open Neovim's built-in terminal"
})

--------------------------------------------------
-- Set <leader> key
--------------------------------------------------

g.mapleader = " "
g.maplocalleader = "\\"

--------------------------------------------------
-- Open Oil
--------------------------------------------------

map("n", "-", "<cmd>Oil<CR>", {
    desc = "Oil: Open current directory"
})
map("n", "~", "<cmd>Oil ~<CR>", {
    desc = "Oil: Open home directory"
})

--------------------------------------------------
-- F keys
--------------------------------------------------

map("n", "<F1>", "<cmd>help<CR>", {
    desc = "Help",
})

map("n", "<F2>", vim.lsp.buf.rename, {
    desc = "Rename Symbol",
})

map("n", "<F3>", "*", {
    desc = "Search Word",
})

map("n", "<F4>", "<cmd>Trouble diagnostics toggle<CR>", {
    desc = "Diagnostics",
})

map("n", "<F5>", "<cmd>write | !python %<CR>", {
    desc = "Run File (Python)",
})

map("n", "<F6>", "<cmd>ToggleTerm<CR>", {
    desc = "ToggleTerm",
})

map("n", "<F8>", function()
    g.autoformat = not g.autoformat

    notify(
        "Autoformat: " ..
        (g.autoformat and "ON" or "OFF")
    )
end, {
    desc = "Toggle Autoformat",
})

-- Set up Zen mode via Snacks
-- map("n", "<F9>", , {
--     desc = "",
-- })

map("n", "<F10>", "<cmd>Neotree toggle<CR>", {
    desc = "Toggle Neotree",
})

map("n", "<F12>", function()
    cmd("nohlsearch")
    cmd("silent! cclose")
    cmd("silent! lclose")
    cmd("silent! TroubleClose")
end, {
    desc = "Cleanup UI",
})

--------------------------------------------------
-- Leader key
--------------------------------------------------

--------------------------------------------------
-- Toggle stuff
--------------------------------------------------

map("n", "<leader>tf", function()
	vim.g.autoformat = not vim.g.autoformat

    vim.notify(
        "Autoformat: " .. (vim.g.autoformat and "ON" or "OFF"),
        vim.log.levels.INFO,
        { title = "Conform" }
    )
end, {
	desc = "Toggle AutoFormat",
})

map("n", "<leader>tm", function()
    local ok, minimap = pcall(require, "mini.map")
    if ok then
        require("mini.map").toggle()
    end
end, {
	desc = "Toggle MiniMap",
})

map ("n", "<leader>tb", "<cmd>Neotree toggle<CR>", {
    desc = "Toggle Neo-tree"
})

--------------------------------------------------
-- Split
--------------------------------------------------

for _, key in ipairs({ "h", "s" }) do
    map ("n", "<leader>s" .. key, function()
        cmd("split")
        cmd("wincmd j")
    end, {
        desc = "Split Horizontally",
    })
end

map ("n", "<leader>sv", function()
    cmd("vsplit")
    cmd("wincmd l")
    end, {
    desc = "Split Vertically",
})

map ("n", "<leader>ux", "<cmd>close<CR>", {
    desc = "Close"
})

------------------
--- ToggleTerm ---
------------------

local pwsh = "pwsh"
    .. " -NoLogo"

-- Helper functions
-- Get table of terminals
local terms = {}
local function get_terms()
    if not terms.default then
        local Terminal =
            require("toggleterm.terminal").Terminal
        terms.default  = Terminal:new({
            hidden = true
        })
        terms.zsh      = Terminal:new({
            cmd = "zsh",  hidden = true
        })
        terms.pwsh     = Terminal:new({
            cmd = pwsh,   hidden = true
        })
        terms.bash     = Terminal:new({
            cmd = "bash", hidden = true
        })
        terms.cmd      = Terminal:new({
            cmd = "cmd",  hidden = true
        })
    end
    return terms
end

-- Map a key only if OS has specified shell executable
local function termmap(keybind, shell, term_key, desc)
    if shell == nil or vim.fn.executable(shell) == 1 then
        map("n", keybind, function()
            get_terms()[term_key]:toggle()
        end, {
            desc = desc
        })
    end
end

-- Default Shell keymap
termmap(
    "<leader>ttt", nil, "default",
    "ToggleTerm"
)

-- Specific shell keymaps
termmap(
    "<leader>ttz", "zsh", "zsh",
    "ToggleTerm Zsh"
)

termmap(
    "<leader>ttp", "pwsh", "pwsh",
    "ToggleTerm PowerShell"
)

termmap(
    "<leader>ttb", "bash", "bash",
    "ToggleTerm Bash"
)

termmap(
    "<leader>ttc", "cmd", "cmd",
    "ToggleTerm CMD (Win)"
)

-- Function key Shell keymap
termmap(
    "<F6>", nil, "default",
    "ToggleTerm"
)

-- Specific shell keymaps
termmap(
    "<C-F6>", "zsh", "zsh",
    "ToggleTerm Zsh"
)

termmap(
    "<S-F6>", "pwsh", "pwsh",
    "ToggleTerm PowerShell"
)

termmap(
    "<C-S-F6>", "bash", "bash",
    "ToggleTerm Bash"
)

termmap(
    "<C-A-S-F6>", "cmd", "cmd",
    "ToggleTerm CMD (Win)"
)

--------------------------------------------------
-- tokyonight.nvim
--------------------------------------------------

map ("n", "<leader>utd", function()
    apply_tokyonight("day", HEX_TRANSPARENCY)
end, {
    desc = "Tokyo Night Day"
})

map ("n", "<leader>utn", function()
    apply_tokyonight("night", HEX_TRANSPARENCY)
end, {
    desc = "Tokyo Night Night"
})

map ("n", "<leader>utm", function()
    apply_tokyonight("moon", HEX_TRANSPARENCY)
end, {
    desc = "Tokyo Night Moon"
})

map ("n", "<leader>uts", function()
    apply_tokyonight("storm", HEX_TRANSPARENCY)
end, {
    desc = "Tokyo Night Storm"
})

--------------------------------------------------
-- Switching between windows (panels in Neovim)
-- via Alt + arrows and Alt + h/j/k/l
--------------------------------------------------

for _, key in ipairs({ "Left", "h" }) do
        map ("n", "<C-" .. key .. ">", function()
        cmd("wincmd h")
    end, {
        desc = "Move focus to left window"
    })
end

for _, key in ipairs({ "Right", "l" }) do
        map ("n", "<C-" .. key .. ">", function()
        cmd("wincmd l")
    end, {
        desc = "Move focus to right window"
    })
end

for _, key in ipairs({ "Down", "j" }) do
        map ("n", "<C-" .. key .. ">", function()
        cmd("wincmd j")
    end, {
        desc = "Move focus to lower window"
})
end

for _, key in ipairs({ "Up", "k" }) do
        map ("n", "<C-" .. key .. ">", function()
        cmd("wincmd k")
    end, {
        desc = "Move focus to upper window"
})
end

---------------
--- Lazygit ---
---------------

map("n", "<leader>lg", "<cmd>LazyGitCurrentFile<CR>", {
    desc = "LazyGit"
})

--------------------------------------------------
-- CodeCompanion
--------------------------------------------------

map("n", "<leader>c", "<cmd>CodeCompanionChat<CR>", {
    desc = "Open Code Companion Chat"
})

--------------------------------------------------
-- Bufferline
--------------------------------------------------

map('n', '<leader>bd', '<cmd>Bdelete<CR>', {
    desc = 'Close current buffer'
})

map('n', '<leader>bD', '<cmd>Bdelete!<CR>', {
    desc = 'Force close current buffer'
})
