require 'telescope'.setup({
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    pickers = {
        find_files = {
            theme = "dropdown",
        },
        live_grep = {
            theme = "dropdown",
            --            find_command = { "rg" },
        }
    }
})
pcall(require('telescope').load_extension, 'fzf')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "[F]ind in [F]iles" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "[F]ind using [g]rep" })
vim.keymap.set('n', '<leader>fG', builtin.git_files, { desc = "[F]ind in [G]it repository" })
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = "[F]ind in [R]ecently opened files" })
vim.keymap.set('n', '<leader>?', function()
    builtin.current_buffer_fuzzy_find(require 'telescope.themes'.get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = "[?] Find in current buffer" })

vim.keymap.set('n', '<leader>ft', require('telescope.builtin').builtin, { desc = '[F]ind in [T]elescope' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[F]ind in [H]elp' })

