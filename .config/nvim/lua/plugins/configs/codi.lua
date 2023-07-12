return {
  "metakirby5/codi.vim",
  config = function()
    vim.cmd [[
      let g:codi#autocmd ='None'
      let g:codi#virtual_text_pos = "eol"
      let g:codi#virtual_text_prefix = " "
    ]]
  end,
}
