return {
  "Bekaboo/dropbar.nvim",
  event = { "BufReadPost", "BufNewFile" },
  cond = not vim.g.started_by_firenvim,
  config = function()
    local icons = require("core.icons")
    local sources = require("dropbar.sources")
    local utils = require("dropbar.utils")

    local function file_only()
      return {
        get_symbols = function(buf, win, cursor)
          local syms = sources.path.get_symbols(buf, win, cursor)
          if #syms > 0 then
            return { syms[#syms] }
          end
          return {}
        end,
      }
    end

    require("dropbar").setup({
      icons = {
        kinds = {
          symbols = require("core.icons.dropbar"),
        },
        ui = {
          bar = {
            separator = " " .. icons.arrow.right_tall .. " ",
          },
        },
      },
      sources = {
        treesitter = {
          valid_types = { "call", "function" },
        },
      },
      bar = {
        sources = function(buf, _)
          if vim.bo[buf].ft == "markdown" then
            return { file_only(), sources.markdown }
          end
          if vim.bo[buf].buftype == "terminal" then
            return {}
          end
          return {
            file_only(),
            utils.source.fallback({ sources.lsp, sources.treesitter }),
          }
        end,
      },
    })

    local dropbar_api = require("dropbar.api")
    vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
    vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of context" })
    vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
  end,
}
