# dotfiles

My set of configs for a set of programs.

Universal:
- Neovim + Neovide
- Starship theme
- Powershell
- LazyGit

Linux:
- Hyprland and other hypr ecosystem programs
- Waybar
- Kitty
- Zsh
- Walker + Elephant
- Fuzzel
- GIMP + PhotoGIMP
- My bash scripts
...

Windows:
- Komorebi
- YASB
- whkdrc
- Windows Terminal
...


## Notes on installation

### General

Run `:checkhealth` in Neovim to troubleshoot possible issues.

### Linux

You can use `stow` for symlinking directories in `linux`. For `linux-root` it's advised to copy-paste configs.
Example: `cd ~/.dotfiles/linux && stow -t ~ hypr`.

### Windows:

It's advised to create symlinks in `%LOCALAPPDATA%` directory to save space on disk. You can use `create-symlink.ps1` file for that, just launch it from terminal by typing `.\cread-symlink.ps1` in PowerShell terminal.

## To-Do

- [x] Fix Neovide's config.toml not working
- [ ] Add and/or configure:
    - [x] Zsh
    - [x] PowerShell
    - [ ] Kitty

    - [ ] HyprLand
    - [x] Waybar
    - [x] Walker
    - [x] Elephant
    - [ ] HyprTile
    - [ ] HyprLS
    - [x] ReGreet
    - [ ] Plugins

    - [x] DeadBeeF
    - [x] OpenTabletDriver
    - [ ] clipse
    - [ ] udiskie
    - [ ] scrcpy/Escrcpy
    - [ ] Matrix client
