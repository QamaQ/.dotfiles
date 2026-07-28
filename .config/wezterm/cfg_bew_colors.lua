
local col = {}

-- Bew colors
col.background = "#212121"
col.foreground = "#EEFFFF"

col.cursor_bg = "#FFCC00"
col.cursor_border = "#eeeeee" -- same as cursor_bg

col.ansi = {
  "#545454", -- black
  "#FF5370", -- red
  "#C3E88D", -- green
  "#FFCB6B", -- yellow
  "#83AAFF", -- blue
  "#C792EA", -- orange (magentas usually)
  "#89DDFF", -- cyan
  "#ffffff", -- white
}

col.brights = {
  "#515151", -- black
  "#FF5370", -- red
  "#C3E88D", -- green
  "#FFCB6B", -- yellow
  "#83AAFF", -- blue
  "#C792EA", -- orange (magentas usually)
  "#89DDFF", -- cyan
  "#ffffff", -- white
}

col.indexed = {
  [22] = "#003a0b", -- darker dark green
  [52] = "#490101", -- darker dark red
}

-- Slightly red & transparent (blended in bg)
-- (fg color is preserved)
col.selection_bg = "rgba(100% 50% 50% 20%)"



col.tab_bar = {
	background = "#212121",
	active_tab = {
		bg_color = "#212121",
		fg_color = "#EEFFFF",
		underline = "Single"
	},
	inactive_tab = {
		bg_color = "#212121",
		fg_color = "#616161"
	},
	inactive_tab_hover = {
		bg_color = "#212121",
		fg_color = "#919191"
	},
}


return col
