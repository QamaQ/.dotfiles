local M = {
  "LazyVim/LazyVim",
}

M.opts = {
	colorscheme = "material-darker",
	icons = {
  	misc = {
    	Dots = "󰇘",
			Telescope = "",
			ArrowClosed = "",
			ArrowOpen = "",
			Lock = " ",
			Circle = "󰧞",
			BigCircle = " ",
			BigUnfilledCircle = " ",
			Close = "",
			NewFile = " ",
			Search = " ",
			Lightbulb = " ",
			Project = " ",
			Dashboard = " ",
			History = " ",
			Comment = " ",
			Bug = " ",
			Code = " ",
			Gear = " ",
			Package = " ",
			List = " ",
			SignIn = " ",
			SignOut = " ",
			NoteBook = " ",
			Check = " ",
			Fire = " ",
			Note = " ",
			BookMark = " ",
			Pencil = " ",
			ChevronRight = "",
			Table = " ",
			Calendar = " ",
			CloudDownload = " ",
			lineVertical = "│",
			lineVerticalLeft = "▏",
			Help = "󰋖",
			Folder = "󰉋",
			FolderOpen = "",
			EmptyOpen = "",
			Empty = "",
			Term = "",
			Atom = "󰹻",
  	},
  	dap = {
    	Stopped             = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
    	Breakpoint          = " ",
    	BreakpointCondition = " ",
    	BreakpointRejected  = { " ", "DiagnosticError" },
    	LogPoint            = ".>",
  	},
  	diagnostics = {
    	Error = " ",
    	Warn  = " ",
    	Hint  = " ",
    	Info  = " ",
  	},
  	git = {
    		added    = " ",
    		modified = " ",
    		removed  = " ",
  	},
  	kinds = {
			Array         = " ",
			Boolean       = "󰨙 ",
			Class         = " ",
			Codeium       = "󰘦 ",
			Color         = " ",
			Control       = " ",
			Collapsed     = " ",
			Constant      = "󰏿 ",
			Constructor   = " ",
			Copilot       = " ",
			Enum          = " ",
			EnumMember    = " ",
			Event         = " ",
			Field         = " ",
			File          = " ",
			Folder        = " ",
			Function      = "󰊕 ",
			Interface     = " ",
			Key           = " ",
			Keyword       = " ",
			Method        = "󰊕 ",
			Module        = " ",
			Namespace     = "󰦮 ",
			Null          = " ",
			Number        = "󰎠 ",
			Object        = " ",
			Operator      = " ",
			Package       = " ",
			Property      = " ",
			Reference     = " ",
			Snippet       = " ",
			String        = " ",
			Struct        = "󰆼 ",
			TabNine       = "󰏚 ",
			Text          = " ",
			TypeParameter = " ",
			Unit          = " ",
			Value         = " ",
			Variable      = "󰀫 ",
  	},
  }
}
return M
