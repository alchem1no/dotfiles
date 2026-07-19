local function try_require(module)
    local ok, result = pcall(require, module)
    if not ok then
        hl.notification.create({
            text    = "Failed to load module: "
            .. module .. "\n" .. result,
            timeout = 10000,
            icon    = "error",
        })
        return {}
    end
    return result
end

return try_require
