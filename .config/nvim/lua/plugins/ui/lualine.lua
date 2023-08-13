return {
	"nvim-lualine/lualine.nvim",
	event = { "VeryLazy" },
	config = function()
		local M = {}
		local lualine = require("lualine")
		local colorscheme = require("colorscheme")
		local colors = colorscheme.colors
		local icons = require("core.icons")

		local mode = {
			"mode",
			color = { fg = colors.st_fg },
			padding = { left = 1, right = 1 },
		}

		local fileInfo = {
			"filetype",
			fmt = function(str)
				local icon = "󰈚"
				local filename = (vim.fn.expand("%") == "" and "Empty ") or vim.fn.expand("%:t")

				if filename ~= "Empty " then
					local devicons_present, devicons = pcall(require, "nvim-web-devicons")

					if devicons_present then
						local ft_icon = devicons.get_icon(filename)
						icon = (ft_icon ~= nil and "" .. ft_icon) or ""
					end

					filename = filename
				end
				if str == "TelescopePrompt" then
					return icons.ui.Telescope
				end
				local function get_term_num()
					local t_status_ok, toggle_num = pcall(vim.api.nvim_buf_get_var, 0, "toggle_number")
					if not t_status_ok then
						return ""
					end
					return toggle_num
				end

				if str == "toggleterm" then
					return icons.ui.Term
				end

				if str == "NvimTree" then
					return icons.ui.Folder .. " "
				end
				return icon .. " " .. filename
			end,
			color = function()
				return { fg = colors.st_fg }
			end,
			icons_enabled = false,
			padding = { left = 1, right = 1 },
		}

		local branch = {
			"branch",
			icon = icons.lualine.branch,
			color = { fg = colors.magenta },
			padding = 1,
		}
		local diff = {
			"diff",
			symbols = {
				added = icons.diff.added .. " ",
				modified = icons.diff.modified .. " ",
				removed = icons.diff.removed .. " ",
			},
			padding = 0,
		}

		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			symbols = {
				error = icons.diagnostic.error .. " ",
				warn = icons.diagnostic.warn .. " ",
				info = icons.diagnostic.info .. " ",
				hint = icons.diagnostic.hint .. " ",
			},
			update_in_insert = true,
			padding = 1,
		}
		-- check if value in table
		local function contains(t, value)
			for _, v in pairs(t) do
				if v == value then
					return true
				end
			end
			return false
		end

		local lanuage_server = {
			function()
				local buf_ft = vim.bo.filetype
				local ui_filetypes = {
					"help",
					"packer",
					"neogitstatus",
					"NvimTree",
					"Trouble",
					"lir",
					"Outline",
					"spectre_panel",
					"toggleterm",
					"DressingSelect",
					"TelescopePrompt",
					"lspinfo",
					"lsp-installer",
					"",
				}

				if contains(ui_filetypes, buf_ft) then
					if M.language_servers == nil then
						return ""
					else
						return M.language_servers
					end
				end

				local clients = vim.lsp.buf_get_clients()
				-- local clients = vim.lsp.get_active_clients()
				local client_names = {}
				local copilot_active = false

				-- add client
				for _, client in pairs(clients) do
					if client.name ~= "copilot" and client.name ~= "null-ls" then
						table.insert(client_names, client.name)
					end
					if client.name == "copilot" then
						copilot_active = true
					end
				end

				-- add formatter
				local s = require("null-ls.sources")
				local available_sources = s.get_available(buf_ft)
				local registered = {}
				for _, source in ipairs(available_sources) do
					for method in pairs(source.methods) do
						registered[method] = registered[method] or {}
						table.insert(registered[method], source.name)
					end
				end

				local formatter = registered["NULL_LS_FORMATTING"]
				local linter = registered["NULL_LS_DIAGNOSTICS"]
				if formatter ~= nil then
					vim.list_extend(client_names, formatter)
				end
				if linter ~= nil then
					vim.list_extend(client_names, linter)
				end

				-- join client names with commas
				local client_names_str = table.concat(client_names, ", ")
				-- local client_names_str = table.pack(client_names, ", ")

				-- check client_names_str if empty
				local language_servers = ""
				local client_names_str_len = #client_names_str
				if client_names_str_len ~= 0 then
					-- language_servers = hl_str("", "SLSep") .. hl_str(client_names_str, "SLSeparator") .. hl_str("", "SLSep")
					language_servers = icons.lualine.lsp_icon .. "LSP ~ " .. client_names_str
				end
				-- if copilot_active then
				--     language_servers = language_servers .. "%#SLCopilot#" .. " " .. icons.icons.neotree.git.unmerged .. "%*"
				-- end

				if client_names_str_len == 0 and not copilot_active then
					return ""
				else
					M.language_servers = language_servers
					return language_servers:gsub(", anonymous source", "")
				end
			end,
			padding = { left = 1, right = 1 },
			color = { fg = colors.st_fg, gui = "italic" },
			-- cond = hide_in_width,
			-- separator = "%#SLSeparator#" .. " │" .. "%*",
		}
		local progress = {
			"progress",
			color = { fg = colors.st_fg },
		}

		local config = {
			options = {
				globalstatus = true,
				icons_enabled = true,
				theme = colorscheme.statusline,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				always_divide_middle = true,
				disabled_filetypes = {
					statusline = {
						"dashboard",
						"alpha",
					},
				},
			},
			sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { mode, fileInfo, branch, diff },
				lualine_x = { diagnostics, lanuage_server, progress },
				lualine_y = {},
				lualine_z = {},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = { "toggleterm" },
		}

		lualine.setup(config)
		return config
	end,
}
