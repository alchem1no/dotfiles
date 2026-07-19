local function load_modules(path)
    for name, type in vim.fs.dir(vim.fs.joinpath(vim.fn.stdpath("config"), "lua", path)) do
        if
            type == "file"
            and name:match("%.lua")
            and name ~= "init.lua"
        then
            local module =
                path .. "." .. name:gsub("%.lua$", "")

            require(module)
        end
    end
end

return load_modules
