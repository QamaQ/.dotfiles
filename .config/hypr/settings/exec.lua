-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
-- put former exec-once commands inside the func and former exec commands outside
hl.on("hyprland.start", function()
  -- Bar, wallpaper
  -- hl.exec_cmd("swaybg -i ~/.dotfiles/.wall/014.jpg")
  -- hl.exec_cmd("$HOME/.config/hypr/hyprland/scripts/start_geoclue_agent.sh")
  hl.exec_cmd("qs")
  hl.exec_cmd("dunst")
  hl.exec_cmd("ulauncher")
  -- hl.exec_cmd("$HOME/.config/hypr/custom/scripts/__restore_video_wallpaper.sh")

  -- Core components (authentication, lock screen, notification daemon)
  hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")
  hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
  hl.exec_cmd("hypridle")
  -- hl.exec_cmd("nm-applet")
  hl.exec_cmd("dbus-update-activation-environment --all")
  hl.exec_cmd("sleep 1 && dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")   -- Some fix idk

  -- Audio
  hl.exec_cmd("easyeffects --hide-window --service-mode")

  -- Clipboard: history
  --hl.exec_cmd("wl-paste --watch cliphist store")
  -- hl.exec_cmd("wl-paste --type text --watch bash -c 'cliphist store && qs -c $qsConfig ipc call cliphistService update'")
  -- hl.exec_cmd("wl-paste --type image --watch bash -c 'cliphist store && qs -c $qsConfig ipc call cliphistService update'")

  -- Cursor
  hl.exec_cmd("hyprctl setcursor Breeze 24")
end)
