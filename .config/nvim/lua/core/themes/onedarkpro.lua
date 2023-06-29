require("onedarkpro").setup({
  colors = {
    onedark = {
      bg = "#212121" -- yellow
    },
  },
  styles = {
    types = "NONE",
    methods = "NONE",
    numbers = "NONE",
    strings = "NONE",
    comments = "italic",
    keywords = "bold,italic",
    constants = "NONE",
    functions = "italic",
    operators = "NONE",
    variables = "NONE",
    parameters = "NONE",
    conditionals = "italic",
    virtual_text = "NONE",
  }
})

vim.cmd("colorscheme onedark")
