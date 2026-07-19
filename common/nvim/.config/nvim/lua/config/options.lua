local o = vim.opt
local g   = vim.g

-- Title
o.title = true
o.titlestring = "%F"

-- Universal Neovim clipboard
-- Enables only if OS supports it
-- Linux can bring some quirks, if this won't work
-- code this option manually
o.clipboard = "unnamedplus"

-- Disable automatic directory change
o.autochdir = false

-- Appearance
-- o.background = "dark"
-- o.termguicolors = true

o.number = true
o.relativenumber = true
o.numberwidth = 4

o.cursorline = true
o.signcolumn = "yes:1"

o.laststatus = 3

o.scrolloff = 999

-- Tabs & indentation
o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4

-- Folding
o.foldenable = true
o.foldcolumn = "1"
o.foldlevel = 99
o.foldtext = ""

o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- Command display
o.showcmd = true

-- Enabled mouse support for all modes (including clicks)
o.mouse = "a"

-- GUI
-- opt.guifont = "CaskaydiaCove Nerd Font"
o.guicursor = {
	"n-v-c:block",
	"i-ci-ve:ver25",
	"r-cr:hor20",
	"o:hor50",
	"a:blinkwait700-blinkoff400-blinkon250",
}

-- Sessions options for persistence.lua
o.sessionoptions = "buffers,curdir,folds,globals,help,skiprtp,tabpages,winsize,winpos,terminal"

-- Disable unused legacy providers
g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
g.loaded_python3_provider = 0

-- Use ripgrep for :grep / :vimgrep
o.grepprg = "rg --vimgrep --smart-case"
o.grepformat = "%f:%l:%c:%m"

-- Filetypes for LSP to not be annoying
vim.filetype.add({
    filename = {
        ["docker-compose.yml"]  = "yaml.docker-compose",
        ["docker-compose.yaml"] = "yaml.docker-compose",
        [".gitlab-ci.yml"]      = "yaml.gitlab",
        ["values.yaml"]         = "yaml.helm-values",
    },
})

vim.filetype.add({
    filename = {},
    pattern = {
        [".*/waybar/.*%.css"] = "scss",
        [".*/walker/.*%.css"] = "scss",
    },
})
