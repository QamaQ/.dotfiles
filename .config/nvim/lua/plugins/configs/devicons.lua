return {
  "nvim-tree/nvim-web-devicons", -- optional
  opts = function()
    return { override = require("core.icons").devicons }
  end,
  config = function(_, opts)
    require("nvim-web-devicons").setup(opts)
  end,
}
