-- This keybind will always work when editing other configs
hl.bind(
    "SUPER + SHIFT + R",
    hl.dsp.exec_cmd(
        "hyprctl reload"
        .. " && notify-send 'Hyprland' 'Config reloaded'"
        .. " --icon ~/.local/share/icons/hicolor/scalable/apps/hyprland-scalable.svg"
    )
)
