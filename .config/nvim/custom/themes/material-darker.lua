local M = {}
local status_lspconfig, lspconfig = pcall(require, "lspconfig")
if not status_lspconfig then
    return
end

local colors = require("custom.configs.lspconfig")

M.base_30 = {
  white = "#EEFFFF",
  darker_black = "#212121", -- nvimtree, telescope, Lazy 
  black = "#212121", --  nvim bg
  black2 = "#313131", -- selection item, tab-bar
  one_bg = "#212121", -- real bg of onedark
  one_bg2 = "#313131",
  one_bg3 = "#313131",
  grey = "#424242",     -- Line numbers (shouldn't be base01?)
  grey_fg = "#545454",  -- Why this affects comments?
  grey_fg2 = "#616161",
  light_grey = "#545454",
  red = "#82AAFF",
  baby_pink = "#ff949b",
  pink = "#ff8087",
  line = "#313131", -- for lines like vertsplit
  green = "#C3E88D",
  vibrant_green = "#b9e75b",
  nord_blue = "#82AAFF",   -- mode bg normal
  blue = "#82AAFF",
  yellow = "#FFCB6B",
  sun = "#EBCB8B",
  purple = "#C792EA",
  dark_purple = "#C3E88D", -- mode bg insert 
  teal = "#FFCB6B",
  orange = "#ffa455",
  cyan = "#89DDFF",
  statusline_bg = "#212121",
  lightbg = "#212121",
  pmenu_bg = "#89DDFF",
  folder_bg = "#89B4FA",
  -- lavender = "#00ff00",
}

M.base_16 = {
  base00 = "#212121",   -- default bg
  base01 = "#303030",   --Lighter bg (status bar, line number, folding mks)
  base02 = "#353535",   -- selection bg
  base03 = "#4A4A4A",   -- comments, invisibles, line hl
  base04 = "#B2CCD6",   -- dark fg ( status bar )
  base05 = "#EEFFFF",   -- default fg (caret, delimiters, operators)  *
  base06 = "#EEFFFF",   -- light fg (not often used)
  base07 = "#FFFFFF",   -- light bg (not often used)
  base08 = "#F07178",   -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
  base09 = "#F78C6C",   -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
  base0A = "#FFCB6B",   -- Classes, Markup Bold, Search Text Background
  base0B = "#C3E88D",   -- Strings, Inherited Class, Markup Code, Diff Inserted
  base0C = "#89DDFF",   -- Support, regex, escape chars
  base0D = "#82AAFF",   -- Function, methods, headings
  base0E = "#C792EA",   -- Keywords
  base0F = "#FF5370",   -- Deprecated, open/close embedded tags
}
M.colors = {
  yellow = "#FFCC00"
}

M.polish_hl = {
  ["@variable"] = { fg = M.base_30.white },
  ["@variable.builtin"] = { fg = M.base_30.white },
  ["@none"] = { fg = M.base_16.base09 },
  ["@constant"] = { fg = M.base_30.white },
  ["@constant.builtin"] = { fg = M.base_16.base09 },
  ["@field"] = { fg = M.base_30.white },
  ["@type"] = { fg = M.base_30.base0E },
  ["@type.builtin"] = { fg = M.base_16.base0D },
  ["@type.definition"] = { fg = M.base_30.base0E },
  ["@method.call"] = { fg = M.base_30.white },
  ["@function"] = { fg = M.base_16.base0D },
  ["@function.builtin"] = { fg = M.base_16.base0D },
  ["@function.call"] = { fg = M.base_30.white },
  TSFuncMacro = { link = "Function" },
  ["@constructor"] = { fg = M.base_30.white },
  ["@attribute"] = { fg = M.base_16.base0C },
  ["@parameter"] = { fg = M.base_16.base08 },
  Boolean = { fg = M.base_16.base09 },
  Number = { fg = M.base_16.base09 },
  Float = { fg = M.base_16.base09 },
  SpellBad      = { fg = M.base_16.base0F, italic = true, undercurl = true },
  SpellCap      = { fg = M.base_16.base0D, italic = true, undercurl = true },
  SpellLocal    = { fg = M.base_16.base0C, italic = true, undercurl = true },
  SpellRare     = { fg = M.base_16.base0E, italic = true, undercurl = true },
  Comment = { fg = M.base_30.grey_fg },
  ["@preproc"] = { fg = M.base_16.base0C },
  String = { fg = M.base_16.base0B },
  ["@string.escape"] = { fg = M.base_16.base0C },
  ["@string.regex"] = { fg = M.base_16.base0A },
  ["@string.special"] = { fg = M.base_16.base01 },
  ["@string.documentation"] = { fg = M.base_16.base0B },
  ["@operator"] = { fg = M.base_16.base0E },
  ["@keyword"] = { fg = M.base_16.base0C },
  ["@keyword.operator"] = { fg = M.base_16.base0C },
  ["@keyword.function"] = { fg = M.base_16.base0E },
  ["@keyword.return"] = { fg = M.base_16.base0C, italic = true },
  ["@keyword.coroutine"] = { fg = M.base_16.base0E, italic = true },
  Include = { fg = M.base_16.base0C, italic = true },
  Conditional = { fg = M.base_16.base0C, italic = true },
  Repeat = { fg = M.base_16.base0C },
  Exception = { fg = M.base_16.base0F },
  ["@punctuation"] = { fg = M.base_16.base0C },
  ["@punctuation.bracket"] = { fg = M.colors.yellow },
  ["@punctuation.special"] = { fg = M.base_16.base0E },
  ["@punctuation.delimiter"] = { fg = M.base_16.base0C },


  -- lsp icons diagnostic
  DiagnosticError = { fg = M.base_16.base0F },
  DiagnosticWarn        = { fg = M.base_16.base0A },
  DiagnosticInformation = { fg = M.base_16.base0C },
  DiagnosticHint        = { fg = M.base_16.base0E },
  ["@lsp.type.enum"]       = { fg = "#00ff00" },
  -- ["@lsp.type.keyword"]    = { link = "@keyword" },
  -- ["@lsp.type.interface"]  = { link = "Identifier" },
  -- ["@lsp.type.namespace"]  = { link = "@namespace" },
  -- ["@lsp.type.parameter"]  = { link = "@parameter" },
  -- ["@lsp.type.property"]   = { link = "@property" },

  -- ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
  -- ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },

}
M.type = "dark"


return M

