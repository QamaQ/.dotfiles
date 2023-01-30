local status_ok, notify = pcall(require, "notify")
if not status_ok then
  return
end

local status_nonicons, nonicons_extention = pcall(require, "nvim-nonicons.extentions.nvim-notify")
if not status_nonicons then
  return
end

notify.setup{
  stages = "fade_in_slide_out",
  on_open = nil,
  on_close = nil,
  render = "default",
  icons = nonicons_extention.icons,

  background_colour = "#000000",
}

vim.notify = notify

local notify_filter = vim.notify
vim.notify = function(msg, ...)
  if msg:match "character_offset must be called" then
    return
  end
  if msg:match "method textDocument" then
    return
  end
  notify_filter(msg, ...)
end

