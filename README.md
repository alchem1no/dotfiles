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
- dunst (borrowed from folke)
- Kitty
- Zsh
- Walker + Elephant
- Fuzzel
- My bash scripts
- GIMP + PhotoGIMP
- DeaDBeeF
...

Linux (configs in system directories):
- greetd + ReGreet

Windows:
- Komorebi
- whkdrc
- YASB
- Windows Terminal
- Cursor

## Notes on installation

### General

Run `:checkhealth` in Neovim to troubleshoot possible issues.

### Linux

You can use `stow` for symlinking directories in `linux`. For `linux-root` it's advised to copy-paste configs.
Example: `cd ~/.dotfiles/linux && stow -t ~ hypr`.

### Windows:

It's advised to create symlinks in `%LOCALAPPDATA%` directory to save space on disk.
~~You can use `create-symlink.ps1` file for that, just launch it from terminal by typing `.\cread-symlink.ps1` in PowerShell terminal.~~
Not ready yet.

## To-Do

- [ ] Make Hyprland animations slower
- [x] Fix Neovide's config.toml not working
- [x] Configure Hyprcursor
- [ ] Fix Elephant clipboard provider
- [ ] Make Elephant providers paste text through ydotool:
    - [ ] clipboard
    - [ ] symbols
    - [ ] unicode
- [ ] Fix cursor theme not working in some applications
- [ ] Fix Thunar freezes
- [ ] Fix Log Out button in Waybar power menu not working properly
- [ ] Add and/or configure:
    - [x] Zsh
    - [x] PowerShell
    - [ ] Starship theme for bare TTY
    - [ ] Foot
    - [ ] Kitty

    - [ ] Hyprland
    - [ ] Hyprland plugins
    - [x] Waybar
    - [x] Walker
    - [x] Elephant
    - [ ] HyprTile
    - [ ] HyprLS
    - [x] ReGreet

    - [ ] Neovim
        - [ ] Read docs
        - [ ] Configure plugins
        - [ ] Deal with keymaps

    - [x] DeadBeeF
    - [x] OpenTabletDriver
    - [ ] wf-recorder
    - [ ] clipse
    - [ ] udiskie
    - [ ] scrcpy/Escrcpy
    - [ ] Matrix client
    - [ ] IRC app
