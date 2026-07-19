local ls = require("luasnip")
local fmta = require("luasnip.extras.fmt").fmta
local rec_list = require("utils.rec_list").rec_list

local d = ls.dynamic_node
local s = ls.snippet
local i = ls.insert_node

return {

   ------------------------------------------------------------ 
   -- Meta snippet
   ------------------------------------------------------------ 

    s("snip",
        fmta(
[=[
s("<>",
    fmta(
        [[
<>
        ]],
        {
            <>
        }
    )
)
]=],
        {
            i(1, "trigger"),
            i(2, "body"),
            d(3, rec_list, {}),
        }
    )
)
}


--[[
    -- Lazy.nvim plugin snippet
	s("plugin", {
		
        t('{'),
        t({ '', '\t"' }),
        i(1, "author/plugin"),
        t('",'),

        t({ '', '', '' }),

        t('\tconfig = function()'),
        t({ '', '\t\trequire("' }),
        i(2, "plugin"),
        t('").setup({'),

        t({ '', '\t\t\t' }),
        i(3),

        t({ '', '\t\t)}' }),

        t({ '', '\tend,' }),
        t({ '', '},' }),

	}),

    -- vim.keymap.set snippet
    s("map", {

        t('vim.keymap.set("'),
        i(1, "n"),
        t('", "'),
        i(2, "<leader>x"),
        t('", function()'),

        t({ '', '\t' }),
        i(3),

        t({ '', 'end)' }),
        
    }),

    -- require snipper
    s("req", {

        t('require("'),
        i(1, "module"),
        t('")'),

    }),
})
]]
