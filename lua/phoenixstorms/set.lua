
vim.opt.nu = true -- Line numbers
vim.opt.relativenumber = true -- Relative line numbers

vim.opt.tabstop = 4 -- Tab size
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.hlsearch = false -- No highlight search
vim.opt.incsearch = true -- Incremental search 

vim.o.undofile = true

vim.opt.scrolloff = 8 -- 8 lines scroll buffer
vim.opt.signcolumn = 'yes'

vim.o.completeopt = 'menuone,noselect'

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.opt.updatetime = 50

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

