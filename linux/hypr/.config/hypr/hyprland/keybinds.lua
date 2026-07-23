local u = "uwsm app -- "

local apps       = require("config.apps")
local wrap       = require("lib.uwsm_wrapper")
local monitors   = require("lib.monitors")
local notify     = require("lib.notify")

local all      = monitors.get_all()
local mainMod  = "SUPER"

local binds = {

    -- Close Window
    {
        mainMod .. " + Q",
        hl.dsp.window.close()
    },

    -- Exit Hyprland
    {
        mainMod .. " + Escape",
        hl.dsp.exec_cmd("loginctl lock-session")
    },
    {
        mainMod .. " + SHIFT + Escape",
        hl.dsp.exec_cmd(wrap(apps.log_out))
    },

    -- Change temperature of hyprsunset
    --[[
    {
        mainMod .. " + SHIFT + Minus",
        hl.dsp.exec_cmd("$(hyprctl hyprsunset profile)")
    }
    ]]

    -- Function key binds

    -- System info
    {
        mainMod .. " + F1",
        hl.dsp.exec_cmd(wrap(apps.system_info))
    },

    -- Hide and reload Waybar respectively
    {
        mainMod .. " + F2",
        hl.dsp.exec_cmd(apps.bar_toggle_visibility_command)
    },
    {
        mainMod .. " + SHIFT + F2",
        notify.reload_config(
            apps.bar_reload_command,
            apps.bar
        )
    },

    -- Reload Walker and Elephant
    {
        mainMod .. " + CTRL + F2",
        notify.reload_config(
            apps.launcher_reload_command,
            apps.launcher
        )
    },
    {
        mainMod .. " + CTRL + SHIFT + F2",
        notify.reload_config(
            apps.launcher_backend_reload_command,
            apps.launcher_backend
        )
    },

    -- Reload other stuff
    {
        mainMod .. " + ALT + F2",
        notify.reload_config(
            "gtk-update-icon-cache -f ~/.local/share/icons/hicolor 2>/dev/null || true",
            "GTK icon cache"
        )
    },
    {
        mainMod .. " + F3",
        hl.dsp.exec_cmd(apps.wifi_menu)
    },
    {
        mainMod .. " + F4",
        hl.dsp.exec_cmd(apps.bt_menu)
    },
    {
        mainMod .. " + CTRL + F3",
        notify.reload_config(
            apps.network_manager_reload_command,
            apps.network_manager
        )
    },

    -- Toggle fullscreen mode
    {
        mainMod .. " + F11",
        function()
            -- Toggle fullscreen
            hl.dispatch(
                hl.dsp.window.fullscreen({
                    mode = "maximized",
                    action = "toggle"
                })
            )

            -- Send hide command to the bar
            hl.dispatch(
                hl.dsp.exec_cmd(apps.bar_toggle_visibility_command)
            )
        end
    },
    {
        mainMod .. " + SHIFT + F11",
        hl.dsp.window.fullscreen({
            mode = "maximized",
            action = "toggle"
        })
    },

    -- Turn off screen
    {
        mainMod .. " + F12",
        hl.dsp.exec_cmd(apps.screen_toggle)
    },

    -- Toggle on/off
    {
        mainMod .. " + End",
        notify.toggle(
            apps.blue_light_filter,
            "night-light"
        )
    },
    -- Special workspace (scratchpad)
    {
        mainMod .. " + S",
        hl.dsp.workspace.toggle_special("main")
    },
    {
        mainMod .. " + SHIFT + S",
        hl.dsp.window.move({ workspace = "special:main" })
    },

    -- Terminal scratchpad
    {
        mainMod .. " + grave",
        hl.dsp.workspace.toggle_special("terminal")
    },
    {
        mainMod .. " + SHIFT + grave",
        hl.dsp.window.move({ workspace = "special:terminal" })
    },

    -- Music scratchpad
    {
        mainMod .. " + M",
        hl.dsp.workspace.toggle_special("music")
    },
    {
        mainMod .. " + SHIFT + M",
        hl.dsp.window.move({ workspace = "special:music" })
    },

    -- AI client scratchpad
    {
        mainMod .. " + A",
        hl.dsp.workspace.toggle_special("ai")
    },
    {
        mainMod .. " + SHIFT + A",
        hl.dsp.window.move({ workspace = "special:ai" })
    },

    -- App shortcuts
    {
        {
            mainMod .. " + T",
            "CTRL + ALT + T"
        },
        hl.dsp.exec_cmd(wrap(apps.terminal))
    },
    {
        {
            mainMod .. " + CTRL + T",
            "CTRL + SHIFT + ALT + T"
        },
        hl.dsp.exec_cmd(wrap(apps.terminal_secondary_shell))
    },
    {
        mainMod .. " + SHIFT + T",
        hl.dsp.exec_cmd(wrap(apps.terminal2))
    },
    {
        mainMod .. " + CTRL + SHIFT + T",
        hl.dsp.exec_cmd(wrap(apps.terminal2_secondary_shell))
    },
    {
        mainMod .. " + R",
        hl.dsp.exec_cmd(wrap(apps.runner))
    },
    {
        mainMod .. " + E",
        hl.dsp.exec_cmd(wrap(apps.file_manager_gui))
    },
    {
        mainMod .. " + SHIFT + E",
        hl.dsp.exec_cmd(wrap(apps.file_manager_cli))
    },
    {
        mainMod .. " + N",
        hl.dsp.exec_cmd(wrap(apps.editor))
    },
    {
        mainMod .. " + B",
        hl.dsp.exec_cmd(wrap(apps.browser))
    },
    {
        mainMod .. " + SHIFT + B",
        hl.dsp.exec_cmd(wrap(apps.browser2))
    },
    {
        mainMod .. " + Tab",
        hl.dsp.exec_cmd(wrap(apps.todo_list))
    },
    {
        mainMod .. " + SHIFT + C",
        hl.dsp.exec_cmd(wrap(apps.color_picker))
    },

    -- Menu
    {
        {
            mainMod .. " + D",
            "ALT + SPACE"
        },
        hl.dsp.exec_cmd(apps.launcher_open)
    },
    {
        {
            mainMod .. " + SHIFT + D",
            "ALT + SHIFT + SPACE"
        },
        hl.dsp.exec_cmd(wrap(apps.launcher_apps))
    },
    {
        {
            mainMod .. " + CTRL + SHIFT + D",
            "CTRL + ALT + SHIFT + SPACE"
        },
        hl.dsp.exec_cmd(wrap(apps.launcher2))
    },

    -- Print keybind is implemented via monitor count check at the bottom
    {
        "ALT + Print",
        hl.dsp.exec_cmd(wrap(apps.screen_capture_tool_window))
    },
    {
        "CTRL + ALT + Print",
        hl.dsp.exec_cmd(wrap(apps.screen_capture_tool_window_clipboard_only))
    },
    {
        "SHIFT + Print",
        hl.dsp.exec_cmd(wrap(apps.screen_capture_tool_region))
    },
    {
        "CTRL + SHIFT + Print",
        hl.dsp.exec_cmd(wrap(apps.screen_capture_tool_region_clipboard_only))
    },

    -- Screen recording
    {
        mainMod .. " + F9",
        hl.dsp.exec_cmd(wrap(apps.screen_recorder_whole_screen))
    },
    {
        mainMod .. " + SHIFT + F9",
        hl.dsp.exec_cmd(wrap(apps.screen_recorder_region))
    },

    -- Window management
    {
        mainMod .. " + F",
        hl.dsp.window.float({ action = "toggle" })
    },
    {
        mainMod .. " + P",
        hl.dsp.window.pseudo()
    },
    {
        mainMod .. " + backslash",
        hl.dsp.layout("togglesplit") -- dwindle only
    },

    -- Clipboard
    {
        mainMod .. " + V",
        hl.dsp.exec_cmd(wrap(apps.clipboard_panel))
    },
    {
        mainMod .. " + SHIFT + V",
        hl.dsp.exec_cmd(apps.clipboard_panel2)
    },
    {
        mainMod .. " + Delete",
        hl.dsp.exec_cmd(apps.clear_clipboard_history)
    },

    -- Emoji
    {
        mainMod .. " + period",
        hl.dsp.exec_cmd(wrap(apps.emoji_panel))
    },
    {
        mainMod .. " + SHIFT + period",
        hl.dsp.exec_cmd(apps.emoji_panel2)
    },

    -- Cool visuals
    {
        mainMod .. " + CTRL + SHIFT + M",
        hl.dsp.exec_cmd(wrap(apps.matrix))
    },

    -- Move focus
    {
        {
            mainMod .. " + H",
            mainMod .. " + left",
        },
        hl.dsp.focus({ direction = "l" })
    },
    {
        {
            mainMod .. " + J",
            mainMod .. " + down",
        },
        hl.dsp.focus({ direction = "d" })
    },
    {
        {
            mainMod .. " + K",
            mainMod .. " + up",
        },
        hl.dsp.focus({ direction = "u" })
    },
    {
        {
            mainMod .. " + L",
            mainMod .. " + right",
        },
        hl.dsp.focus({ direction = "r" })
    },

    -- Swap tiles
    {
        {
            mainMod .. " + SHIFT + left",
            mainMod .. " + SHIFT + H"
        },
        hl.dsp.window.swap({ direction = "l" })
    },
    {
        {
            mainMod .. " + SHIFT + right",
            mainMod .. " + SHIFT + L"
        },
        hl.dsp.window.swap({ direction = "r" })
    },
    {
        {
            mainMod .. " + SHIFT + up",
            mainMod .. " + SHIFT + K"
        },
        hl.dsp.window.swap({ direction = "u" })
    },
    {
        {
            mainMod .. " + SHIFT + down",
            mainMod .. " + SHIFT + J"
        },
        hl.dsp.window.swap({ direction = "d" })
    },
    -- Sequential workspace switching
    {
        "CTRL + " .. mainMod .. " + Left",
        hl.dsp.focus({ workspace = "e-1" })
    },
    {
        "CTRL + " .. mainMod .. " + Right",
        hl.dsp.focus({ workspace = "e+1" })
    },

    -- Scroll through workspaces
    {
        mainMod .. " + mouse_down",
        hl.dsp.focus({ workspace = "e+1" })
    },
    {
        mainMod .. " + mouse_up",
        hl.dsp.focus({ workspace = "e-1" })
    },

    -- Move/resize windows with mouse
    {
        mainMod .. " + mouse:272",
        hl.dsp.window.drag(),   { mouse = true }
    },
    {
        mainMod .. " + mouse:273",
        hl.dsp.window.resize(), { mouse = true }
    },

    -- Keybinds for dedicated keys

    -- Volume & brightness
    {
        "XF86AudioRaiseVolume",
        hl.dsp.exec_cmd(
            "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ),
        {
            locked = true,
            repeating = true,
        }
    },
    {
        "XF86AudioLowerVolume",
        hl.dsp.exec_cmd(
            "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ),
        {
            locked = true,
            repeating = true,
        }
    },
    {
        "XF86AudioMute",
        hl.dsp.exec_cmd(
            "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ),
        {
            locked = true,
            repeating = true,
        }
    },
    {
        "XF86AudioMicMute",
        hl.dsp.exec_cmd(
            "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ),
        {
            locked = true,
            repeating = true,
        }
    },
    {
        "XF86MonBrightnessUp",
        hl.dsp.exec_cmd(
            "brillo -q -e -u 120000 -A 5"
        ),
        {
            locked = true,
            repeating = true,
        }
    },
    {
        "XF86MonBrightnessDown",
        hl.dsp.exec_cmd(
            "brillo -q -e -u 120000 -U 5"
        ),
        {
            locked = true,
            repeating = true,
        }
    },

    -- Media keys (requires playerctl)
    {
        "XF86AudioNext",
        hl.dsp.exec_cmd("playerctl next"),
        { locked = true }
    },
    {
        "XF86AudioPause",
        hl.dsp.exec_cmd("playerctl play-pause"),
        { locked = true }
    },
    {
        "XF86AudioPlay",
        hl.dsp.exec_cmd("playerctl play-pause"),
        { locked = true }
    },
    {
        "XF86AudioPrev",
        hl.dsp.exec_cmd("playerctl previous"),
        { locked = true }
    },
}

for _, b in ipairs(binds) do
    local keys = type(b[1]) == "table" and b[1] or { b[1] }
    for _, k in ipairs(keys) do
        hl.bind(k, b[2], b[3])
    end
end

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(
        mainMod .. " + " .. key,
        hl.dsp.focus({ workspace = i })
    )
    hl.bind(
        mainMod .. " + SHIFT + " .. key,
        hl.dsp.window.move({ workspace = i })
    )
end

-- Dynamic keybind for fullscreen screenshot
if #all == 1 then
    hl.bind(
        "Print",
        hl.dsp.exec_cmd(
            apps.screen_capture_tool_screen
            .. " --mode " .. all[1]
        )
    )
    hl.bind(
        "CTRL + Print",
        hl.dsp.exec_cmd(
            apps.screen_capture_tool_screen_clipboard_only
            .. " --mode " .. all[1]
        )
    )
else
    hl.bind(
        "Print",
        hl.dsp.exec_cmd(
            apps.screen_capture_tool_screen
        )
    )
    hl.bind(
        "CTRL + Print",
        hl.dsp.exec_cmd(
            apps.screen_capture_tool_screen_clipboard_only
        )
    )
end
