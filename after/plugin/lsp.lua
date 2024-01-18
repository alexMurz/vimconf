local lspz = require 'lsp-zero'

require 'mason'.setup({})
require 'mason-lspconfig'.setup({
	handlers = {
		lspz.default_setup
	},
})

-- Keymaps
lspz.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	-- Jump to definition
	vim.keymap.set('n', '<leader>ld', function() vim.lsp.buf.definition() end, opts)
	-- Hover
	vim.keymap.set('n', '<leader>ll', function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set({'n', 'i'}, '<C-l>', function() vim.lsp.buf.hover() end, opts)
	-- Diagnostics (Show warnings) 
	vim.keymap.set("n", "<leader>lw", function() vim.diagnostic.open_float() end, opts)

	-- Show code actions
	vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, opts)

	-- Show references (like in intellij C-b
  	vim.keymap.set("n", "<leader>lb", function() vim.lsp.buf.references() end, opts)
  	vim.keymap.set("n", "<C-b>", function() vim.lsp.buf.references() end, opts)

	-- Rename symbol under cursor
  	vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, opts)

	-- Signature help
	vim.keymap.set("n", "<leader>lp", function() vim.lsp.buf.signature_help() end, opts)
	vim.keymap.set({"n", "i"}, "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

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
