local g = vim.g
local o = vim.o
local notify = vim.notify
local redraw = vim.cmd.redraw
local schedule = vim.schedule
local INFO = vim.log.levels.INFO

local M = {}

-- Constants
local DEFAULT_FONT_SIZE = 14
local MIN_FONT_SIZE = 1
local MAX_FONT_SIZE = 24
local DEFAULT_OPACITY = 0.9
local MIN_OPACITY = 0.4
local MAX_OPACITY = 1.0
local FONT = "CaskaydiaCove Nerd Font"

-- Configuration
M.font_size = DEFAULT_FONT_SIZE
M.opacity = DEFAULT_OPACITY
g.neovide_opacity = M.opacity

-- Helper functions
local function clamp(value, min, max)
	return math.max(min, math.min(max, value))
end

local function apply_font(size)
	o.guifont = ("%s:h%d"):format(FONT, size)
end

-- Shows notification properly
local function neovide_notify(fmt, ...)
    local args = { ... }

    schedule(function()
        notify(
            fmt:format(unpack(args)),
            INFO,
            { title = "Neovide" })
    end)
end

-- Main functions

function M.change_font_size(delta, should_notify)

    should_notify = should_notify or false

	delta = delta or 0

	M.font_size = clamp(M.font_size + delta, MIN_FONT_SIZE, MAX_FONT_SIZE)
    apply_font(M.font_size)

	if should_notify then
        neovide_notify(
            "Font size: %d",
            M.font_size
        )
	end

    redraw()
end

function M.reset_font_size(should_notify)
    M.font_size = DEFAULT_FONT_SIZE
    apply_font(M.font_size)

	if should_notify then
        neovide_notify(
            "Font size: default (%d)",
            M.font_size
        )
	end

    redraw()
end

function M.change_opacity(delta)
	M.opacity = clamp(M.opacity + delta, MIN_OPACITY, MAX_OPACITY)
	g.neovide_opacity = M.opacity

    neovide_notify(
        "Opacity: %.0f%%",
        M.opacity * 100
    )
end

function M.reset_opacity(should_notify)
    M.opacity = DEFAULT_OPACITY
    g.neovide_opacity = M.opacity

    if should_notify then
    neovide_notify(
        "Opacity: default (%.0f%%)",
        M.opacity * 100
    )
    end
end

-- Unused function. Just didn't want to delete it <D-🙂>
--[[
function M.change_opacity2(delta, use_normal)
	assert(
        use_normal == nil or type(use_normal) == "boolean",
        "use_normal must be boolean"
    )

    local target

	if use_normal then
		target = "neovide_normal_opacity"
	else
		target = "neovide_opacity"
	end

	M[target] = clamp(M[target] + delta, 0.4, 1.0)
    if use_normal then
        g.neovide_normal_opacity = M[target]
    else
        g.neovide_opacity = M[target]
    end

    neovide_notify(
        "Opacity: %.0f%%",
        g[target] * 100
    )
end
]]

return M
