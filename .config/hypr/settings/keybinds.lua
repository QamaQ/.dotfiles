---------------------
---- MY PROGRAMS ----
---------------------

local ipc         = "noctalia msg "
-- Set programs that you use
local terminal    = "alacritty"
local fileManager = "dolphin"
-- local menu        = "fuzzel"
-- local menu        = "qs ipc call launcher toggle"
local menu        = "ulauncher-toggle"

local bind        = hl.bind
local exec        = hl.dsp.exec_cmd
local window      = hl.dsp.window


---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

bind(mainMod .. " + SUPER_L", exec(menu), { description = "App: App launcher" })
-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
bind(mainMod .. " + Return", exec(terminal), { description = "App: Terminal" })
local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
bind(mainMod .. " + CTRL + W ",
	exec("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
bind(mainMod .. " + E", exec(fileManager), { description = "App: File manager" })
bind(mainMod .. " + F", window.float({ action = "toggle" }))
bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
bind(mainMod .. " + SHIFT + F ", window.fullscreen({ action = "toggle" }))

-- bind(mainMod .. " + P", hl.dsp.window.pseudo())
bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only



-- Atajo (SUPER + P) para convertir la ventana activa en Picture-in-Picture
bind("SUPER + P", function()
	-- 1. Cambia el estado a flotante
	-- hl.dispatch(window.float())

	-- 2. Ancla la ventana (pin) para que sea visible en todos los workspaces
	hl.dispatch(window.pin())

	-- 3. Redimensiona la ventana a un tamaño pequeño (ejemplo: 600x340 píxeles)
	-- Usamos 'exact' para forzar ese tamaño absoluto
	-- hl.dispatch(window.resize({ width = 600, height = 340 }))

	-- 4. Mueve la ventana a la esquina inferior derecha
	-- Ajusta los valores según la resolución de tu pantalla (ej. 1920x1080)
	-- Aquí la enviamos a la posición X=1300, Y=720 como ejemplo
	-- hl.dispatch(window.move({  }))
end)

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 8 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))


-- Navegar entre TODAS las ventanas (tiled y flotantes mezcladas)
-- hl.bind("SUPER + Tab", hl.dsp.window.cycle_next())
-- Comportamiento "Alt+Tab" perfecto
hl.bind("SUPER + Tab", function()
	-- 1. Pasa el foco a la siguiente ventana (sea cual sea)
	hl.dispatch(hl.dsp.window.cycle_next())
	-- 2. Si la ventana es flotante, asegúrate de traerla al frente de la pantalla
	hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
end)

hl.bind("SUPER + SHIFT + Tab", function()
	-- 1. Pasa el foco a la ventana ANTERIOR (cambiando next a false)
	hl.dispatch(hl.dsp.window.cycle_next({ next = false }))

	-- 2. Si la ventana es flotante, asegúrate de traerla al frente de la pantalla
	hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
end)

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })


-- Laptop multimedia keys for volume and LCD brightness

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })
--
-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- ScreenShot
hl.bind("Print", exec("hyprshot -m region"))


-- Bar toggle
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("qs ipc call bar toggle"), { description = "Bar: Toggle visibility" })

-- Session
hl.bind("SUPER + L", hl.dsp.exec_cmd("loginctl lock-session"), { description = "Session: Lock" })
