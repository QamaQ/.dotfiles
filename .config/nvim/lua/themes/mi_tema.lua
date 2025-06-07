-- Archivo: lua/themes/mi_tema.lua

local M = {}

M.colors = {
  -- border        = "#292d3e", -- bordes de ventanas
  error         = "#ff5370", -- erroes
  include       = "#6EBAD7", -- include
  sol           = "#FFCC00",
  -- === Base ===
  bg            = "#0A0A0A",
  fg            = "#EEFFFF",
  text          = "#727272",
  selection_bg  = "#404040",
  selection_fg  = "#FFFFFF",
  buttons       = "#2A2A2A",
  bg_alt        = "#292929",
  disabled      = "#474747",
  contrast      = "#1A1A1A",
  active        = "#323232",
  border        = "#292929",
  highlight     = "#3F3F3F",
  tree          = "#323232C0",
  notifications = "#1A1A1A",

  -- === Accents ===
  accent        = "#FF9800",
  excluded      = "#323232",

  -- === Semantic Colors ===
  red           = "#C85E60", -- tags, errors
  green         = "#c3e88d", -- strings
  yellow        = "#ffcb6b", -- attributes
  blue          = "#82aaff", -- functions
  magenta       = "#c792ea", -- keywords
  orange        = "#f78c6c", -- numbers, params
  cyan          = "#89ddff", -- operators
  gray          = "#616161", -- comments
  white         = "#eeffff",
  black         = "#000000",
  Error         = "#842E3D",
  Warn          = "#846A3A",
  info          = "#465A85",
  Hint          = "#684E7A",
  comment       = "#35363B",

  -- === Syntax-specific ===
  variable      = "#eeffff",
  link          = "#80cbc4",
  func          = "#6A90D0",
  keyword       = "#c792ea",
  tag           = "#f07178",
  string        = "#c3e88d",
  operator      = "#89ddff",
  attribute     = "#ffcb6b",
  number        = "#f78c6c",
  parameter     = "#f78c6c",
  float         = "#020202"
}

function M.setup()
  local c = M.colors

  vim.cmd("highlight clear")
  vim.o.background = "dark"
  vim.o.termguicolors = true
  vim.g.colors_name = "mi_tema"

  -- función auxiliar para simplificar
  local function hl(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- highlights personalizados
  local highlights = {
    Normal                = { fg = c.fg, bg = c.bg },
    Visual                = { fg = "NONE", bg = c.contrast },
    VisualNOS             = { link = "Visual" }, -- Visual mode selection when vim is "Not Owning the Selection".
    FloatBorder           = { fg = c.bg, bg = "NONE" },
    NormalFloat           = { fg = c.fg, bg = c.float },
    NormalContrast        = { fg = c.fg, bg = c.float }, -- a help group for contrast fileypes
    ColorColumn           = { fg = c.comment },
    VertSplit             = { fg = c.comment },
    WinSeparator          = { fg = c.contrast },
    -- Conceal          = { fg = e.disabled },
    Cursor                = { fg = c.bg, bg = c.sol },
    TermCursor            = { link = "Cursor" }, -- cursor for the terminal
    CursorIM              = { link = "Cursor" }, -- like Cursor, but used when in IME mode
    ErrorMsg              = { fg = c.error },
    -- Folded           = { fg = e.disabled, bg = e.bg_alt, italic = true },
    FoldColumn            = { fg = c.blue },
    LineNr                = { fg = c.comment },
    CursorLineNr          = { fg = c.text },
    DiffAdd               = { fg = c.blue, reverse = true },
    DiffChange            = { fg = c.green },
    DiffDelete            = { fg = c.red, reverse = true },
    DiffText              = { fg = c.blue, reverse = true },
    -- ModeMsg          = { fg = e.accent }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- NonText          = { fg = e.disabled },
    SignColumn            = { fg = c.comment },
    -- SpecialKey       = { fg = m.purple },
    StatusLine            = { fg = c.comment, bg = c.bg },
    StatusLineNC          = { link = "StatusLine" },
    -- StatusLineTerm   = { fg = e.fg, bg = e.active },
    -- StatusLineTermNC = { fg = e.disabled, bg = e.bg },
    TabLineFill           = { fg = c.fg },
    TabLineSel            = { fg = c.bg, bg = c.active },
    TabLine               = { fg = c.fg },
    Title                 = { fg = c.fg, bold = true },
    WarningMsg            = { fg = c.yellow },
    -- Whitespace       = { fg = e.disabled },
    CursorLine            = { bg = "#020202" },
    Todo                  = { fg = c.yellow, bold = true },
    -- Ignore           = { fg = e.disabled },
    Underlined            = { fg = c.active, underline = true },
    Error                 = { fg = c.red, bold = true },

    Pmenu                 = { fg = c.active, bg = c.float }, -- popup menu
    PmenuSel              = { bg = "#212121", fg = c.cyan }, -- Popup menu: selected item.
    PmenuSbar             = { bg = c.active },
    PmenuThumb            = { fg = c.fg },
    WildMenu              = { fg = c.orange, bold = true }, -- current match in 'wildmenu' completion

    DiagnosticError       = { fg = c.Error, underline = false },
    DiagnosticWarn        = { fg = c.Warn },
    DiagnosticInformation = { fg = c.info },
    DiagnosticHint        = { fg = c.Hint },

    -- diffAdded             = { fg = g.added },
    -- diffRemoved           = { fg = g.removed },



    -- color highlights
    Black                    = { fg = c.black },
    Red                      = { fg = c.red },
    Green                    = { fg = c.green },
    Yellow                   = { fg = c.yellow },
    Blue                     = { fg = c.blue },
    Cyan                     = { fg = c.cyan },
    Purple                   = { fg = c.purple },
    Orange                   = { fg = c.orange },

    -- syntax
    Function                 = { fg = c.func },
    Include                  = { fg = c.include, italic = true },
    Comment                  = { fg = c.comment, italic = true },
    Statement                = { fg = c.cyan, italic = true },
    Attribute                = { fg = c.red },
    Number                   = { fg = c.orange },
    Constant                 = { fg = c.yellow },
    String                   = { fg = c.green },
    Boolean                  = { fg = c.cyan },
    Identifier               = { fg = c.fg },
    Operator                 = { fg = c.cyan },
    Float                    = { link = "Number" },

    -- Python
    PythonInclude            = { fg = c.include, italic = true },
    pythonTripleQuotes       = { fg = c.comment, italic = true },
    pythonTripleQuotesString = { fg = c.comment, italic = true },


    --markdown
    markdownH1                                 = { fg = c.yellow },
    markdownH1Delimiter                        = { fg = c.cyan },
    markdownH2                                 = { fg = c.yellow },
    markdownH2Delimiter                        = { fg = c.cyan },
    markdownCode                               = { fg = c.green },

    -- TS
    ['@function.builtin']                      = { fg = c.blue },
    ['@function.builtin.python']               = { fg = c.blue, italic = false },
    ['@function.call']                         = { fg = c.blue, italic = false },
    --
    ['@string.documentation.python']           = { fg = c.comment, italic = true },
    --
    ['@module']                                = { fg = c.yellow },
    --
    ['@variable.parameter']                    = { fg = c.fg, italic = true },
    ['@variable.parameter.builtin']            = { fg = c.red, italic = true },
    ['@variable.member']                       = { fg = c.yellow, italic = false },
    ['@variable.member.python']                = { fg = c.red, italic = false },
    --
    ['@constant.builtin']                      = { fg = c.fg },
    ['@constant.builtin.python']               = { fg = c.cyan },
    --
    ['@constructor']                           = { fg = c.blue, italic = false },
    ['@constructor.python']                    = { fg = c.blue, italic = false },
    --
    ['@property']                              = { fg = c.yellow },
    --
    ['@constant.python']                       = { fg = c.red },
    --
    ['@type']                                  = { fg = c.red, italic = false },
    ['@type.builtin']                          = { fg = c.yellow, italic = true },
    ['@type.python']                           = { fg = c.blue, italic = false, bold = false },
    --
    ['@keydord']                               = { fg = c.include, italic = true },
    ['@keyword.import']                        = { fg = c.cyan, italic = true },
    ['@keyword.function']                      = { fg = c.magenta },
    --
    ["@label"]                                 = { fg = c.yellow },
    ["@punctuation"]                           = { fg = c.cyan },
    ["@punctuation.delimiter"]                 = { fg = c.cyan },
    ["@punctuation.bracket"]                   = { fg = c.sol },
    ["@punctuation.special"]                   = { fg = c.cyan },
    --
    -- ["@markup.underline"]         = { underline = true },
    -- ["@markup.emphasis"]          = { italic = true },
    -- ["@markup.strong"]            = { bold = true },
    -- -- ["@markup.strikethrough"]     = { style = { "strikethrough" } },
    ["@markup.title"]                          = { fg = c.cyan, bold = true },
    ["@markup.heading"]                        = { fg = c.yellow, bold = true },
    -- ["@markup.literal"]           = { fg = m.green },
    -- ["@markup.link"]              = { link = "Tag" }, -- text references, footnotes, citations, etc.
    -- ["@markup.link.url"]          = { fg = e.link }, -- urls, links and emails
    ["@markup.math"]                           = { fg = c.blue },  -- e.g. LaTeX math
    ["@markup.raw"]                            = { fg = c.green }, -- e.g. inline `code` in Markdown
    -- ["@markup.list"]              = { link = "Special" },
    ["@markup.list.checked"]                   = { fg = c.green }, -- checkboxes
    ["@markup.list.unchecked"]                 = { fg = c.text },
    -- ["@markup.environment"]       = { fg = m.red },
    ["@markup.environment.name"]               = { fg = c.red },
    -- ["@markup.warning"]           = { fg = l.warning },
    ["@markup.danger"]                         = { fg = c.error },
    --
    -- LSP
    ["@lsp.type.builtinType"]                  = { link = "@type.builtin" },
    ["@lsp.type.comment"]                      = { link = "@comment" },
    ["@lsp.type.boolean"]                      = { link = "@boolean" },
    ["@lsp.type.enum"]                         = { link = "@type" },
    ["@lsp.type.enumMember"]                   = { link = "@constant" },
    ["@lsp.type.escapeSequence"]               = { link = "@string.escape" },
    ["@lsp.type.formatSpecifier"]              = { link = "@punctuation" },
    ["@lsp.type.interface"]                    = { link = "Identifier" },
    ["@lsp.type.keyword"]                      = { link = "@keyword" },
    ['@lsp.type.class']                        = { link = "@type" },
    ["@lsp.type.namespace"]                    = { link = "@module" },
    ["@lsp.type.number"]                       = { link = "@number" },
    ["@lsp.type.operator"]                     = { link = "@operator" },
    ["@lsp.type.parameter"]                    = { link = "@variable.parameter" },
    -- ["@lsp.type.property"]                     = { fg = c.yellow },
    ["@lsp.type.selfKeyword"]                  = { link = "@variable.builtin" },
    ["@lsp.type.typeAlias"]                    = { link = "@type" },
    ["@lsp.type.unresolvedReference"]          = { link = "@error" },
    ["@lsp.typemod.class.defaultLibrary"]      = { link = "@type.builtin" },
    ["@lsp.typemod.enum.defaultLibrary"]       = { link = "@type.builtin" },
    ["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
    ["@lsp.typemod.function.defaultLibrary"]   = { link = "@function.builtin" },
    ["@lsp.typemod.keyword.async"]             = { link = "@keyword.coroutine" },
    ["@lsp.typemod.macro.defaultLibrary"]      = { link = "@function.builtin" },
    ["@lsp.typemod.method.defaultLibrary"]     = { link = "@function.builtin" },
    ["@lsp.typemod.operator.injected"]         = { link = "@operator" },
    ["@lsp.typemod.string.injected"]           = { link = "@string" },
    ["@lsp.typemod.type.defaultLibrary"]       = { link = "@type.builtin" },
    ["@lsp.typemod.variable.defaultLibrary"]   = { link = "@variable.builtin" },
    ["@lsp.typemod.variable.injected"]         = { link = "@variable" },
    --
    -- [[ Plugins
    -- NvimTree
    NvimTreeNormal                             = { fg = c.active, bg = "NONE" },
    NvimTreeNormalNC                           = { link = "NvimTreeNormal" },
    NvimTreeNormalFloat                        = { bg = "NONE" },
    NvimTreeGitDirty                           = { fg = c.blue },
    NvimTreeGitNew                             = { fg = c.green },
    NvimTreeGitStaged                          = { fg = c.fg },
    NvimTreeGitDeleted                         = { fg = c.red },
    NvimTreeFolderName                         = { fg = c.active, bold = false },
    NvimTreeOpenedFolderName                   = { link = "NvimTreeFolderName" },
    -- NvimTreeFolderIcon       = { link = "NvimTreeFolderName" },
    NvimTreeRootFolder                         = { fg = c.active },
    NvimTreeEmptyFolderName                    = { fg = c.active },
    NvimTreeIndentMarker                       = { fg = c.comment },
    NvimTreeMarkdownFile                       = { fg = c.comment },
    NvimTreeSpecialFile                        = { fg = c.comment },
    NvimTreeExecFile                           = { fg = c.comment },

    -- blink.cmp
    BlinkCmpMenu                               = { fg = c.fg, bg = c.float },
    -- BlinkCmpMenuBorder                   = { fg = e.border, bg = e.bg },
    BlinkCmpMenuSelection                      = { bg = "#202020", fg = "NONE" },
    -- BlinkCmpScrollBarThumb               = {},
    -- BlinkCmpScrollBarGutter              = {},
    BlinkCmpLabel                              = { fg = c.comment },
    -- TODO: set this in nvim-cmp as well
    -- BlinkCmpLabelDeprecated              = { fg = e.fg, strikethrough = true },
    BlinkCmpLabelMatch                         = { fg = c.cyan, bold = true },
    BlinkCmpLabelDetail                        = { link = "BlinkCmpLabel" },
    BlinkCmpLabelDescription                   = { link = "BlinkCmpLabel" },
    BlinkCmpSource                             = { fg = c.disabled },
    BlinkCmpGhostText                          = {},
    BlinkCmpDoc                                = { fg = c.float, bg = c.float },
    -- BlinkCmpDocBorder                    = { link = "BlinkCmpMenuBorder" },
    BlinkCmpDocSeparator                       = { fg = c.comment },
    BlinkCmpDocCursorLine                      = {},
    BlinkCmpSignatureHelp                      = {},
    BlinkCmpSignatureHelpBorder                = { link = "BlinkCmpMenuBorder" },
    -- BlinkCmpSignatureHelpActiveParameter = {},

    BlinkCmpKind                               = { fg = c.blue },
    BlinkCmpKindText                           = { fg = c.fg },
    BlinkCmpKindMethod                         = { fg = c.magenta },
    BlinkCmpKindFunction                       = { fg = c.magenta },
    BlinkCmpKindContructor                     = { fg = c.blue },
    BlinkCmpKindField                          = { fg = c.cyan },
    BlinkCmpKindVariable                       = { fg = c.cyan },
    -- BlinkCmpKindValue                    = { fg = m.paleblue },
    BlinkCmpKindConstant                       = { fg = c.fg },
    BlinkCmpKindClass                          = { fg = c.yellow },
    -- BlinkCmpKindStruct                   = { fg = s.type },
    -- BlinkCmpKindInterface                = { fg = s.type },
    BlinkCmpKindModule                         = { fg = c.orange },
    BlinkCmpKindProperty                       = { fg = c.fg },
    BlinkCmpKindKeyword                        = { fg = c.fg },
    BlinkCmpKindUnit                           = { fg = c.green },
    BlinkCmpKindFile                           = { fg = c.fg },
    BlinkCmpKindFolder                         = { fg = c.fg },
    BlinkCmpKindSnippet                        = { fg = c.green },
    BlinkCmpKindEvent                          = { fg = c.blue },
    BlinkCmpKindTypeParameter                  = { fg = c.blue },
    -- BlinkCmpKindCopilot                  = { fg = m.darkcyan },
    BlinkCmpKindColor                          = { fg = c.red },
    BlinkCmpKindEnum                           = { fg = c.yellow }, -- TODO
    BlinkCmpEnumMember                         = { fg = c.orange }, -- TODO
    -- BlinkCmpKindOperator                 = { fg = s.operator }, -- TODO
    BlinkCmpKindReference                      = { fg = c.cyan },   -- TODO
    -- ]]


  }

  for group, opts in pairs(highlights) do
    hl(group, opts)
  end
end

return M
