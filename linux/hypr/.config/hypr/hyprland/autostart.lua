local apps = require("config.apps")

-- Terminal special workspace
hl.workspace_rule({
    workspace = "special:terminal",
    on_created_empty = apps.terminal
})

-- Autostart apps and stuff
hl.on("hyprland.start", function()
    -- hl.exec_cmd("XCURSOR_PATH='$HOME/.local/share/icons' happ")
end)
