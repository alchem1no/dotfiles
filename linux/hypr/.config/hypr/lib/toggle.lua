-- toggle.lua — screen power toggling.
--
-- screen() -> function()  (bind directly; state checked at press time)
--     Blanks the screen if it's on, wakes it if it's off. Blanking is delayed
--     by 500 ms so the compositor's fade-out animation can finish first; waking
--     is immediate, because latency on wake is just latency.
--
--     NOT USED IN THIS CONFIG — the screen toggle here is bound to the
--     `screen-toggle` shell script instead (see config/apps.lua). This is the
--     pure-Lua equivalent, kept for anyone who'd rather not depend on an
--     external script on PATH. It requires only wlopm and lib/monitors.
--     Bind it with:  { mainMod .. " + F12", toggle.screen }

local monitors = require("lib.monitors")

local M = {}

function M.screen()
    if monitors.is_screen_on() then
        hl.timer(function()
            hl.dispatch(hl.dsp.exec_cmd(
                "wlopm --off '*'"
            ))
        end, {timeout = 500, type = "oneshot"})
    else
        hl.dispatch(hl.dsp.exec_cmd(
            "wlopm --on '*'"
        ))
    end
end

return M
