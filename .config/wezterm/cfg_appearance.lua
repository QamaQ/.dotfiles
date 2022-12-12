local cfg = {}

cfg.hide_tab_bar_if_only_one_tab = true

cfg.window_decorations = "RESIZE"

-- Pad window to avoid the content to be too close to the border,
-- so it's easier to see and select.
cfg.window_padding = {
  left = 0, right = 0,
  top = 0, bottom = 0,
}

cfg.inactive_pane_hsb = {
  -- NOTE: these values are multipliers, applied on normal pane values
  saturation = 1,
  brightness = 1,
}


cfg.colors = require("cfg_bew_colors")

return cfg
