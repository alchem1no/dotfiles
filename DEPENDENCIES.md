# System dependencies

## Binaries

### Required

- nodejs, npm   — LSP servers (`pyright`, `bashls`, `yamlls`, `html`, `cssls`, `jsonls`)
- rust + cargo  — `blink.cmp`
- clang/gcc     — clangd LSP for C/C++
- make          — build `telescope-fzf-native`
- python3, pip  — some Mason tools
- git           — `lazy.nvim`, Mason
- ripgrep       — Telescope live_grep
- fd            — Telescope file_find
- lazygit       — `lazygit.nvim`
- xkb-switch    — langmapper.nvim (Linux)
- Nerd Fonts (e.g. CaskaydiaCove NF or FiraCode NF)

### Optional (quality-of-life)

- fzf           — fast finder, can be integrated into zsh
- eza           - better `ls`
- luarocks      — for `rocks.nvim` (not currently used)

### Install on Arch

```
sudo pacman -S git nodejs npm rust luarocks clang gcc make python python-pip fzf fd ripgrep lazygit xkb-switch
```

### LaTeX (Optional)

```
pacman -S texlive-most zathura zathura-pdf-mupdf
```

### Install on Windows

#### WinGet

```
winget install OpenJS.NodeJS Rustlang.Rustup BurntSushi.ripgrep.MSVC junegunn.fzf Jesse.Lazygit Git.Git Kitware.CMake
```

#### Scoop

```
scoop bucket add scoop-it https://github.com/younger-1/scoop-it
scoop install im-select
```

## Neovim

### Neovim formatters

```
:MasonInstall stylua black isort prettier
```

### DAPs

```
:MasonInstall debugpy codelldb
```

### Tree-sitter parsers (in case they don't install automatically)

```
:TSUpdate
```

## PowerShell (Cross-platform)

### PowerShell module installation

```
Install-Module Terminal-Icons, ZLocation, posh-git, PSFzf -Scope CurrentUser
```
