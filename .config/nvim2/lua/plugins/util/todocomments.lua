return {
  "folke/todo-comments.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    signs = false,
  },
  keys = {
    { "<leader>st", "<cmd>TodoTrouble<CR>", desc = "Todo Comments (Trouble)" },
    { "<leader>sT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<CR>", desc = "Todo/Fix/Fixme" },
    { "]t", function() require("todo-comments").jump_next() end, desc = "Siguiente todo comment" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Anterior todo comment" },
  },
}
