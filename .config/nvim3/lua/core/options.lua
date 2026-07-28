vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.hidden = true
vim.opt.updatetime = 250
vim.opt.signcolumn = "yes"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.cursorline = false
vim.opt.scrolloff = 8
vim.o.cmdheight = 0


-- require('vim._core.ui2').enable({
--
--   enable = false, -- Whether to enable or disable the UI.
--   msg = {        -- Options related to the message module.
--     ---@type 'cmd'|'msg' Default message target, either in the
--     ---cmdline or in a separate ephemeral message window.
--     ---@type string|table<string, 'cmd'|'msg'|'pager'> Default message target
--     ---or table mapping |ui-messages| kinds and triggers to a target.
--     targets = 'cmd',
--     cmd = {        -- Options related to messages in the cmdline window.
--       height = 0.5 -- Maximum height while expanded for messages beyond 'cmdheight'.
--     },
--     dialog = {      -- Options related to dialog window.
--       height = 0.5, -- Maximum height.
--     },
--     msg = {           -- Options related to msg window.
--       height = 0.5,   -- Maximum height.
--       timeout = 4000, -- Time a message is visible in the message window.
--     },
--     pager = {     -- Options related to message window.
--       height = 1, -- Maximum height.
--     },
--
--   },
--
-- })
