require("core")
require("lazy").setup("plugins")
-- pcall(require, "local")
require("config")

if vim.g.neovide then
    require("neovide")
end
