require('flutter-tools').setup {
    lsp = {
        on_attach = function(client, bufnr)
            vim.opt.tabstop = 2
            vim.opt.softtabstop = 2
            vim.opt.shiftwidth = 2
            vim.keymap.set('n', '<leader>pb', function()
                require('telescope').extensions.flutter.commands()
            end, { buffer = bufnr, remap = false, desc = '[p]roject [b]uild' })
        end,
    }
}
