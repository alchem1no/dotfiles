hl.on("hyprland.start", function()
    hl.exec_cmd("regreet; hyprctl dispatch 'hl.dsp.exit()'")
end)

hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("HYPRCURSOR_SIZE", "20")
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("XCURSOR_SIZE", "20")

hl.config({
    -- animations = {
    --     enabled = false,
    -- },
    input = {
        numlock_by_default = true,
        sensitivity = -0.8,
        natural_scroll = false,

        touchpad = {
            disable_while_typing = true,
            natural_scroll = true,
            tap_to_click = true,
        },

        touchdevice = {
            transform = -1,
            output = "Auto",
            enabled = true,
        },

        tablet = {
            transform = -1,
            output = "",
            region_position = {0, 0},
            absolute_region_position = false,
            region_size = {0, 0},
            relative_input = false,
            left_handed = false,
            active_area_size = {0, 0},
            active_area_position = {0, 0},
        },
    },
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        disable_hyprland_guiutils_check = true,
    },
})

hl.device({
    name          = "alpsps/2-alps-glidepoint",
    sensitivity   = 0.2,
    scroll_factor = 0.5,
})
