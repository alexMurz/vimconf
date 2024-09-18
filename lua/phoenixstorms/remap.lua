-- Map leader key
vim.g.mapleader = " "

-- Map project keys
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = '[p]roject [v]iew' }) -- TODO Better remap

-- Keep cursor centered while paging
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "{", "{zz");
vim.keymap.set("n", "}", "}zz");

-- Move selected block
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv', { desc = "Move selected lines down" })
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv', { desc = "Move selected lines up" })

-- Rename symbol under cursor in current buffer
-- Like LSP rename, but when LSP is not available
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "[S]ubstitute word under cursor" })

-- bootstrap for build command on <leader>pb
local build_bootstrap = function()
    local f = vim.fn.input("Enter build command: ")
    local command = function()
        vim.api.nvim_command('split term://'..f)
    end
    vim.keymap.set('n', '<leader>pb', command, { desc = '[p]roject [b]uild (' .. f .. ')' })
end

vim.keymap.set('n', '<leader>pb', build_bootstrap, { desc = '[p]roject [b]uild (bootstrap)' })
vim.keymap.set('n', '<leader>pB', build_bootstrap, { desc = '[p]roject [b]uild (bootstrap)' })

vim.opt.whichwrap:append "<>[]hl"

