local M = {}

M.system_info           = "hyprsysteminfo"
M.idle_daemon           = "hypridle"
M.notification_manager  = "dunst"
M.blue_light_filter     = "hyprsunset"
M.wallpaper_manager     = "hyprpaper"
M.bar                   = "waybar"

M.terminal  = "footclient"
M.terminal2 = "kitty"

M.terminal_secondary_shell  = M.terminal  .. " -e pwsh -NoLogo"
M.terminal2_secondary_shell = M.terminal2 .. " -e pwsh -NoLogo"

M.file_manager_gui  = "thunar"
M.file_manager_cli  = M.terminal .. " -e yazi"

M.launcher         = "walker"
M.launcher_service = "walker --gapplication-service"
M.launcher_backend = "elephant"
M.launcher_open    = "nc -U /run/user/$(id -u)/walker/walker.sock"
M.launcher_apps    = "walker -m desktopapplications"
M.launcher2        = "fuzzel"
M.runner           = "walker -m runner"
M.emoji_panel      = "walker -m symbols"
M.emoji_panel2     = "emoji-insert"
M.clipboard_panel  = "walker -m clipboard"
M.clipboard_panel2 = "cliphist-insert"

M.editor        = "neovide"
M.browser       = "brave-origin-beta"
M.browser2      = "firefox"
M.todo_list     = "walker -s todo"
-- M.ai_client     = "gtk-launch chrome-fmpnliohjhemenmnlpbfagaolkdacoja-Default"
M.phone_connect  = "kdeconnectd"
M.color_picker   = "hyprpicker --autocopy --quiet"
M.matrix         = M.terminal .. " unimatrix --asynchronous --color=cyan --flashers"
M.vpn_client     = "happ"
M.messenger      = "Telegram"
M.messenger_tray = M.messenger .. "-startintray"

M.screen_capture_tool_screen                = "hyprshot --mode output --output-folder ~/Pictures/Screenshots"
M.screen_capture_tool_screen_clipboard_only = "hyprshot --mode output --clipboard-only"
M.screen_capture_tool_window                = "hyprshot --mode window --output-folder ~/Pictures/Screenshots"
M.screen_capture_tool_window_clipboard_only = "hyprshot --mode window --clipboard-only"
M.screen_capture_tool_region                = "hyprshot --mode region --output-folder ~/Pictures/Screenshots"
M.screen_capture_tool_region_clipboard_only = "hyprshot --mode region --clipboard-only"

M.screen_recorder_whole_screen = "wf-recorder-toggle"
M.screen_recorder_region       = "wf-recorder-region-toggle"

M.clear_clipboard_history = "cliphist wipe; rm -f ~/.cache/cliphist/db; notify-send -i /usr/share/icons/Papirus/16x16/actions/edit-clear-history.svg 'Clipboard' 'History cleared'"

M.wifi_menu_tui = "networkmanager_dmenu"
M.bt_menu_tui   = "fuzzel-bluetooth"

M.network_manager = "NetworkManager"

-- Commands
M.bar_toggle_visibility_command = "pkill -SIGUSR1 " .. M.bar
M.bar_reload_command            = "pkill -SIGUSR2 " .. M.bar
M.screen_toggle                 = "screen-toggle"

M.launcher_reload_command = "pkill walker; (walker --gapplication-service &)"
M.launcher_backend_reload_command = "systemctl --user restart elephant.service"

M.network_manager_reload_command = "systemctl restart " .. M.network_manager

return M
