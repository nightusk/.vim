local config_dir = vim.fn.stdpath('config')
local vimrc = config_dir .. '/vimrc'
if vim.fn.filereadable(vimrc) == 1 then
  vim.cmd('source ' .. vimrc)
end
vim.opt.shadafile = vim.fn.stdpath('config') .. '/shada'

vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
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

vim.opt.completeopt = { "menuone", "noselect", "popup" }
local function lsp_on_attach(client, bufnr)
  vim.lsp.completion.enable(true, client.id, bufnr, {
    autotrigger = true,
    convert = function(item)
      return { abbr = item.label:gsub('%b()', '') }
    end,
  })
end
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client then
      lsp_on_attach(client, ev.buf)
    end
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', 'gn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = ev.buf,
      callback = function()
        vim.lsp.buf.format({
          bufnr = ev.buf,
        })
      end,
    })
  end,
})

vim.diagnostic.config({
  jump = {
    on_jump = function(_, bufnr)
      vim.diagnostic.open_float({ bufnr = bufnr, scope = 'cursor', focus = false })
    end,
  },
  virtual_text = true,
})

vim.lsp.enable('lua_ls')
