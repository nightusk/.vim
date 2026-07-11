local config_dir = vim.fn.stdpath('config')
local vimrc = config_dir .. '/vimrc'
if vim.fn.filereadable(vimrc) == 1 then
  vim.cmd('source ' .. vimrc)
end
vim.opt.shadafile = vim.fn.stdpath('config') .. '/shada'

vim.pack.add({
  "https://github.com/vim-denops/denops.vim.git",
  "https://github.com/vim-skk/skkeleton.git", -- depends on denops.vim
})

vim.api.nvim_create_autocmd("User", {
  pattern = "skkeleton-initialize-pre",
  callback = function()
    vim.fn["skkeleton#config"]({
      globalDictionaries = { "/usr/share/skk/SKK-JISYO.L" },
      eggLikeNewline = true,
      showCandidatesCount = 0,
    })
  end,
})

vim.keymap.set("i", "<C-\\>", "<Plug>(skkeleton-toggle)")
