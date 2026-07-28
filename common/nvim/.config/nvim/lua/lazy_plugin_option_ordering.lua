-- This is an example of typical key ordering in plugin configs
--[[
{
    "author/plugin",
    dependencies = { ... },

    cmd = { ... },
    keys = { ... },      -- triggers up top
    event = "VeryLazy",

    opts = { ... },
    config = function() ... end,   -- heavy body last
}
--]]
