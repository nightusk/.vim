local config_dir = vim.fn.stdpath('config')
local vimrc = config_dir .. '/vimrc'
if vim.fn.filereadable(vimrc) == 1 then
  vim.cmd('source ' .. vimrc)
end
vim.opt.shadafile = vim.fn.stdpath('config') .. '/shada'
