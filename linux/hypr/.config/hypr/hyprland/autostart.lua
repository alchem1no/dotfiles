local apps = require("config.apps")
local exec = hl.exec_cmd

-- Special workspace rules

-- Terminal SW
hl.workspace_rule({
    workspace = "special:terminal",
    on_created_empty = apps.terminal
})

-- Music SW
-- hl.workspace_rule({
--     workspace = "special:music",
--     on_created_empty = apps.terminal
-- })

-- AI SW
-- hl.workspace_rule({
--     workspace = "special:ai",
--     on_created_empty = apps.ai_client
-- })

-- Autostart apps and stuff
hl.on("hyprland.start", function ()
    exec("ydotoold")
    exec("dbus-update-activation-environment --systemd --all")
    exec("systemctl --user import-environment WAYLAND_DISPLAY HYPRLAND_INSTANCE_SIGNATURE XDG_CURRENT_DESKTOP")
    exec(apps.polkit_agent)
    exec(apps.idle_daemon)
    exec("wl-clip-persist --clipboard regular")
    exec("wl-paste --watch cliphist store")
    exec("paccache -r")

    -- Set up elephant and walker
    exec("elephant service enable")
    exec("systemctl --user start elephant.service")
    exec("walker --gapplication-service")

    -- Systemd services
    exec("systemctl --user start opentabletdriver.service")

    exec(apps.wallpaper_manager)
    exec(apps.notification_manager)
    exec(apps.bar)
    exec(apps.blue_light_filter)
    exec(apps.phone_connect)
    -- exec(apps.vpn_client)
    exec(apps.messenger_tray)
end)
