local icons = require("core.icons")

return {
  'nvim-telescope/telescope.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- optional but recommended
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },

  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>",  desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>",   desc = "Live grep" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>",     desc = "Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>",   desc = "Help tags" },
    { "<leader>fw", "<cmd>Telescope grep_string<CR>", desc = "Grep word" },
    { "<leader>fo", "<cmd>Telescope oldfiles<CR>",    desc = "Recent files" },
    { "<leader>fk", "<cmd>Telescope keymaps<CR>",     desc = "Keymaps" },
    { "<leader>fC", "<cmd>Telescope commands<CR>",    desc = "Commands" },
    { "<leader>fr", "<cmd>Telescope resume<CR>",      desc = "Resume" },
    { "<leader>fd", "<cmd>Telescope diagnostics<CR>", desc = "Diagnostics" },
    {
      "<leader>fe",
      "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>",
      desc = "File browser",
    },
    {
      "<leader>fE",
      "<cmd>Telescope file_browser<CR>",
      desc = "File browser (cwd)",
    },
    {
      "<C-p>",
      "<cmd>Telescope find_files<CR>",
      desc = "Find files",
    },
  },
  config = function()

    require("telescope").setup({
      defaults = {
        prompt_prefix = " " .. icons.lupa .. " ",
        selection_caret = " " .. icons.arrow.right_short .. " ",
      },
    })
  end,
}
