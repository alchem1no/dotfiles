local alpha = "ee"
local inactive_border = "#595959aa"
local nogroup_border = "#595959aa"
local tokyonight = {
    purple  = "#bb9af7" .. alpha,
    magenta = "#ff007c" .. alpha,
    blue    = "#7aa2f7" .. alpha,
    cyan    = "#7dcfff" .. alpha,
    green   = "#9ece6a" .. alpha,
    red     = "#f7768e" .. alpha,
}
local tokyonight_1 = {
    "#bb9af7" .. alpha,
    "#ff007c" .. alpha,
}
local tokyonight_2 = {
    "#7aa2f7" .. alpha,
    "#7dcfff" .. alpha,
}
local rainbow = {
    "#ff0000" .. alpha,
    "#ff7f00" .. alpha,
    "#ffff00" .. alpha,
    "#00ff00" .. alpha,
    "#0000ff" .. alpha,
    "#4b00ff" .. alpha,
    "#8b00ff" .. alpha,
}
local lgbt_plus = {
    "#e40303" .. alpha,
    "#ff8c00" .. alpha,
    "#ffed00" .. alpha,
    "#008026" .. alpha,
    "#004dff" .. alpha,
    "#750787" .. alpha,
}
local lesbian = {
    "#d52d00" .. alpha,
    "#ff9a56" .. alpha,
    "#ffffff" .. alpha,
    "#d162a4" .. alpha,
    "#a50062" .. alpha,
}
local gay = {
    "#078d70" .. alpha,
    "#26cea8" .. alpha,
    "#ffffff" .. alpha,
    "#7bade2" .. alpha,
    "#3d1a8e" .. alpha,
}
local bisexual = {
    "#d60270" .. alpha,
    "#9b4f96" .. alpha,
    "#0038a8" .. alpha,
}
local trans = {
    "#55cdfc" .. alpha,
    "#f7a8b8" .. alpha,
    "#ffffff" .. alpha,
    "#f7a8b8" .. alpha,
    "#55cdfc" .. alpha,
}
local nonbinary = {
    "#fcf434" .. alpha,
    "#ffffff" .. alpha,
    "#9c59d1" .. alpha,
    "#2c2c2c" .. alpha,
}
local pansexual = {
    "#ff218c" .. alpha,
    "#ffd800" .. alpha,
    "#21b1ff" .. alpha,
}
local genderqueer = {
    "#b57edc" .. alpha,
    "#ffffff" .. alpha,
    "#4a8123" .. alpha,
}
local genderfluid = {
    "#ff76a4" .. alpha,
    "#ffffff" .. alpha,
    "#c011d7" .. alpha,
    "#2c2c2c" .. alpha,
    "#2c4fa5" .. alpha,
}
local asexual = {
    "#000000" .. alpha,
    "#a4a4a4" .. alpha,
    "#ffffff" .. alpha,
    "#810081" .. alpha,
}
local aromantic = {
    "#3da542" .. alpha,
    "#a8d379" .. alpha,
    "#ffffff" .. alpha,
    "#a9a9a9" .. alpha,
    "#000000" .. alpha,
}
local flag_ru = {
    "#ffffff" .. alpha,
    "#0039a6" .. alpha,
    "#d4232e" .. alpha,
}

hl.config({
    general = {
        border_size = 3,
        gaps_in     = 6,
        gaps_out    = 8,

        float_gaps      = 0,
        gaps_workspaces = 0,

        col = {
            inactive_border = inactive_border,
            active_border = {
                colors  = bisexual,
                angle   = 30,
            },
            nogroup_border          = tokyonight.cyan,
            nogroup_border_active   = tokyonight.green,
        },

        layout = "dwindle",

        no_focus_fallback       = false,
        resize_on_border        = true,
        extend_border_grab_area = 15,
        hover_icon_on_border    = true,
        allow_tearing           = false,
        resize_corner           = 0,
        modal_parent_blocking   = true,

        locale = "",

        snap = {
            enabled        = false,
            window_gap     = 10,
            monitor_gap    = 10,
            border_overlap = false,
            respect_gaps   = false,
        },

    },

    decoration = {
        rounding       = 20,
        rounding_power = 4.0,

        -- Change transparency of focused and unfocused windows
        active_opacity     = 1.0,
        inactive_opacity   = 0.9,
        fullscreen_opacity = 1.0,

        dim_modal    = true,
        dim_inactive = false,
        dim_strength = 0.5,
        dim_special  = 0.2,
        dim_around   = 0.4,

        -- Check what this is
        screen_shader = "",

        border_part_of_window = true,

        blur = {
            enabled           = true,
            size              = 3,
            passes            = 1,
            vibrancy          = 0.1696,
            vibrancy_darkness = 0.1696,
            noise             = 0.0117,
            contrast          = 0.8916,
            brightness        = 0.8172,
            special           = false,

            popups             = true,
            popups_ignorealpha = 0.2,

            input_methods             = false,
            input_methods_ignorealpha = 0.2,

            ignore_opacity    = true,
            new_optimizations = true,
            xray              = true,
        },

        shadow = {
            enabled      = true,
            range        = 6,
            render_power = 3,
            sharp        = false,

            color          = 0xee1a1a1a,
            -- color_inactive = 0xee1a1a1a,

            offset = {0, 0},
            scale  = 1.0
        },

        glow = {
            enabled      = false,
            range        = 10,
            render_power = 2,
            color        = 0xee1a1a1a,
            -- color_inactive = 0xee1a1a1a,
        },

        -- motion_blur = {
        --     enabled = false,
        --     samples = 3,
        -- },
    },

    animations = {
        enabled = true,
        workspace_wraparound = false,
    },

    dwindle = {
        preserve_split = true,
    },

    scrolling = {
        fullscreen_on_one_column = true,
    },

    master = {
        new_status = "master",
    },

    group = {
        auto_group = true,
        insert_after_current = true,
        focus_removed_window = true,
        drag_into_group = 1,
        merge_groups_on_drag = true,
        merge_groups_on_groupbar = true,
        merge_floated_into_tiled_on_groupbar = false,
        group_on_movetoworkspace = false,

        col = {
            border_active = 0x66ffff00,
            border_inactive = 0x66777700,
            border_locked_active = 0x66ff5500,
            border_locked_inactive = 0x66775500,
        },

        groupbar = {
            enabled = true,
            font_family = "",
            font_size = 8,
            font_weight_active = "normal",
            font_weight_inactive = "normal",
            gradients = false,
            height = 14,
            indicator_gap = 0,
            indicator_height = 3,
            stacked = false,
            priority = 3,
            render_titles = true,
            text_offset = 0,
            text_padding = 0,
            scrolling = true,
            rounding = 1,
            rounding_power = 2.0,
            gradient_rounding = 2,
            gradient_rounding_power = 2.0,
            round_only_edges = true,
            gradient_round_only_edges = true,
            text_color = 0xffffffff,
            text_color_inactive = nil,
            text_color_locked_active = nil,
            text_color_locked_inactive = nil,

            col = {
                active = 0x66ffff00,
                inactive = 0x66777700,
                locked_active = 0x66ff5500,
                locked_inactive = 0x66775500,

                -- gaps_in = 2,
                -- gaps_out = 2,
                -- keep_upper_gap = true,

                -- middle_click_close = true,

                -- blur = false,
            },
        },
    },

    misc = {
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
        force_default_wallpaper = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_splash_rendering = false,
        disable_scale_notification = false,
        col = { splash = 0xffffffff },
        font_family = "CaskaydiaCove Nerd Font",
        vrr = 0,

        mouse_move_enables_dpms = false,
        key_press_enables_dpms = false,
        name_vk_after_proc = true,
        always_follow_on_dnd = true,
        layers_hog_keyboard_focus = true,
        animate_manual_resizes = false,
        animate_mouse_windowdragging = false,

        -- Turn on when done with configs
        disable_autoreload = true,

        enable_swallow = false,
        swallow_regex = "",
        swallow_exception_regex = "",
        focus_on_activate = false,
        mouse_move_focuses_monitor = true,
        allow_session_lock_restore = false,
        session_lock_xray = false,
        background_color = 0x111111,
        close_special_on_empty = true,
        on_focus_under_fullscreen = 2,
        exit_window_retains_fullscreen = false,
        initial_workspace_tracking = 1,
        middle_click_paste = true,
        render_unfocused_fps = 15,

        disable_xdg_env_checks         = false,
        -- disable_hyprland_qtutils_check = false,

        lockdead_screen_delay = 1000,
        enable_anr_dialog = true,
        anr_missed_pings = 5,
        size_limits_tiled = false,
        disable_watchdog_warning = false,
    },

    layout = {
        single_window_aspect_ratio = {0, 0},
        single_window_aspect_ratio_tolerance = 0.1,
    },

    binds = {
        pass_mouse_when_bound = false,
        scroll_event_delay = 300,
        workspace_back_and_forth = false,
        hide_special_on_workspace_change = false,
        allow_workspace_cycles = false,
        workspace_center_on = 0,
        focus_preferred_method = 0,
        ignore_group_lock = false,
        movefocus_cycles_fullscreen = false,
        movefocus_cycles_groupfirst = false,
        window_direction_monitor_fallback = true,
        disable_keybind_grabbing = false,
        allow_pin_fullscreen = false,
        drag_threshold = 0,
    },

    xwayland = {
        enabled = true,
        use_nearest_neighbor = true,
        force_zero_scaling = false,
        create_abstract_socket = false,
    },

    opengl = {
        nvidia_anti_flicker = true,
    },

    render = {
        direct_scanout = 2,
        expand_undersized_textures = true,
        xp_mode = false,
        ctm_animation = 2,
        cm_enabled = true,
        send_content_type = true,
        cm_auto_hdr = 0,
        new_render_scheduling = false,
        non_shader_cm = 2,
        non_shader_cm_interop = 2,
        cm_sdr_eotf = "default",
        use_fp16 = 2,
        keep_unmodified_copy = 2,
        use_shader_blur_blend = false,
    },

    cursor = {
        invisible = false,
        sync_gsettings_theme = true,
        no_hardware_cursors = 2,
        no_break_fs_vrr = 2,
        min_refresh_rate = 24,
        hotspot_padding = 1,
        inactive_timeout = 3, -- Important
        no_warps = false,
        persistent_warps = false,
        warp_on_change_workspace = 0,
        warp_on_toggle_special = 0,
        default_monitor = "",
        zoom_factor = 1.0,
        zoom_rigid = false,
        zoom_detached_camera = true,
        enable_hyprcursor = true,
        hide_on_key_press = false,
        hide_on_touch = true,
        hide_on_tablet = true,
        use_cpu_buffer = 2,
        warp_back_after_non_mouse_input = false,
        zoom_disable_aa = false,
    },

    ecosystem = {
        no_update_news = false,
        no_donation_nag = false,
        enforce_permissions = false, -- Important
    },

    quirks = {
        prefer_hdr = 0,
    }
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint", {
    type = "bezier",
    points = {
        {0.23, 1.00},
        {0.32, 1.00}
    }
})
hl.curve("easeInOutCubic", {
    type = "bezier",
    points = {
        {0.65, 0.05},
        {0.36, 1.00}
    }
})

hl.curve("linear", {
    type = "bezier",
    points = {
        {0, 0},
        {1, 1}
    }
})

hl.curve("almostLinear", {
    type = "bezier",
    points = {
        {0.50, 0.50},
        {0.75, 1.00}
    }
})

hl.curve("quick", {
    type = "bezier",
    points = {
        {0.15, 0.00},
        {0.10, 1.00}
    }
})

hl.curve("smooth", {
    type = "bezier",
    points = {
        {0.16, 1.00},
        {0.30, 1.00}
    }
})


-- Default springs
hl.curve("easy", {
    type = "spring",
    mass = 1,
    stiffness = 71.2633,
    dampening = 15.8273644
})

hl.animation({
    leaf = "global",
    enabled = true,
    speed = 10,
    bezier = "default"
})

hl.animation({
    leaf = "border",
    enabled = true,
    speed = 5.39,
    bezier = "easeOutQuint"
})

hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 4.79,
    spring = "easy"
})

hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 4.1,
    spring = "easy",
    style = "popin 87%"
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 1.49,
    bezier = "linear",
    style = "popin 87%"
})

hl.animation({
    leaf = "fadeIn",
    enabled = true,
    speed = 1.73,
    bezier = "almostLinear"
})

hl.animation({
    leaf = "fadeOut",
    enabled = true,
    speed = 1.46,
    bezier = "almostLinear"
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 3.03,
    bezier = "quick"
})

hl.animation({
    leaf = "layers",
    enabled = true,
    speed = 3.81,
    bezier = "easeOutQuint"
})

hl.animation({
    leaf = "layersIn",
    enabled = true,
    speed = 4,
    bezier = "easeOutQuint",
    style = "fade"
})

hl.animation({
    leaf = "layersOut",
    enabled = true,
    speed = 1.5,
    bezier = "linear",
    style = "fade"
})

hl.animation({
    leaf = "fadeLayersIn",
    enabled = true,
    speed = 1.79,
    bezier = "almostLinear"
})

hl.animation({
    leaf = "fadeLayersOut",
    enabled = true,
    speed = 1.39,
    bezier = "almostLinear"
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 5,
    bezier = "smooth",
    style = "slidevert"
})

hl.animation({
    leaf = "workspacesIn",
    enabled = true,
    speed = 5,
    bezier = "smooth",
    style = "slide"
})

hl.animation({
    leaf = "workspacesOut",
    enabled = true,
    speed = 5,
    bezier = "smooth",
    style = "slide"
})

hl.animation({
    leaf = "zoomFactor",
    enabled = true,
    speed = 7,
    bezier = "quick"
})


-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
