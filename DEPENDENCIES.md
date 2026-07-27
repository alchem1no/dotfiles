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

- stow          — making symlinks fast
- fzf           — fast finder, can be integrated into zsh
- eza           — better `ls`
- luarocks      — for `rocks.nvim` (not currently used)
- tmux          — terminal multiplexer

## Linux

### Systemd services to enable

- hyprpolkitagent
- hypridle
- hyprpaper
- ydotoold
- dunst
- elephant
- opentabletdriver

Other:
- paccache.timer

### Install on Arch

```
sudo pacman -Syu
sudo pacman -S git curl wget zsh tar gzip xkb-switch \
    neovim ripgrep fd bat eza zoxide fzf sharship lazygit \
    tmux btop jq trash-cli \
    gcc clang make cmake nodejs npm rust python python-pip luarocks
```

### Install on openSUSE Tumbleweed

```
sudo zypper refresh && sudo zypper dup
sudo zypper install git curl wget zsh tar gzip \
    neovim ripgrep fd bat eza zoxide fzf starship lazygit \
    tmux btop jq trash-cli \
    gcc clang make cmake nodejs npm rust python311 python311-pip luarocks
```

### LaTeX (Optional)

```
pacman -S texlive-most zathura zathura-pdf-mupdf
```


## Install on Windows

### WinGet

```
winget install Microsoft.PowerShell OpenJS.NodeJS Rustlang.Rustup BurntSushi.ripgrep.MSVC junegunn.fzf Jesse.Lazygit Git.Git Kitware.CMake
```

### Scoop

```
scoop bucket add scoop-it https://github.com/younger-1/scoop-it
scoop install im-select
```

### Powershell

```Powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Install-Module -Name BurntToast -Scope CurrentUser
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

```Powershell
Install-Module Terminal-Icons, ZLocation, posh-git, PSFzf -Scope CurrentUser
```
