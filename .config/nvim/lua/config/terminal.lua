local M = {}

local state = {
  buf = nil,
  win = nil,
}

M.buf = nil

function M.open()
  if state.win and vim.api.nvim_win_is_valid(state.win) then
    vim.api.nvim_set_current_win(state.win)
    return
  end

  if state.buf and vim.api.nvim_buf_is_valid(state.buf) then
    vim.cmd("botright split")
    state.win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(state.win, state.buf)
    vim.api.nvim_win_set_height(state.win, math.floor(vim.o.lines * 0.3))
    vim.cmd("startinsert")
    return
  end

  state.buf = vim.api.nvim_create_buf(false, true)
  M.buf = state.buf

  vim.cmd("botright split")
  state.win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_buf(state.win, state.buf)
  vim.api.nvim_win_set_height(state.win, math.floor(vim.o.lines * 0.3))
  vim.cmd("terminal")
  vim.cmd("startinsert")
end

function M.close()
  if state.win and vim.api.nvim_win_is_valid(state.win) then
    vim.api.nvim_win_close(state.win, true)
    state.win = nil
  end
end

function M.toggle()
  if state.win and vim.api.nvim_win_is_valid(state.win) then
    M.close()
  else
    M.open()
  end
end

function M.send(cmd)
  if state.buf and vim.api.nvim_buf_is_valid(state.buf) then
    local channels = vim.bo[state.buf].channel
    if channels and channels > 0 then
      vim.api.nvim_chan_send(channels, cmd .. "\n")
    end
  end
end

return M
