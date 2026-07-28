return {
  "kosayoda/nvim-lightbulb",
  event = "LspAttach",
  opts = {
    priority = 10,
    hide_in_unfocused_buffer = true,
    link_highlights = true,
    action_kinds = nil,
    sign = { enabled = false },
    virtual_text = { enabled = false },
    float = { enabled = false },
    status_text = {
      enabled = true,
      text = require("core.icons").lightbulb,
      text_unavailable = "",
    },
    number = { enabled = false },
    line = { enabled = false },
    autocmd = {
      enabled = true,
      updatetime = 100,
      events = { "CursorHold", "CursorHoldI" },
      pattern = { "*" },
    },
    ignore = {
      clients = {},
      ft = {},
      actions_without_kind = false,
    },
  },
}
