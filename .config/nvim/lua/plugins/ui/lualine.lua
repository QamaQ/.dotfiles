local M = {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = " "
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,
}
function M.opts()
	local lualine_require = require("lualine_require")
  lualine_require.require = require
  vim.o.laststatus = vim.g.lualine_laststatus

	local colors = require("material.colors")

  local highligh = { fg = colors.editor.line_numbers, bg = colors.editor.bg }

	local icons = require("plugins.core").opts.icons
	local util = require("lazyvim.util")

	local mode = {
		'mode',
		fmt = function(str) return str:sub(1,1) end,
		-- color = { fg = colors.syntax.comments, bg = colors.editor.bg }
		color = highligh
	}
	local branch = {
		"branch",
		icon = "󰘬",
		-- color = { fg = colors.syntax.comments, bg = colors.editor.bg }
		color = highligh
	}
	local diff = {
		"diff",
		colored = false,
		color = highligh,
		symbols = {
			added = icons.git.added,
			modified = icons.git.modified,
			removed = icons.git.removed
		}
	}

	local filetype = {
    function()
      local filetype = vim.bo.filetype
      local upper_case_filetypes = {
        "json",
        "jsonc",
        "yaml",
        "toml",
        "css",
        "scss",
        "html",
        "xml",
      }

      -- if vim.tbl_contains(upper_case_filetypes, filetype) then
       -- return filetype:upper()
      --end

      return filetype
    end,
		color = highligh
  }


	return {
		options = {
      theme = "auto",
			component_separators = { left = ' ', right = ' ' },
  		section_separators = { left =  ' ', right = ' ' },
      globalstatus = true,
      disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
			ignore_focus = { "NvimTree", "Trouble" },
    },
		sections = {
			--lualine_a = { mode },
      lualine_a = { branch, diff},
			lualine_b = { },
			lualine_c = {
				util.lualine.root_dir({ cwd = true, icon = " ", color = highligh }),
				{ "filetype", colored = false, icon_only = true, color = highligh,  separator = "", padding = { left = 1, right = -4 } },
        { util.lualine.pretty_path({ modified_hl = "LineNr", directory_hl = "LineNr", filename_hl = "LineNr", modified_sign = icons.misc.Circle, color = highligh }) },
        {
        	"diagnostics",
					colored = false,
					symbols = {
						error = icons.diagnostics.Error,
						warn = icons.diagnostics.Warn,
						info = icons.diagnostics.Info,
						hint = icons.diagnostics.Hint
					},
          color = highligh,
        },
			},
			lualine_x = {
				-- {
        --   function() return require("noice").api.status.mode.get() end,
        --   cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
        --   color = highligh
        -- },
				-- stylua: ignore
        {
          function() return require("noice").api.status.command.get() end,
          cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
          color = highligh,
        },

        -- stylua: ignore
        {
          function() return "  " .. require("dap").status() end,
          cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
          color = highligh,
        },
			},
			lualine_y = {
				{ "encoding", color = highligh },
				filetype
			},
			lualine_z = {
				{ "location", color = highligh },
			}
		},
		--extensions = { "neo-tree", "lazy" },

	}
end

return M
