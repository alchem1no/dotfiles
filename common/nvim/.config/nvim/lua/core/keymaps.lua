local map = vim.keymap.set
local cmd = vim.cmd
local g = vim.g
local notify = vim.notify

--------------------------------------------------
-- Basic
--------------------------------------------------

map("n", "<C-s>", "<cmd>w<CR>", {
    desc = "Save file (classic editor shortcut)"
})
map("n", "<C-w>", "<cmd>q<CR>", {
    desc = "Close (classic editor shortcut)"
})
-- map("n", "<leader>a", "<cmd>restart<CR>", {
--     desc = "Restart Neovim (not fully)"
-- })
map("n", "<Esc>", "<cmd>nohlsearch<CR>", {
    desc = "Clear search highlight"
})
map ("n", "<C-\\>", "<cmd>terminal<CR>", {
    desc = "Open Neovim's built-in terminal"
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

map("n", "<F8>", function()
    g.autoformat = not g.autoformat

    notify(
        "Autoformat: " ..
        (g.autoformat and "ON" or "OFF")
    )
end, {
    desc = "Toggle Autoformat",
})

map("n", "<F9>", function()
    cmd("nohlsearch")
    cmd("silent! cclose")
    cmd("silent! lclose")
    cmd("silent! TroubleClose")
end, {
    desc = "Cleanup UI",
})

--------------------------------------------------
-- Set <leader> key
--------------------------------------------------

g.mapleader      = " "  -- Space key
g.maplocalleader = "\\" -- Backslash key

--------------------------------------------------
-- Local leader key
--------------------------------------------------

map("n", "<localleader>s", "<cmd>w<CR>", {
    desc = "Save file"
})

map("n", "<localleader>r", function()
    local filename = vim.api.nvim_buf_get_name(0)
    local extension = vim.fn.fnamemodify(filename, ":e")

    if extension == "lua" then
        -- Source the file silently
        cmd("source %")
        notify("File sourced", vim.log.levels.INFO, {
            title = "Neovim"
        })
    else
        -- Show notification for non-lua files
        notify("Cannot source: Not a Lua file",
            vim.log.levels.WARN, {
                title = "Neovim"
            }
        )
    end
end, {
    desc = "Source file in Neovim"
})

map("n", "<localleader>q", "<cmd>q<CR>", {
    desc = "Quit"
})

--------------------------------------------------
-- Leader key
--------------------------------------------------

--------------------------------------------------
-- Lazy
--------------------------------------------------

map("n", "<leader>ll", "<cmd>Lazy<cr>", {
    desc = "Lazy (plugin manager)"
})

--------------------------------------------------
-- Toggle
--------------------------------------------------

map("n", "<leader>tf", function()
	g.autoformat = not g.autoformat

    notify(
        "Autoformat: " .. (vim.g.autoformat and "ON" or "OFF"),
        vim.log.levels.INFO,
        { title = "Conform" }
    )
end, {
	desc = "Toggle AutoFormat",
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

--------------------------------------------------
-- Switching between windows (panels in Neovim)
-- via Alt + arrows and Alt + h/j/k/l
--------------------------------------------------

for _, key in ipairs({ "Left", "h" }) do
        map("n", "<C-" .. key .. ">", function()
        cmd("wincmd h")
    end, {
        desc = "Move focus to left window"
    })
end

for _, key in ipairs({ "Right", "l" }) do
        map("n", "<C-" .. key .. ">", function()
        cmd("wincmd l")
    end, {
        desc = "Move focus to right window"
    })
end

for _, key in ipairs({ "Down", "j" }) do
        map("n", "<C-" .. key .. ">", function()
        cmd("wincmd j")
    end, {
        desc = "Move focus to lower window"
})
end

for _, key in ipairs({ "Up", "k" }) do
        map("n", "<C-" .. key .. ">", function()
        cmd("wincmd k")
    end, {
        desc = "Move focus to upper window"
})
end
