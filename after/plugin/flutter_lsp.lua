require('flutter-tools').setup {
    lsp = {
        on_attach = function(client, bufnr)
            vim.keymap.set('n', '<leader>pb', function()
                require('telescope').extensions.flutter.commands()
            end, { buffer = bufnr, remap = false, desc = '[p]roject [b]uild' })
            print("attach")
        end,
    }
}
