-- [[ Custom Keymaps ]]
-- Your personal keybinding configurations

-- Press jk quickly to return to Normal mode
-- Works in Insert, Visual, and Select mode
vim.keymap.set({ 'i', 'v', 's' }, 'jk', '<Esc>', { desc = 'Exit → Normal', silent = true })

-- In terminal buffers, jk leaves terminal-insert and enters Normal mode
vim.keymap.set('t', 'jk', [[<C-\><C-n>]], { desc = 'Terminal: exit to Normal', silent = true })

-- Save file
vim.keymap.set('n', '<C-s>', '<cmd>w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save file' })

-- Open new terminal
vim.keymap.set('n', '<leader>t', function()
  vim.cmd 'terminal'
end, { desc = 'Open new terminal' })
