local ls = require("luasnip")

local sn = ls.snippet_node
local t = ls.text_node
local c = ls.choice_node
local d = ls.dynamic_node

local rec_list

-- Stands for «recursive list»

local M = {}

function M.rec_list(_, _, old_state)
    old_state = old_state or { idx = 1 }

    local current = old_state.idx
    local next_idx = current + 1

    return sn(nil, {
        c(1, {
            t(""),
            sn(nil, {
                t({ "", ("i(%d),"):format(current) }),
                d(1, M.rec_list, {}, {
                    user_args = {
                        { idx = next_idx }
                    }
                }),
            }),
        }),
    })
end

return M
