local cmd = vim.cmd

cmd [[
  augroup Neoformat
    autocmd!
    autocmd BufWritePre * undojoin | Neoformat
  augroup END
]]


