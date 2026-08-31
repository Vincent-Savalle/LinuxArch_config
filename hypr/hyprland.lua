-- Hyprland Lua configuration
-- https://wiki.hypr.land/Configuring/Start/


--------------------------------------------------
-- NVIDIA
--------------------------------------------------

hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")


--------------------------------------------------
-- MONITOR
--------------------------------------------------

hl.monitor({
    output = "",
    mode = "2560x1440@160",
    position = "auto",
    scale = "auto",
})


--------------------------------------------------
-- PROGRAMS
--------------------------------------------------

local terminal = "kitty"
local fileManager = "dolphin"
local menu = "wofi --show drun --columns 2"
local navigateur = "firefox"


--------------------------------------------------
-- AUTOSTART
--------------------------------------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar & hyprpaper")
    hl.exec_cmd("sleep 1 && hyprpaper -c /home/diziouf/.config/hypr/hyprpaper.conf")
end)


--------------------------------------------------
-- ENVIRONMENT
--------------------------------------------------

hl.env("XCURSOR_SIZE", "10")
hl.env("HYPRCURSOR_SIZE", "10")


--------------------------------------------------
-- LOOK AND FEEL
--------------------------------------------------

hl.config({
    general = {
        gaps_in = 2,
        gaps_out = 4,

        border_size = 2,

        col = {
            active_border = {
                colors = {
                    "rgba(ffffffee)",
                    "rgba(00000000)",
                    "rgba(ffffffee)"
                },
                angle = 90,
            },

            inactive_border = {
                colors = {
                    "rgba(33333355)",
                    "rgba(333333ee)",
                    "rgba(999999ee)"
                },
                angle = 90,
            },
        },

        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    },

    decoration = {
        rounding = 5,
        rounding_power = 2,

        active_opacity = 1.0,
        inactive_opacity = 0.85,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = 0xee1a1a1a,
        },

        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.2,
        },
    },

    animations = {
        enabled = true,
    },
})


--------------------------------------------------
-- ANIMATION CURVES
--------------------------------------------------

hl.curve("easeOutQuint", {
    type = "bezier",
    points = {
        {0.23, 1},
        {0.32, 1},
    },
})

hl.curve("easeInOutCubic", {
    type = "bezier",
    points = {
        {0.65, 0.05},
        {0.36, 1},
    },
})

hl.curve("linear", {
    type = "bezier",
    points = {
        {0, 0},
        {1, 1},
    },
})

hl.curve("almostLinear", {
    type = "bezier",
    points = {
        {0.5, 0.5},
        {0.75, 1},
    },
})

hl.curve("quick", {
    type = "bezier",
    points = {
        {0.15, 0},
        {0.1, 1},
    },
})


--------------------------------------------------
-- ANIMATIONS
--------------------------------------------------

hl.animation({
    leaf = "global",
    enabled = true,
    speed = 10,
    bezier = "default",
})

hl.animation({
    leaf = "border",
    enabled = true,
    speed = 5.39,
    bezier = "easeOutQuint",
})

hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 4.79,
    bezier = "easeOutQuint",
})

hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 4.1,
    bezier = "easeOutQuint",
    style = "popin 87%",
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 1.49,
    bezier = "linear",
    style = "popin 87%",
})

hl.animation({
    leaf = "fadeIn",
    enabled = true,
    speed = 1.73,
    bezier = "almostLinear",
})

hl.animation({
    leaf = "fadeOut",
    enabled = true,
    speed = 1.46,
    bezier = "almostLinear",
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 3.03,
    bezier = "quick",
})

hl.animation({
    leaf = "layers",
    enabled = true,
    speed = 3.81,
    bezier = "easeOutQuint",
})

hl.animation({
    leaf = "layersIn",
    enabled = true,
    speed = 4,
    bezier = "easeOutQuint",
    style = "fade",
})

hl.animation({
    leaf = "layersOut",
    enabled = true,
    speed = 1.5,
    bezier = "linear",
    style = "fade",
})

hl.animation({
    leaf = "fadeLayersIn",
    enabled = true,
    speed = 1.79,
    bezier = "almostLinear",
})

hl.animation({
    leaf = "fadeLayersOut",
    enabled = true,
    speed = 1.39,
    bezier = "almostLinear",
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 1.94,
    bezier = "almostLinear",
    style = "fade",
})

hl.animation({
    leaf = "workspacesIn",
    enabled = true,
    speed = 1.21,
    bezier = "almostLinear",
    style = "fade",
})

hl.animation({
    leaf = "workspacesOut",
    enabled = true,
    speed = 1.94,
    bezier = "almostLinear",
    style = "fade",
})


--------------------------------------------------
-- DWINDLE
--------------------------------------------------

hl.config({
    dwindle = {
        force_split = 1,
        preserve_split = true,
    },
})


--------------------------------------------------
-- MASTER
--------------------------------------------------

hl.config({
    master = {
        new_status = "master",
    },
})


--------------------------------------------------
-- MISC
--------------------------------------------------

hl.config({
    misc = {
        force_default_wallpaper = 1,
        disable_hyprland_logo = true,
    },
})


--------------------------------------------------
-- INPUT
--------------------------------------------------

hl.config({
    input = {
        kb_layout = "fr",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",

        follow_mouse = 1,
        sensitivity = -0.3,
    },
})


--------------------------------------------------
-- MOUSE
--------------------------------------------------

hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})


--------------------------------------------------
-- KEYBINDINGS
--------------------------------------------------

local mainMod = "SUPER"


-- Applications

hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(navigateur))


-- Windows

hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float({
    action = "toggle",
}))
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())


--------------------------------------------------
-- FOCUS
--------------------------------------------------

hl.bind(
    mainMod .. " + left",
    hl.dsp.focus({ direction = "left" })
)

hl.bind(
    mainMod .. " + right",
    hl.dsp.focus({ direction = "right" })
)

hl.bind(
    mainMod .. " + up",
    hl.dsp.focus({ direction = "up" })
)

hl.bind(
    mainMod .. " + down",
    hl.dsp.focus({ direction = "down" })
)


--------------------------------------------------
-- SCREENSHOTS
--------------------------------------------------

hl.bind(
    mainMod .. " + PRINT",
    hl.dsp.exec_cmd("hyprshot -m window")
)

hl.bind(
    "PRINT",
    hl.dsp.exec_cmd("hyprshot -m output")
)

hl.bind(
    mainMod .. "+ SHIFT + S",
    hl.dsp.exec_cmd("hyprshot -m region")
)


--------------------------------------------------
-- WORKSPACE SWITCHING
--------------------------------------------------

local workspaceKeys = {
    [1] = "ampersand",
    [2] = "eacute",
    [3] = "quotedbl",
    [4] = "apostrophe",
    [5] = "parenleft",
}

for workspace, key in pairs(workspaceKeys) do

    hl.bind(
        mainMod .. " + " .. key,
        hl.dsp.focus({
            workspace = workspace,
        })
    )

    hl.bind(
        mainMod .. "+ SHIFT + " .. workspace,
        hl.dsp.window.move({
            workspace = workspace,
        })
    )

end


--------------------------------------------------
-- SPECIAL WORKSPACE
--------------------------------------------------

hl.bind(
    mainMod .. " + S",
    hl.dsp.workspace.toggle_special("magic")
)

hl.bind(
    mainMod .. "+ SHIFT + S",
    hl.dsp.window.move({
        workspace = "special:magic",
    })
)


--------------------------------------------------
-- WORKSPACE SCROLL
--------------------------------------------------

hl.bind(
    mainMod .. " + mouse_down",
    hl.dsp.focus({
        workspace = "e+1",
    })
)

hl.bind(
    mainMod .. " + mouse_up",
    hl.dsp.focus({
        workspace = "e-1",
    })
)


--------------------------------------------------
-- MOUSE
--------------------------------------------------

hl.bind(
    mainMod .. " + mouse:272",
    hl.dsp.window.drag(),
    { mouse = true }
)

hl.bind(
    mainMod .. " + mouse:273",
    hl.dsp.window.resize(),
    { mouse = true }
)


--------------------------------------------------
-- VOLUME
--------------------------------------------------

hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
    ),
    {
        locked = true,
        repeating = true,
    }
)

hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ),
    {
        locked = true,
        repeating = true,
    }
)

hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd(
        "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ),
    {
        locked = true,
    }
)

hl.bind(
    "XF86AudioMicMute",
    hl.dsp.exec_cmd(
        "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
    ),
    {
        locked = true,
    }
)


--------------------------------------------------
-- BRIGHTNESS
--------------------------------------------------

hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd(
        "brightnessctl -e4 -n2 set 5%+"
    ),
    {
        locked = true,
        repeating = true,
    }
)

hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd(
        "brightnessctl -e4 -n2 set 5%-"
    ),
    {
        locked = true,
        repeating = true,
    }
)


--------------------------------------------------
-- MEDIA
--------------------------------------------------

hl.bind(
    "XF86AudioNext",
    hl.dsp.exec_cmd("playerctl next"),
    { locked = true }
)

hl.bind(
    "XF86AudioPause",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true }
)

hl.bind(
    "XF86AudioPlay",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true }
)

hl.bind(
    "XF86AudioPrev",
    hl.dsp.exec_cmd("playerctl previous"),
    { locked = true }
)
