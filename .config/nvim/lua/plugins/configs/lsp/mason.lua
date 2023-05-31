local mason = require("mason")

local options = {

  ui = {
    icons = {
      package_pending = " ",
      package_installed = "󰄳 ",
      package_uninstalled = " 󰚌",
    },
  },
}

mason.setup({
  ui = options.ui,
})
