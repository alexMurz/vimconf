-- Map leader key
vim.g.mapleader = " "

-- Map project keys
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex) -- TODO Better remap

-- Move selected block
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv', { desc = "Move selected lines down" })
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv', { desc = "Move selected lines up" })

-- Rename symbol under cursor in current buffer
-- Like LSP rename, but when LSP is not available
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "[S]ubstitute word under cursor" })

vim.opt.whichwrap:append "<>[]hl"

