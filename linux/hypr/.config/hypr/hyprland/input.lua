hl.config({
    input = {
        kb_layout  = "us,ru",
        kb_variant = "",
        kb_model   = "",
        kb_options = "grp:win_space_toggle,lv3:ralt_switch,misc:typo",
        kb_rules   = "",
        kb_file    = "",

        numlock_by_default = true,

        -- resolve_bind_by_sym = false,
        repeat_rate = 25,
        repeat_delay = 600,

        follow_mouse = 1,
        follow_mouse_shrink = 0,
        follow_mouse_threshold = 0.0,

        sensitivity = -0.8, -- -1.0 - 1.0, 0 means no modification.
        accel_profile = "adaptive",
        force_no_accel = false,
        rotation = 0,

        left_handed = false,
        scroll_points = "",
        scroll_method = "2fg",
        scroll_button = 0,
        scroll_button_lock = false,

        scroll_factor = 1.0,
        natural_scroll = false,

        focus_on_close = 2,
        mouse_refocus = true,

        float_switch_override_focus = 1,
        special_fallthrough = false,

        off_window_axis_events = 1,

        emulate_discrete_scroll = 1,

        touchpad = {
            disable_while_typing = true,
            natural_scroll = true,
            scroll_factor = 1.0,
            middle_button_emulation = true,
            tap_button_map = "",
            clickfinger_behavior = false,
            tap_to_click = true,
            drag_lock = 0,
            tap_and_drag = true,
            flip_x = false,
            flip_y = false,
            drag_3fg = 0,
        },

        touchdevice = {
            transform = -1,
            output = "Auto",
            enabled = true,
        },

        -- virtual_keyboard = {
        --     share_states = 2,
        --     release_pressed_on_close = false,
        -- },

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

        -- tablettool = {
        --     eraser_button_mode = 0,
        --     eraser_button_mode_override = 0,
        --     pressure_range_min = -1.0,
        --     pressure_range_max = -1.0,
        -- },
    },

    -- gestures = {
    --     workspace_swipe_distance = 300,
    --     workspace_swipe_touch = false,
    --     workspace_swipe_invert = true,
    --     workspace_swipe_touch_invert = false,
    --     workspace_swipe_min_speed_to_force = 30,
    --     workspace_swipe_cancel_ratio = 0.5,
    --     workspace_swipte_create_new = false,
    --     workspace_swipe_direction_lock = true,
    --     workspace_swipe_direction_lock_treshold = 10,
    --     workspace_swipe_forever = false,
    --     workspace_swipe_use_r = false,
    --     close_max_timeout = 1000,
    -- },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

hl.device({
    name          = "alpsps/2-alps-glidepoint",
    sensitivity   = 0.2,
    scroll_factor = 0.5,
})
