local ui = require 'harpoon.ui'
local mark = require 'harpoon.mark'

local function bind(key, action, desc)
    vim.keymap.set('n', '<leader>h' .. key, action, { desc = desc })
end

bind('h', ui.toggle_quick_menu, '[h]arpoon toggle menu')
bind('a', mark.add_file, '[h]arpoon [a]dd file')

vim.keymap.set('n', '<C-+>', ui.nav_prev, { remap = true, desc = 'harpoon prev' })
vim.keymap.set('n', '<C-=>', ui.nav_next, { remap = true, desc = 'harpoon next' })

for i = 1, 9 do
    local fn = function() ui.nav_file(i) end
    local tg = tostring(i)
    bind(tg, fn, '[h]arpoon navigate to [' .. i .. ']')
    vim.keymap.set('n', '<C-' .. tg .. '>', fn, { remap = true, desc = 'harpoon navigate to [' .. i .. ']' })
end
