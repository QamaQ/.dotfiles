local icons = require("core.icons")

local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  cond = not vim.g.started_by_firenvim and not vim.g.vscode and not vim.g.slow_network,
}

vim.g.lualine_show_filetype = false

local mini_files_extension = {
  sections = {
    lualine_a = {
      function()
        local ok, mini_files = pcall(require, "mini.files")
        if ok then
          local entry = mini_files.get_fs_entry()
          local path = vim.fn.fnamemodify(entry.path, ":.")
          -- Remove the last element (the filename, after the last "/")
          path = path:match("(.+)/[^/]+$") or path
          return path
        else
          return ""
        end
      end,
    },
  },
  filetypes = { "minifiles" },
}

local function canola_url()
  local ok, canola = pcall(require, "canola")
  if ok then
    return canola.get_current_url(0) or vim.api.nvim_buf_get_name(0)
  end

  return vim.api.nvim_buf_get_name(0)
end

local function canola_remote_parts()
  return require("utils").canola_ssh_location(canola_url())
end

local function canola_is_remote()
  return canola_remote_parts() ~= nil
end

local function canola_remote_machine()
  local machine = canola_remote_parts()
  return require("utils").statusline_escape(machine or "")
end

local function canola_remote_path()
  local _, path = canola_remote_parts()
  return ": " .. require("utils").statusline_escape(path or "")
end

local function canola_local_location()
  local ok, canola = pcall(require, "canola")
  if not ok then
    return ""
  end

  local dir = canola.get_current_dir()
  local location = dir and vim.fn.fnamemodify(dir, ":~") or vim.api.nvim_buf_get_name(0)
  return require("utils").statusline_escape(location)
end

local function remote_parent_path(path)
  if path == "~" or path == "/" then
    return path
  end

  local parent = path:match("(.+)/[^/]+$")
  if parent then
    return parent
  end

  if path:sub(1, 1) == "/" then
    return "/"
  end

  return path
end

local function remote_folder_display(path)
  if path == "/" then
    return "/"
  end
  if path == "~" then
    return "~/"
  end
  return path .. "/"
end

local canola_extension = {
  sections = {
    lualine_a = {
      {
        canola_remote_machine,
        cond = canola_is_remote,
        color = { gui = "bold" },
        separator = "",
        padding = { left = 1, right = 0 },
      },
      {
        canola_remote_path,
        cond = canola_is_remote,
        separator = "",
        padding = { left = 0, right = 1 },
      },
      {
        canola_local_location,
        cond = function()
          return not canola_is_remote()
        end,
      },
    },
  },
  filetypes = { "canola" },
}

local function open_explorer()
  local minifiles_present, _ = pcall(require, "mini.files")
  local oil_present, _ = pcall(require, "oil")
  local canola_present, _ = pcall(require, "canola")
  if minifiles_present then
    vim.cmd("MiniFiles")
  elseif oil_present then
    vim.cmd("Oil")
  elseif canola_present then
    vim.cmd("Canola")
  end
end

function M.toggle_filetype()
  vim.g.lualine_show_filetype = not vim.g.lualine_show_filetype
end

local function venv_provider()
  if vim.g.active_venv == nil or vim.g.active_venv == "" or vim.g.active_venv == "base" then
    return ""
  end

  return icons.tool.venv .. " " .. vim.g.active_venv
end

local function kernel_provider()
  if package.loaded.molten then
    local present, molten_status = pcall(require, "molten.status")
    if present and molten_status.initialized() == "Molten" then
      local kernels = molten_status.kernels()

      if kernels == nil or kernels == "" then
        return ""
      end

      return icons.tool.kernel .. " " .. kernels
    end
  end

  return ""
end

local function pinned_provider()
  return icons.pin_location
end

local function pinned_condition()
  local hbac_present, hbac = pcall(require, "hbac.state")
  if hbac_present then
    return hbac.is_pinned(vim.api.nvim_get_current_buf())
  end
  local grapple_present, grapple = pcall(require, "grapple")
  if not grapple_present then
    return false
  end
  return grapple.exists()
end

local function recorder_provider()
  return icons.camera .. " Rec"
end

local function recorder_condition()
  local present, recorder = pcall(require, "recorder")
  if not present then
    return false
  end
  return recorder.recordingStatus() ~= ""
end

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

function M.init()
  vim.keymap.set("n", "<leader>kf", "<cmd>lua require('plugins.lualine').toggle_filetype()<cr>",
    { desc = "Toggle filetype" })
end

function M.config()
  local hls = require("config.highlights")
  local colors = hls.colors()

  local folders_component = require("lualine.components.filename"):extend()
  local filename_component = require("lualine.components.filename"):extend()

  local function git_branches_on_click()
    local ok, snacks = pcall(require, "snacks")
    if ok then
      return function() snacks.picker.git_branches() end
    end
    local fzf_ok, fzf = pcall(require, "fzf-lua")
    if fzf_ok then
      return function() fzf.git_branches() end
    end
    return function() end
  end

  do -- folders_component
    function folders_component:init(options)
      folders_component.super.init(self, options)
      vim.api.nvim_set_hl(0, "LualineFoldersSaved", { link = "lualine_c_inactive" })
      vim.api.nvim_set_hl(0, "LualineFoldersModified", { link = "lualine_c_inactive" })
      vim.api.nvim_set_hl(0, "LualineRemoteMachineSaved", {
        fg = hls.fromhl("StatusLine").fg,
        bg = hls.fromhl("StatusLine").bg,
        bold = true,
      })
      vim.api.nvim_set_hl(0, "LualineRemoteMachineModified", {
        fg = hls.fromhl("DiagnosticWarn").fg,
        bold = true,
      })
      if self.options.color == nil then self.options.color = "" end
    end

    function folders_component:update_status()
      local data = folders_component.super.update_status(self)
      local utils = require("utils")
      local raw_bufname = vim.api.nvim_buf_get_name(0)
      local machine, remote_path = utils.remote_ssh_location(raw_bufname)
      if not machine then
        machine, remote_path = utils.remote_ssh_location(data)
      end
      if machine then
        local machine_hl = vim.bo.modified and "LualineRemoteMachineModified" or "LualineRemoteMachineSaved"
        local folder_hl = vim.bo.modified and "LualineFoldersModified" or "LualineFoldersSaved"
        local parent = remote_folder_display(remote_parent_path(remote_path))
        return table.concat({
          "%#", machine_hl, "#", utils.statusline_escape(machine),
          "%#", folder_hl, "#: ", utils.statusline_escape(parent),
        })
      end

      data = data:gsub("^/+", "")
      if data == "" or not data:find("/") then return "" end
      if data:find("term://") then return "Terminal: " end
      if data:find("minifiles://") then return "File explorer: " end
      if raw_bufname:find("ssh://") or raw_bufname:find("scp://") or data:find("ssh://") or data:find("scp://") then
        return "Remote: "
      end

      data = data:match("(.+)/[^/]+$") or data
      data = data:gsub("/", " " .. icons.arrow.right_tall .. " " .. icons.folder.default .. " ")
      data = icons.folder.default .. " " .. data .. " " .. icons.arrow.right_tall
      data = "%#" .. (vim.bo.modified and "LualineFoldersModified" or "LualineFoldersSaved") .. "#" .. data
      return data
    end
  end

  do -- filename_component
    function filename_component:init(options)
      filename_component.super.init(self, options)
      vim.api.nvim_set_hl(0, "LualineFileNameSaved", {
        fg = hls.fromhl("StatusLine").fg, bg = hls.fromhl("StatusLine").bg, bold = true,
      })
      vim.api.nvim_set_hl(0, "LualineFileNameModified", {
        fg = hls.fromhl("DiagnosticWarn").fg, bold = true,
      })
      if self.options.color == nil then self.options.color = "" end
    end

    function filename_component:update_status()
      local data = filename_component.super.update_status(self)
      data = "%#" .. (vim.bo.modified and "LualineFileNameModified" or "LualineFileNameSaved") .. "#" .. data
      return data
    end
  end

  local custom_ftype = require("lualine.components.filetype"):extend()
  do -- custom_ftype
    function custom_ftype:init(options)
      custom_ftype.super.init(self, options)
      vim.api.nvim_set_hl(0, "LualineFileTypeSaved", { link = "StatusLine" })
      vim.api.nvim_set_hl(0, "LualineFileTypeModified", { link = "StatusLine" })
      if self.options.color == nil then self.options.color = "" end
    end
  end

  require("lualine").setup({
    options = {
      icons_enabled = true,
      theme = "auto",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = {
          "dap-repl", "dapui_scopes", "dapui_stacks", "dapui_watches",
          "dapui_repl", "LspTrouble", "qf", "NvimTree", "vista_kind",
          "dashboard", "startify",
        },
        winbar = { "*" },
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = true,
      refresh = { statusline = 100, tabline = 100, winbar = 100 },
    },
    sections = {
      lualine_a = {
        { "branch", icon = icons.git.branch, on_click = git_branches_on_click() },
      },
      lualine_b = {
        {
          venv_provider,
          cond = function()
            return vim.g.active_venv ~= nil and vim.g.active_venv ~= "" and vim.g.active_venv ~= "base"
          end,
          on_click = function() vim.cmd("lua require('swenv.api').pick_venv()") end,
        },
        { kernel_provider },
        {
          "diff",
          colored = true,
          padding = { left = 0, right = 1 },
          diff_color = {
            added = "DiffAdded", modified = "DiffChanged", removed = "DiffRemoved",
          },
          symbols = {
            added = " " .. icons.git.added .. " ",
            modified = " " .. icons.git.changed .. " ",
            removed = " " .. icons.git.removed .. " ",
          },
          source = diff_source,
          on_click = function() vim.cmd("CodeDiff") end,
        },
      },
      lualine_c = {
        {
          pinned_provider,
          cond = pinned_condition,
          padding = { left = 1, right = 1 },
          color = { fg = colors.red },
          on_click = open_explorer,
        },
        {
          folders_component,
          file_status = false,
          newfile_status = false,
          path = 1,
          padding = { left = 1, right = 0 },
          shorting_target = 75,
          symbols = {
            modified = icons.small_circle,
            readonly = icons.lock,
            unnamed = " [No name]",
            newfile = " [New]",
          },
          on_click = open_explorer,
        },
        {
          custom_ftype,
          icon_only = true,
          separator = "",
          padding = { left = 1, right = 0 },
          on_click = open_explorer,
        },
        {
          filename_component,
          file_status = false,
          newfile_status = false,
          path = 0,
          padding = { left = 0, right = 1 },
          shorting_target = 125,
          color = { bold = true },
          symbols = {
            modified = icons.small_circle,
            readonly = icons.lock,
            unnamed = " [No name]",
            newfile = " [New]",
          },
          on_click = open_explorer,
        },
      },
      lualine_x = {
        {
          require("noice").api.status.mode.get,
          cond = require("noice").api.status.mode.has,
          color = { fg = "#ff9e64" },
        },
        {
          require("noice").api.status.command.get,
          cond = require("noice").api.status.command.has,
          color = { fg = "#ff9e64" },
        },
      },
      lualine_y = {
        {
          function() return require("nvim-lightbulb").get_status_text() end,
          color = "DiagnosticVirtualTextInfo",
        },
        {
          "diagnostics",
          -- sources = { "nvim_lsp" },
          sources = { 'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp' },
          sections = { "error", "warn", "info", "hint" },
          diagnostics_color = {
            error = "DiagnosticVirtualTextError",
            warn = "DiagnosticVirtualTextWarn",
            info = "DiagnosticVirtualTextInfo",
            hint = "DiagnosticVirtualTextHint",
          },
          symbols = {
            error = icons.diagnostics.error .. " ",
            warn = icons.diagnostics.warning .. " ",
            info = icons.diagnostics.info .. " ",
            hint = icons.diagnostics.hint .. " ",
          },
          colored = true,
          update_in_insert = true,
          always_visible = false,
          on_click = function() vim.cmd("Trouble diagnostics toggle filter.buf=0") end,
        },
        {
          "lsp_status",
          icon = "",
          symbols = {
            spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
            done = "✓",
            separator = " ",
          },
          ignore_lsp = {},
          show_name = true,
        },
      },
      lualine_z = {
        { "location" },
        { "progress" },
        {
          "tabs",
          use_mode_colors = true,
          show_modified_status = false,
          mode = 1,
          fmt = function(_, context)
            return context.current and icons.circle or icons.empty_circle
          end,
        },
      },
    },
    inactive_sections = {
      lualine_c = { "filename" },
      lualine_x = { "location" },
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    -- extensions = {
    --   "lazy", "mason", "neo-tree", "nvim-dap-ui", "oil", "quickfix",
    --   "symbols-outline", "toggleterm", "trouble",
    --   canola_extension, mini_files_extension,
    -- },
  })
end

return M
