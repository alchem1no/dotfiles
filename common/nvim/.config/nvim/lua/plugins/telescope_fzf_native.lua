return {
    {
        "nvim-telescope/telescope-fzf-native.nvim",

        build = function()
            if vim.fn.has("win32") == 1 then
                return table.concat({
                    "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release",
                    "cmake --build build --config Release",
                    [[if exist "build\Release\libfzf.dll" copy /Y "build\Release\libfzf.dll" "build\libfzf.dll"]],
                }, " && ")
            else
                return "make"
            end
        end,

        cond = function()
            if vim.fn.has("win32") == 1 then
                return vim.fn.executable("cmake") == 1
            else
                return vim.fn.executable("make") == 1
            end
        end,

        config = function()
            pcall(require("telescope").load_extension, "fzf")
        end,
    },
}
