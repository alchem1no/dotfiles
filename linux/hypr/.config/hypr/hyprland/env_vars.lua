-- Workaround if cursor variables doesn't work for you
-- hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 24")

local home = os.getenv("HOME")

hl.env("PATH", os.getenv("PATH")
.. ":" .. home .. "/.local/bin"
.. ":" .. home .. "/.local/share/cargo/bin"
.. ":" .. home .. "/.local/share/npm/bin"
)

-- hl.env("WLR_NO_HARDWARE_CURSORS", "1")
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("HYPRCURSOR_SIZE", "128")
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("XCURSOR_SIZE", "128")

hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
