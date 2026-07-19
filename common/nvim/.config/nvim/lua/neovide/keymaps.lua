local g = vim.g
local map = vim.keymap.set
local funcs = require("utils.functions_neovide")

-- Variable that toggles notifications
local should_notify = true

local function map_all(lhs, rhs, opts)
    map({ "n", "i" }, lhs, rhs, opts or { silent = true })
end

-- Helper function for changing neovide settings
local nv = {}

function nv.set(name, value)
    g["neovide_" .. name] = value
end

-- Apply default settings
funcs.reset_font_size()
funcs.reset_opacity()

-- Key maps specifically for Neovide
map_all("<C-=>", function()
	funcs.change_font_size(1, should_notify)
end)

map_all("<C-->", function()
	funcs.change_font_size(-1, should_notify)
end)

map_all("<C-ScrollWheelUp>", function()
	funcs.change_font_size(1, should_notify)
end)

map_all("<C-ScrollWheelDown>", function()
	funcs.change_font_size(-1, should_notify)
end)

map_all("<C-0>", function()
    funcs.reset_font_size(should_notify)
end)

map_all("<C-+>", function()
	funcs.change_opacity(0.05)
end)

map_all("<C-_>", function()
	funcs.change_opacity(-0.05)
end)

map_all("<C-S-ScrollWheelUp>", function()
	funcs.change_opacity(0.05)
end)

map_all("<C-S-ScrollWheelDown>", function()
	funcs.change_opacity(-0.05)
end)

map_all("<C-S-0>", function()
	funcs.reset_opacity(should_notify)
end)

for _, key in ipairs({
    "<leader>uf", "<F11>"
}) do
    map("n", key, function()
        g.neovide_fullscreen = not vim.g.neovide_fullscreen
    end, {
        desc = "Toggle Fullscreen"
    })
end

map("n", "<leader>un", function()
    should_notify = not should_notify
end, {
    desc = "Toggle Notifications"
})
