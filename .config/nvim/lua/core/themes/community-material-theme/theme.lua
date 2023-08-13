local c = require("core.themes.community-material-theme.palette")

local hl = vim.api.nvim_set_hl
local theme = {}

theme.set_highlights = function()
	hl(0, "Normal", { fg = c.fg, bg = c.bg })
	hl(0, "Pmenu", { fg = c.fg, bg = c.bg })
	hl(0, "NormalFloat", { fg = c.fg, bg = c.bg })
	hl(0, "Visual", { fg = c.none, bg = c.active })
	hl(0, "VisualNOS", { link = "Visual" })
	hl(0, "IncSearch", { bg = c.select, underline = true })
	hl(0, "Search", { bg = c.active, reverse = false })
	hl(0, "SpellBad", { fg = c.red, italic = true, undercurl = true })
	hl(0, "SpellCap", { fg = c.blue, italic = true, undercurl = true })
	hl(0, "SpellLocal", { fg = c.cyan, italic = true, undercurl = true })
	hl(0, "SpellRare", { fg = c.magenta, italic = true, undercurl = true })
	hl(0, "healthError", { fg = c.red })
	hl(0, "healthSuccess", { fg = c.yellow })
	hl(0, "healthWarning", { fg = c.yellow })
	hl(0, "healthHeading", { fg = c.active, bg = c.bg })
	hl(0, "Directory", { fg = c.blue })
	hl(0, "MatchParen", { fg = c.yellow, bg = c.select })
	hl(0, "Question", { fg = c.yellow })
	hl(0, "QuickFixLine", { fg = c.comment, reverse = true })
	hl(0, "PmenuSel", { fg = c.none, bg = c.select, reverse = false })
	hl(0, "PmenuSbar", { fg = c.active, bg = c.bg })
	hl(0, "PmenuThumb", { fg = c.fg })
	hl(0, "WildMenu", { fg = c.cyan })
	hl(0, "VertSplit", { fg = c.active })
	hl(0, "ColorColumn", { fg = c.none, bg = c.active })
	hl(0, "Cursor", { fg = c.gray, bg = c.cursor })
	hl(0, "CursorIM", { link = "Cursor" })
	hl(0, "ErrorMsg", { fg = c.red })
	hl(0, "Folded", { fg = c.fg, bg = c.bg, italic = true })
	hl(0, "FoldedColumn", { fg = c.blue })
	hl(0, "LineNr", { fg = c.active, bg = c.bg })
	hl(0, "CursorLineNr", { fg = c.active2, bg = c.none })
	hl(0, "DiffAdd", { fg = c.green })
	hl(0, "DiffChanged", { fg = c.blue })
	hl(0, "DiffDelete", { fg = c.red, reverse = true })
	hl(0, "DiffText", { fg = c.blue, reverse = true })
	hl(0, "ModeMsg", { fg = c.accent })
	hl(0, "NonText", { fg = c.disable })
	hl(0, "SignColumn", { fg = c.fg })
	hl(0, "SpecialKey", { fg = c.magenta })
	hl(0, "StatusLine", { fg = c.fg, bg = c.bg })
	hl(0, "Tabline", { fg = c.fg, bg = c.bg })
	hl(0, "Title", { fg = c.comment })
	hl(0, "Warnings", { fg = c.yellow })
	hl(0, "WarningMsg", { fg = c.yellow })
	hl(0, "Whitespace", { fg = c.disable })
	hl(0, "CursorLine", { bg = c.select })
	hl(0, "CursorColumn", { link = "CursorLine" })
	hl(0, "Todo", { fg = c.yellow })
	hl(0, "Ignore", { fg = c.disable })
	hl(0, "Underline", { fg = c.orange, underline = true })
	hl(0, "Error", { fg = c.red })

	-- cmp
	hl(0, "CmpItemAbbr", { fg = c.fg })
	hl(0, "CmpItemMenu", { fg = c.disable, italic = true })
	hl(0, "CmpItemAbbrMatch", { fg = c.cyan })

	hl(0, "CmpItemKindField", { fg = c.ligh_blue })
	hl(0, "CmpItemKindProperty", { fg = c.ligh_blue })
	hl(0, "CmpItemKindEvent", { fg = c.yellow })
	hl(0, "CmpItemKindText", { fg = c.green })
	hl(0, "CmpItemKindEnum", { fg = c.yellow })
	hl(0, "CmpItemKindKeyword", { fg = c.fg })
	hl(0, "CmpItemKindConstant", { fg = c.cyan })
	hl(0, "CmpItemKindConstructor", { fg = c.yellow })
	hl(0, "CmpItemKindReference", { fg = c.ligh_blue })
	hl(0, "CmpItemKindFunction", { fg = c.magenta })
	hl(0, "CmpItemKindStruct", { fg = c.yellow })
	hl(0, "CmpItemKindClass", { fg = c.yellow })
	hl(0, "CmpItemKindModule", { fg = c.cyan })
	hl(0, "CmpItemKindOperator", { fg = c.fg })
	hl(0, "CmpItemKindVariable", { fg = c.blue })
	hl(0, "CmpItemKindFile", { fg = c.fg })
	hl(0, "CmpItemKindUnit", { fg = c.fg })
	hl(0, "CmpItemKindSnippet", { fg = c.green })
	hl(0, "CmpItemKindFolder", { fg = c.fg })
	hl(0, "CmpItemKindMethod", { fg = c.cyan })
	hl(0, "CmpItemKindValue", { fg = c.ligh_blue })
	hl(0, "CmpItemKindEnumMember", { fg = c.vivid_blue })
	hl(0, "CmpItemKindInterface", { fg = c.yellow })
	hl(0, "CmpItemKindColor", { fg = c.fg })
	hl(0, "CmpItemKindTypeParameter", { fg = c.ligh_blue })

	-- highlights_syntax
	--hl(0, "Comment", { fg = c.comment })
	--hl(0, "Variable", { fg = c.fg })
	--hl(0, "String", { fg = c.green })
	--hl(0, "Character", { bg = c.orange })
	--hl(0, "Number", { fg = c.orange })
	--hl(0, "Float", { fg = c.orange })
	--hl(0, "Boolean", { fg = c.orange })
	--hl(0, "Constant", { fg = c.orange })
	--hl(0, "Type", { fg = c.magenta })
	--hl(0, "Function", { fg = c.blue })
	--hl(0, "Parameter", { fg = c.fg })
	--hl(0, "Keyword", { fg = c.magenta })
	--hl(0, "Conditional", { fg = c.cyan, italic = true })
	--hl(0, "Repeat", { fg = c.cyan, italic = true })
	--hl(0, "Operator", { fg = c.magenta, italic = true })
	--hl(0, "PreProc", { fg = c.cyan, italic = true })
	--hl(0, "Include", { fg = c.cyan, italic = true })
	--hl(0, "Exception", { fg = c.red })
	--hl(0, "StorageClass", {fg = c.fg})
	--hl(0, "Structure", { fg = c.cursor })
	--hl(0, "Typedef", { fg = c.magenta })
	--hl(0, "Define", { fg = c.cyan})
	--hl(0, "Macro", {fg = c.cyan})
	--hl(0, "Debug", {fg = c.red })
	--hl(0, "Title", { fg = c.fg })
	--hl(0, "Label", { fg = c.magenta })
	--hl(0, "SpecialChar", { fg = c.red })
	--hl(0, "Special", { fg = c.yellow })
	--hl(0, "Delimiter", { fg = c.cyan })
	--hl(0, "Tag", { fg = c.red })
	--hl(0, "Identifier", { fg = c.fg })
	----hl(0, "PrepCondit", { fg = "#00ff00" })
	--hl(0, "Statement", { fg = c.cyan })
	--hl(0, "Todo", { fg = c.magenta })
	--hl(0, "Brackets", { fg = c.cursor})
	--hl(0, "constructor", { fg = c.cursor })
	hl(0, "Comment", { fg = c.comment, italic = true })
	hl(0, "Constant", { fg = c.yellow })
	hl(0, "String", { fg = c.green })
	hl(0, "Character", { fg = c.orange })
	hl(0, "Number", { fg = c.orange })
	hl(0, "Boolean", { fg = c.orange })
	hl(0, "Float", { fg = c.orange })
	hl(0, "Identifier", { fg = c.fg })
	hl(0, "Function", { fg = c.blue })
	hl(0, "FunctionCall", { fg = c.blue })
	hl(0, "FunctionBlock", { fg = c.blue })
	hl(0, "Statement", { fg = c.cyan })
	hl(0, "Conditional", { fg = c.cyan, italic = true })
	hl(0, "Repeat", { fg = c.cyan, italic = true })
	hl(0, "Label", { fg = c.magenta })
	hl(0, "Operator", { fg = c.cyan })
	hl(0, "Keyword", { fg = c.magenta })
	hl(0, "Exception", { fg = c.cyan })
	hl(0, "PreProc", { fg = c.magenta })
	hl(0, "Include", { fg = c.cyan })
	hl(0, "Define", { fg = c.cyan })
	hl(0, "Macro", { fg = c.cyan })
	--hl(0, "PrepCondit", { c.cyan })
	hl(0, "Type", { fg = c.magenta })
	hl(0, "StorageClass", { fg = c.cyan })
	hl(0, "Structure", { fg = c.magenta })
	--hl(0, "Typedef", { fg = c.blue })
	hl(0, "Special", { fg = c.cyan })
	hl(0, "SpecialChar", { fg = c.red })
	hl(0, "Tag", { fg = c.orange })
	hl(0, "Delimiter", { fg = c.cyan })
	hl(0, "SpecialComment", { fg = c.comment })
	hl(0, "Debug", { fg = c.red })
	hl(0, "Underline", { fg = c.orange })
	hl(0, "Ignore", { fg = c.disable })
	hl(0, "Error", { fg = c.red })
	hl(0, "Todo", { fg = c.yellow })
	-- python
	hl(0, "pythonInclude", { fg = c.cyan, italic = true })
	hl(0, "pythonStatement", { fg = c.magenta })
	hl(0, "pythonDecorator", { fg = c.cyan })
	hl(0, "pythonBuiltin", { fg = c.orange })
	hl(0, "pythonConditional", { fg = c.cyan, italic = true })
	hl(0, "pythonOperator", { fg = c.cyan, italic = true })
	hl(0, "pythonFunction", { fg = c.blue })

	-- treesitter
	-- hl(0, "@Variable", { fg = c.fg })
	-- hl(0, "@Include", { fg = c.cyan, italic = true })
	-- hl(0, "@boolean", { fg = c.orange })
	-- hl(0, "@operator", { fg = c.magenta })
	-- hl(0, "@attribute", { fg = c.blue })
	-- hl(0, "@keyword", { fg = c.cyan, italic = true })
	-- hl(0, "@keyword.function", { fg = c.magenta })
	-- hl(0, "@keyword.operator", { fg = c.magenta })
	-- hl(0, "@keyword.return", { fg = c.cyan, italic = true })
	-- hl(0, "@function", { fg = c.blue })
	-- hl(0, "@function.call", { fg = c.fg })
	-- hl(0, "@function.builtin", { fg = c.blue })
	-- hl(0, "@comment", { fg = c.comment })
	-- hl(0, "@parameter", { fg = c.red })
	-- hl(0, "@punctuation.bracket", { fg = c.cursor })
	-- hl(0, "@punctuation.delimiter", { fg = c.cursor })
	-- hl(0, "@string", { fg = c.green })
	-- hl(0, "@string.documentation", { fg = c.green })
	-- hl(0, "@constructor", { fg = c.fg })
	-- hl(0, "@constant", { fg = c.fg })
	-- hl(0, "@repeat", { fg = c.cyan, italic = true })
	-- hl(0, "@field", { fg = c.fg })
	-- hl(0, "@method.call", { fg = c.blue })
	-- hl(0, "@constant.builtin", { fg = c.orange })
	-- hl(0, "preproc", { fg = c.comment })
	hl(0, "@conceal", { fg = c.orange, bold = false })
	-- hl(0, "@type", { fg = c.magenta })
	-- hl(0, "@text.title.1", { fg = c.yellow })
	-- hl(0, "@text.title.1.marker", { fg = c.green })
	-- hl(0, "@text.title.2", { fg = c.yellow })
	-- hl(0, "@text.title.2.marker", { fg = c.green })
	-- hl(0, "@text.literal.block", { fg = c.disable })

	-- treesitter misc
	hl(0, "@comment", { fg = c.comment }) -- @comment               ; line and block comments
	hl(0, "@comment.documentation", { fg = c.comment }) -- @comment.documentation ; comments documenting code
	hl(0, "@error", { fg = c.red }) -- @error                 ; syntax/parser errors
	hl(0, "@none", { fg = c.none }) -- @none                  ; completely disable the highlight
	hl(0, "@preproc", { fg = c.comment }) -- @preproc               ; various preprocessor directives & shebangs
	hl(0, "@define", { fg = c.cyan }) -- @define                ; preprocessor definition directives
	hl(0, "@operator", { fg = c.magenta }) -- @operator              ; symbolic operators (e.g. `+` / `*`)
	-- treesitter punctuation
	hl(0, "@punctuation.delimiter", { fg = c.cyan }) -- @punctuation.delimiter ; delimiters (e.g. `;` / `.` / `,`)
	hl(0, "@punctuation.bracket", { fg = c.cursor }) -- @punctuation.bracket   ; brackets (e.g. `()` / `{}` / `[]`)
	hl(0, "@punctuation.special", { fg = c.orange }) -- @punctuation.special   ; special symbols (e.g. `{}` in string interpolation)

	-- treesitter literals
	hl(0, "@string", { fg = c.green }) -- @string               ; string literals
	hl(0, "@string.documentation", { fg = c.green }) -- @string.documentation ; string documenting code (e.g. Python docstrings)
	hl(0, "@string.regex", { fg = c.cyan }) -- @string.regex         ; regular expressions
	hl(0, "@string.escape", { fg = c.cyan }) --@string.escape        ; escape sequences
	hl(0, "@string.special", { fg = c.cyan }) -- @string.special       ; other special strings (e.g. dates)

	hl(0, "@character", { fg = c.orange }) -- @character            ; character literals
	hl(0, "@character.special", { fg = c.cyan }) --@character.special    ; special characters (e.g. wildcards)
	--
	hl(0, "@boolean", { fg = c.orange }) --@boolean              ; boolean literals
	hl(0, "@number", { fg = c.orange }) -- @number               ; numeric literals
	hl(0, "@float", { fg = c.orange }) -- @float                ; floating-point number literals

	-- treesitter functions
	hl(0, "@function", { fg = c.blue }) -- @function         ; function definitions
	hl(0, "@function.builtin", { fg = c.blue }) -- @function.builtin ; built-in functions
	hl(0, "@function.call", { fg = c.fg }) --@function.call    ; function calls
	hl(0, "@function.macro", { fg = c.magenta }) --@function.macro   ; preprocessor macros

	hl(0, "@method", { fg = c.blue }) -- @method           ; method definitions
	hl(0, "@method.call", { fg = c.blue }) --@method.call      ; method calls

	hl(0, "@constructor", { fg = c.fg }) -- @constructor      ; constructor calls and definitions
	hl(0, "@parameter", { fg = c.red }) -- @parameter        ; parameters of a function
	-- treesitter keywords
	hl(0, "@keyword", { fg = c.cyan, italic = true }) --   @keyword             ; various keywords
	hl(0, "@keyword.coroutine", { fg = c.magenta }) -- @keyword.coroutine   ; keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
	hl(0, "@keyword.function", { fg = c.magenta }) --@keyword.function    ; keywords that define a function (e.g. `func` in Go, `def` in Python)
	hl(0, "@keyword.operator", { fg = c.magenta }) -- @keyword.operator    ; operators that are English words (e.g. `and` / `or`)
	hl(0, "@keyword.return", { fg = c.cyan, italic = true }) --@keyword.return      ; keywords like `return` and `yield`

	hl(0, "@conditional", { fg = c.cyan, italic = true }) -- @conditional         ; keywords related to conditionals (e.g. `if` / `else`)
	hl(0, "@conditional.ternary", { fg = c.magenta, italic = true }) -- @conditional.ternary ; ternary operator (e.g. `?` / `:`)

	hl(0, "@repeat", { fg = c.cyan, italic = true }) -- @repeat              ; keywords related to loops (e.g. `for` / `while`)
	hl(0, "@debug", { fg = c.fg }) -- @debug               ; keywords related to debugging
	hl(0, "@label", { fg = c.magenta }) -- @label               ; GOTO and other labels (e.g. `label:` in C)
	hl(0, "@include", { fg = c.cyan, italic = true }) -- @include             ; keywords for including modules (e.g. `import` / `from` in Python)
	hl(0, "exception", { fg = c.cyan, italic = true }) -- @exception           ; keywords related to exceptions (e.g. `throw` / `catch`)

	-- treesitter types
	hl(0, "@type", { fg = c.fg_dark }) -- @type            ; type or class definitions and annotations
	hl(0, "@type.builtin", { fg = c.fg_dark }) -- @type.builtin    ; built-in types
	hl(0, "@type.definition", { fg = c.fg }) -- @type.definition ; type definitions (e.g. `typedef` in C)
	hl(0, "@type.qualifier", { fg = c.magenta }) -- @type.qualifier  ; type qualifiers (e.g. `const`)
	--
	hl(0, "@storageclass", { fg = c.magenta }) -- @storageclass    ; modifiers that affect storage in memory or life-time
	hl(0, "@attribute", { fg = c.blue }) -- @attribute       ; attribute annotations (e.g. Python decorators)
	hl(0, "@field", { fg = c.fg }) -- @field           ; object and struct fields
	hl(0, "@property", { fg = c.fg_dark1 }) -- @property        ; similar to `@field`

	-- treesitter identifiers
	hl(0, "@variable", { fg = c.fg }) -- @variable         ; various variable names
	hl(0, "@variable.builtin", { fg = c.fg }) -- @variable.builtin ; built-in variable names (e.g. `this`)
	hl(0, "@constant", { fg = c.red }) -- @constant         ; constant identifiers
	hl(0, "@constant.builtin", { fg = c.orange }) -- @constant.builtin ; built-in constant values
	hl(0, "@constant.macro", { fg = c.orange }) -- @constant.macro   ; constants defined by the preprocessor
	--
	hl(0, "@namespace", { fg = c.blue }) -- @namespace        ; modules or namespaces
	hl(0, "@symbol", { fg = c.green }) -- @symbol           ; symbols or atoms

	-- treesitter text
	hl(0, "@text", { fg = c.fg }) -- @text                  ; non-structured text
	hl(0, "@text.strong", { fg = c.red }) -- @text.strong           ; bold text
	hl(0, "@text.emphasis", { fg = c.red }) -- @text.emphasis         ; text with emphasis
	hl(0, "@text.underline", { fg = c.orange }) -- @text.underline        ; underlined text
	hl(0, "@text.strike", { fg = c.fg }) -- @text.strike           ; strikethrough text
	hl(0, "@text.title", { fg = c.fg }) -- @text.title            ; text that is part of a title
	hl(0, "@text.title.3", { fg = c.yellow })
	--hl(0, "@text.quote", { fg = "#00ff00" }) -- @text.quote            ; text quotations
	hl(0, "@text.uri", { fg = c.orange }) -- @text.uri              ; URIs (e.g. hyperlinks)
	hl(0, "@text.math", { fg = c.yellow }) -- @text.math             ; math environments (e.g. `$ ... $` in LaTeX)
	--hl(0, "@spell", { fg = "#00ff00" }) -- @spell   ; for defining regions to be spellchecked
	--hl(0, "@nospell", { fg = c.red }) -- @nospell ; for defining regions that should NOT be spellchecked
	hl(0, "@text.environment", { fg = c.blue }) -- @text.environment      ; text environments of markup languages
	hl(0, "@text.environment.name", { fg = c.red }) -- @text.environment.name ; text indicating the type of an environment
	hl(0, "@text.reference", { fg = c.red }) -- @text.reference        ; text references, footnotes, citations, etc.

	hl(0, "@text.literal", { fg = c.fg_dark }) -- @text.literal          ; literal or verbatim text (e.g., inline code)
	hl(0, "@text.literal.block", { fg = c.disable }) -- @text.literal.block    ; literal or verbatim text as a stand-alone block
	--                        ; (use priority 90 for blocks with injections)

	hl(0, "@text.todo", { fg = c.green }) -- @text.todo             ; todo notes
	hl(0, "@text.note", { fg = c.blue }) -- @text.note             ; info notes
	hl(0, "@text.warning", { fg = c.yellow }) -- @text.warning          ; warning notes
	hl(0, "@text.danger", { fg = c.red }) -- @text.danger           ; danger/error notes
	--
	hl(0, "@text.diff.add", { link = "DiffAdd" }) -- @text.diff.add         ; added text (for diff files)
	hl(0, "@text.diff.delete", { link = "DiffDelete" }) -- @text.diff.delete      ; deleted text (for diff files)

	-- treesitter tags
	hl(0, "@tag", { fg = c.tag }) -- @tag           ; XML tag names
	hl(0, "@tag.attribute", { fg = c.magenta }) -- @tag.attribute ; XML tag attributes
	hl(0, "@tag.delimiter", { fg = c.cyan }) -- @tag.delimiter ; XML tag delimiters

	-- treesitter spell

	-- treesitter locals
	--hl(0, "@definition", { fg = "#00ff00" }) -- @definition            ; various definitions
	--hl(0, "@definition.function", { fg = "#ff00ff" }) -- @definition.function   ; functions
	-- @definition.constant   ; constants
	-- @definition.method     ; methods
	-- @definition.var        ; variables
	-- @definition.parameter  ; parameters
	-- @definition.macro      ; preprocessor macros
	-- @definition.type       ; types or classes
	-- @definition.field      ; fields or properties
	-- @definition.enum       ; enumerations
	-- @definition.namespace  ; modules or namespaces
	-- @definition.import     ; imported names
	-- @definition.associated ; the associated type of a variable
	--
	-- @scope                 ; scope block
	-- @reference             ; identifier reference
	-- languages
	--hl(0, "jsonString", { fg = "#00ff00" })

	-- lua
	hl(0, "luaCondStart", { fg = c.fg })
	hl(0, "luaFunc", { fg = c.blue })
	hl(0, "luaFunction", { fg = c.cyan })
	hl(0, "luaFunctionBlock", { fg = c.blue })
	hl(0, "luaParen", { fg = c.red })

	-- lsp

	-- LSP
	hl(0, "DiagnosticHint", { fg = c.magenta, bg = "NONE" })
	hl(0, "DiagnosticInfo", { fg = c.cyan, bg = "NONE" })
	hl(0, "DiagnosticWarn", { fg = c.yellow, bg = "NONE" })
	hl(0, "DiagnosticError", { fg = c.red, bg = "NONE" })
	hl(0, "DiagnosticOther", { fg = c.tag, bg = "NONE" })
	hl(0, "DiagnosticSignHint", { link = "DiagnosticHint" })
	hl(0, "DiagnosticSignInfo", { link = "DiagnosticInfo" })
	hl(0, "DiagnosticSignWarn", { link = "DiagnosticWarn" })
	hl(0, "DiagnosticSignError", { link = "DiagnosticError" })
	hl(0, "DiagnosticSignOther", { link = "DiagnosticOther" })
	hl(0, "DiagnosticSignWarning", { link = "DiagnosticWarn" })
	hl(0, "DiagnosticFloatingHint", { link = "DiagnosticHint" })
	hl(0, "DiagnosticFloatingInfo", { link = "DiagnosticInfo" })
	hl(0, "DiagnosticFloatingWarn", { link = "DiagnosticWarn" })
	hl(0, "DiagnosticFloatingError", { link = "DiagnosticError" })
	hl(0, "DiagnosticUnderlineHint", { fg = "NONE", bg = "NONE", sp = c.magenta, undercurl = true })
	hl(0, "DiagnosticUnderlineInfo", { fg = "NONE", bg = "NONE", sp = c.cyan, undercurl = true })
	hl(0, "DiagnosticUnderlineWarn", { fg = "NONE", bg = "NONE", sp = c.yellow, undercurl = true })
	hl(0, "DiagnosticUnderlineError", { fg = "NONE", bg = "NONE", sp = c.red, undercurl = true })
	hl(0, "DiagnosticSignInformation", { link = "DiagnosticInfo" })
	hl(0, "DiagnosticVirtualTextHint", { fg = c.magenta })
	hl(0, "DiagnosticVirtualTextInfo", { fg = c.cyan })
	hl(0, "DiagnosticVirtualTextWarn", { fg = c.yellow })
	hl(0, "DiagnosticVirtualTextError", { fg = c.red })
	hl(0, "LspDiagnosticsError", { fg = c.red, bg = "NONE" })
	hl(0, "LspDiagnosticsWarning", { fg = c.yellow, bg = "NONE" })
	hl(0, "LspDiagnosticsInfo", { fg = c.cyan, bg = "NONE" })
	hl(0, "LspDiagnosticsInformation", { link = "LspDiagnosticsInfo" })
	hl(0, "LspDiagnosticsHint", { fg = c.magenta, bg = "NONE" })
	hl(0, "LspDiagnosticsDefaultError", { link = "LspDiagnosticsError" })
	hl(0, "LspDiagnosticsDefaultWarning", { link = "LspDiagnosticsWarning" })
	hl(0, "LspDiagnosticsDefaultInformation", { link = "LspDiagnosticsInfo" })
	hl(0, "LspDiagnosticsDefaultInfo", { link = "LspDiagnosticsInfo" })
	hl(0, "LspDiagnosticsDefaultHint", { link = "LspDiagnosticsHint" })
	hl(0, "LspDiagnosticsVirtualTextError", { link = "DiagnosticVirtualTextError" })
	hl(0, "LspDiagnosticsVirtualTextWarning", { link = "DiagnosticVirtualTextWarn" })
	hl(0, "LspDiagnosticsVirtualTextInformation", { link = "DiagnosticVirtualTextInfo" })
	hl(0, "LspDiagnosticsVirtualTextInfo", { link = "DiagnosticVirtualTextInfo" })
	hl(0, "LspDiagnosticsVirtualTextHint", { link = "DiagnosticVirtualTextHint" })
	hl(0, "LspDiagnosticsFloatingError", { link = "LspDiagnosticsError" })
	hl(0, "LspDiagnosticsFloatingWarning", { link = "LspDiagnosticsWarning" })
	hl(0, "LspDiagnosticsFloatingInformation", { link = "LspDiagnosticsInfo" })
	hl(0, "LspDiagnosticsFloatingInfo", { link = "LspDiagnosticsInfo" })
	hl(0, "LspDiagnosticsFloatingHint", { link = "LspDiagnosticsHint" })
	hl(0, "LspDiagnosticsSignError", { link = "LspDiagnosticsError" })
	hl(0, "LspDiagnosticsSignWarning", { link = "LspDiagnosticsWarning" })
	hl(0, "LspDiagnosticsSignInformation", { link = "LspDiagnosticsInfo" })
	hl(0, "LspDiagnosticsSignInfo", { link = "LspDiagnosticsInfo" })
	hl(0, "LspDiagnosticsSignHint", { link = "LspDiagnosticsHint" })
	hl(0, "NvimTreeLspDiagnosticsError", { link = "LspDiagnosticsError" })
	hl(0, "NvimTreeLspDiagnosticsWarning", { link = "LspDiagnosticsWarning" })
	hl(0, "NvimTreeLspDiagnosticsInformation", { link = "LspDiagnosticsInfo" })
	hl(0, "NvimTreeLspDiagnosticsInfo", { link = "LspDiagnosticsInfo" })
	hl(0, "NvimTreeLspDiagnosticsHint", { link = "LspDiagnosticsHint" })
	hl(0, "LspDiagnosticsUnderlineError", { link = "DiagnosticUnderlineError" })
	hl(0, "LspDiagnosticsUnderlineWarning", { link = "DiagnosticUnderlineWarn" })
	hl(0, "LspDiagnosticsUnderlineInformation", { link = "DiagnosticUnderlineInfo" })
	hl(0, "LspDiagnosticsUnderlineInfo", { link = "DiagnosticUnderlineInfo" })
	hl(0, "LspDiagnosticsUnderlineHint", { link = "DiagnosticUnderlineHint" })
	hl(0, "LspReferenceRead", { fg = "NONE" })
	hl(0, "LspReferenceText", { fg = "NONE" })
	hl(0, "LspReferenceWrite", { fg = "NONE" })
	hl(0, "IlluminatedWordRead", { link = "LspReferenceRead" })
	hl(0, "IlluminatedWordText", { link = "LspReferenceText" })
	hl(0, "IlluminatedWordWrite", { link = "LspReferenceWrite" })
	hl(0, "LspCodeLens", { fg = c.active2, bg = "NONE", italic = true })
	hl(0, "LspCodeLensSeparator", { fg = c.active2, bg = "NONE", italic = true })

	-- NvimTree
	hl(0, "NvimTreeFolderIcon", { fg = c.folder })
	hl(0, "NvimTreeIndentMarker", { fg = c.context, bg = "NONE" })
	hl(0, "NvimTreeNormal", { fg = c.active2, bg = c.none })
	hl(0, "NvimTreeVertSplit", { fg = c.active2, bg = c.none })
	hl(0, "NvimTreeWinSeparator", { fg = c.active, bg = c.none })
	hl(0, "NvimTreeFolderName", { fg = c.active2 })
	hl(0, "NvimTreeOpenedFolderName", { fg = c.cyan, bg = "NONE", bold = false, italic = false })
	hl(0, "NvimTreeEmptyFolderName", { fg = c.active2, bg = "NONE", italic = false })
	hl(0, "NvimTreeGitIgnored", { fg = c.gray, bg = "NONE", italic = true })
	hl(0, "NvimTreeImageFile", { fg = c.cyan, bg = "NONE" })
	hl(0, "NvimTreeSpecialFile", { fg = c.active2, bg = "NONE" })
	hl(0, "NvimTreeEndOfBuffer", { fg = c.active2, bg = "NONE" })
	hl(0, "NvimTreeCursorLine", { fg = "NONE", bg = c.select })
	hl(0, "NvimTreeRootFolder", { fg = c.fg, bg = "NONE", bold = true })
	hl(0, "NvimTreeExecFile", { fg = "#9FBA89", bg = "NONE" })

	-- notifications (notify)
	hl(0, "NotifyBackground", { bg = c.bg })
	hl(0, "NotifyERRORBorder", { fg = c.active, bg = "NONE" })
	hl(0, "NotifyWARNBorder", { fg = c.active, bg = "NONE" })
	hl(0, "NotifyINFOBorder", { fg = c.active, bg = "NONE" })
	hl(0, "NotifyDEBUGBorder", { fg = c.active, bg = "NONE" })
	hl(0, "NotifyTRACEBorder", { fg = c.active, bg = "NONE" })
	hl(0, "NotifyERRORIcon", { fg = c.red, bg = "NONE" })
	hl(0, "NotifyWARNIcon", { fg = c.yellow, bg = "NONE" })
	hl(0, "NotifyINFOIcon", { fg = c.blue, bg = "NONE" })
	hl(0, "NotifyDEBUGIcon", { fg = c.magenta, bg = "NONE" })
	hl(0, "NotifyTRACEIcon", { fg = c.magenta, bg = "NONE" })
	hl(0, "NotifyERRORTitle", { fg = c.red, bg = "NONE" })
	hl(0, "NotifyWARNTitle", { fg = c.yellow, bg = "NONE" })
	hl(0, "NotifyINFOTitle", { fg = c.blue, bg = "NONE" })
	hl(0, "NotifyDEBUGTitle", { fg = c.magenta, bg = "NONE" })
	hl(0, "NotifyTRACETitle", { fg = c.magenta, bg = "NONE" })

	-- noice
	hl(0, "NoiceCmdline", { fg = c.fg, bg = c.none })
	hl(0, "NoiceCmdlineIcon", { fg = c.fg, bg = c.none })
	hl(0, "NoiceCmdlineIconLua", { fg = c.blue })
	hl(0, "NoiceCmdlinePopup", { fg = c.fg, bg = c.none })
	hl(0, "NoiceCmdlinePopupBorder", { fg = c.active, bg = c.none })
	hl(0, "NoiceCmdlinePopupTitle", { fg = c.active })
	hl(0, "NoiceCmdlinePrompt", { fg = c.fg, bg = c.none })
	hl(0, "NoiceConfirm", { fg = c.fg, bg = c.none })
	hl(0, "NoiceConfirmBorder", { bg = c.none })
	hl(0, "NoiceLspProgressSpinner", { fg = c.fg, bg = c.bg })
	hl(0, "NoiceLspProgressClient", { fg = c.fg, bg = c.bg })
	hl(0, "NoiceLspProgressTitle", { fg = c.blue, bg = c.bg })
	hl(0, "NoicePopup", { fg = c.fg, bg = c.bg })
	hl(0, "NoiceMini", { fg = c.fg, bg = c.bg })
	hl(0, "NoicePopupBorder", { fg = c.active, bg = c.bg })
	hl(0, "NoicePopupmenu", { fg = c.cyan, bg = c.bg })
	hl(0, "NoicePopupmenuBorder", { fg = c.active, bg = c.bg })
	hl(0, "NoicePopupmenuMatch", { fg = c.cyan, bg = c.bg })
	hl(0, "NoicePopupmenuSelected", { fg = c.cyan, bg = c.select })
	hl(0, "NoiceScrollbar", { fg = c.active, bg = c.bg })
	hl(0, "NoiceSplit", { fg = c.active, bg = c.bg })
	hl(0, "NoiceSplitBorder", { fg = c.active, bg = c.bg })
	hl(0, "NoiceVirtualText", { fg = c.blue, bg = c.bg })

	-- indentline
	hl(0, "IndentBlanklineChar", { fg = c.active })
	hl(0, "IndentBlanklineContextChar", { fg = c.disable })

	-- Telescope
	hl(0, "TelescopeNormal", { fg = c.comment })
	hl(0, "TelescopeBorder", { fg = c.active })
	hl(0, "TelescopePromptBorder", { fg = c.active })
	hl(0, "TelescopePromptTitle", { fg = c.comment })
	hl(0, "TelescopePromptCounter", { fg = c.bg })
	hl(0, "TelescopeSelection", { fg = c.cyan, bg = c.select })
	hl(0, "TelescopeMatching", { fg = c.cyan })
end

require("core.themes.community-material-theme.plugins.treesitter")

return theme
