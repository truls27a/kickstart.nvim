-- [[ Custom Keymaps ]]
-- Your personal keybinding configurations

-- Press jk quickly to return to Normal mode
-- Works in Insert, Visual, and Select mode
vim.keymap.set({ 'i', 'v', 's' }, 'jk', '<Esc>', { desc = 'Exit → Normal', silent = true })

-- In terminal buffers, jk leaves terminal-insert and enters Normal mode
vim.keymap.set('t', 'jk', [[<C-\><C-n>]], { desc = 'Terminal: exit to Normal', silent = true })

-- Toggle file sidebar
vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<CR>', { desc = 'Toggle Neo-tree' })

-- Terminals
vim.keymap.set('n', '<leader>tt', function()
  vim.cmd 'terminal'
end, { desc = 'Terminal (here)' })
vim.keymap.set('n', '<leader>ts', function()
  vim.cmd 'split | terminal'
end, { desc = 'Terminal (split)' })
vim.keymap.set('n', '<leader>tv', function()
  vim.cmd 'vsplit | terminal'
end, { desc = 'Terminal (vsplit)' })
vim.keymap.set('n', '<leader>tb', function()
  vim.cmd 'tabnew | terminal'
end, { desc = 'Terminal (tab)' })