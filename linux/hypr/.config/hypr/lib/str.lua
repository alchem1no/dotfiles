-- capitalize(word) -> string
--     Parens are load-bearing: gsub returns (string, count), and a bare return
--     would leak the count as a second value into the caller's arg list.

local M = {}

function M.capitalize(word)
    return (word:gsub("^%l", string.upper))
end

return M
