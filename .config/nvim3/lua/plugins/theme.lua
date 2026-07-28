return {
  "serhez/teide.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("teide").setup({
      style = "darker",

      on_colors = function(colors)
        colors.bg = "#0A0A0A"
        colors.fg = "#EEFFFF"
        colors.bg_darker = "#0A0A0A"
        colors.bg_float = "#090909"
        colors.bg_popup = "#090909"
        colors.bg_sidebar = "#090909"
        colors.bg_statusline = "#090909"
      end
    })
    vim.cmd.colorscheme("teide")
    require("config.highlights").setup()
  end,
}
