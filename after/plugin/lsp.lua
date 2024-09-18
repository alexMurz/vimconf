local lspz = require 'lsp-zero'

require 'mason'.setup({})
require 'mason-lspconfig'.setup({
    handlers = {
        lspz.default_setup
    },
})

-- zig config
require 'lspconfig'.zls.setup{
    cmd = { "zls" },
}

-- wgsl config
require 'lspconfig'.wgsl_analyzer.setup{
    cmd = { "wgsl-analyzer" },
    filetypes = { "wgsl" },
}

local function template(tmpl)
    return function(table)
        local result = {}
        for key, value in pairs(tmpl) do
            result[key] = value
        end

        if table then
            for key, value in pairs(table) do
                result[key] = value
            end
        end
        return result
    end
end

-- Keymaps
lspz.on_attach(function(client, bufnr)
    local opts = template { buffer = bufnr, remap = false }
    -- Jump to definition
    vim.keymap.set('n', '<leader>ld', function() vim.lsp.buf.definition() end, opts { desc = '[l]sp [d]efinitions' })
    -- Hover
    vim.keymap.set('n', '<leader>ll', function() vim.lsp.buf.hover() end, opts { desc = '[l]sp hover' })
    vim.keymap.set({ 'n', 'i' }, '<C-l>', function() vim.lsp.buf.hover() end, opts { desc = 'Lsp Hover' })
    -- Diagnostics (Show warnings)
    vim.keymap.set("n", "<leader>lw", function() vim.diagnostic.open_float() end, opts { desc = '[l]sp [w]arnings' })

    -- Show code actions
    vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, opts { desc = '[l]sp [a]ctions' })

    -- Show references (like in intellij C-b
    vim.keymap.set("n", "<leader>lb", function() vim.lsp.buf.references() end, opts { desc = '[l]sp references' })
    vim.keymap.set("n", "<C-b>", function() vim.lsp.buf.references() end, opts { desc = 'Lsp References' })

    -- Rename symbol under cursor
    vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, opts { desc = '[l]sp [r]ename' })

    -- Format document (only if formatters available)
    vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format() end, opts { desc = '[l]sp [f]ormat document' })

    -- Signature help
    vim.keymap.set("n", "<leader>lp", function() vim.lsp.buf.signature_help() end, opts { desc = '[l]sp signature' })
    vim.keymap.set({ "n", "i" }, "<C-h>", function() vim.lsp.buf.signature_help() end, opts { desc = 'Lsp Signature' })
end)

-- Completion configuration
local cmp = require 'cmp'
cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        --		['<C-Space>'] = cmp.mapping.complete(),
        --		['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping.select_next_item({ behaviour = 'select' }),
        ['<S-Tab>'] = cmp.mapping.select_prev_item({ behaviour = 'select' }),
        --		['<Esc>'] = cmp.mapping.abort(),
    })
})
