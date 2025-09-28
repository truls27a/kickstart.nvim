-- [[ Custom Keymaps ]]
-- Your personal keybinding configurations

-- Press jk quickly to return to Normal mode
-- Works in Insert, Visual, and Select mode
vim.keymap.set({ 'i', 'v', 's' }, 'jk', '<Esc>', { desc = 'Exit → Normal', silent = true })

-- In terminal buffers, jk leaves terminal-insert and enters Normal mode
vim.keymap.set('t', 'jk', [[<C-\><C-n>]], { desc = 'Terminal: exit to Normal', silent = true })

-- Toggle file sidebar
vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<CR>', { desc = 'Toggle Neo-tree' })

-- Open new terminal
vim.keymap.set('n', '<leader>t', function()
  vim.cmd 'terminal'
end, { desc = 'Open new terminal' })

-- Bufferline navigation
vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })

-- Buffer management
vim.keymap.set('n', '<leader>bp', '<cmd>bdelete<CR>', { desc = 'Close buffer' })
vim.keymap.set('n', '<leader>bP', '<cmd>BufferLineCloseOthers<CR>', { desc = 'Close other buffers' })
vim.keymap.set('n', '<leader>ba', '<cmd>%bdelete|edit#|bdelete#<CR>', { desc = 'Close all buffers' })
vim.keymap.set('n', '<leader>bl', '<cmd>BufferLineCloseLeft<CR>', { desc = 'Close buffers to left' })
vim.keymap.set('n', '<leader>br', '<cmd>BufferLineCloseRight<CR>', { desc = 'Close buffers to right' })

-- Buffer rearrangement
vim.keymap.set('n', '<leader>bmh', '<cmd>BufferLineMovePrev<CR>', { desc = 'Move buffer left' })
vim.keymap.set('n', '<leader>bml', '<cmd>BufferLineMoveNext<CR>', { desc = 'Move buffer right' })

-- Jump to buffer by position
vim.keymap.set('n', '<leader>1', '<cmd>BufferLineGoToBuffer 1<CR>', { desc = 'Go to buffer 1' })
vim.keymap.set('n', '<leader>2', '<cmd>BufferLineGoToBuffer 2<CR>', { desc = 'Go to buffer 2' })
vim.keymap.set('n', '<leader>3', '<cmd>BufferLineGoToBuffer 3<CR>', { desc = 'Go to buffer 3' })
vim.keymap.set('n', '<leader>4', '<cmd>BufferLineGoToBuffer 4<CR>', { desc = 'Go to buffer 4' })
vim.keymap.set('n', '<leader>5', '<cmd>BufferLineGoToBuffer 5<CR>', { desc = 'Go to buffer 5' })
vim.keymap.set('n', '<leader>6', '<cmd>BufferLineGoToBuffer 6<CR>', { desc = 'Go to buffer 6' })
vim.keymap.set('n', '<leader>7', '<cmd>BufferLineGoToBuffer 7<CR>', { desc = 'Go to buffer 7' })
vim.keymap.set('n', '<leader>8', '<cmd>BufferLineGoToBuffer 8<CR>', { desc = 'Go to buffer 8' })
vim.keymap.set('n', '<leader>9', '<cmd>BufferLineGoToBuffer 9<CR>', { desc = 'Go to buffer 9' })
vim.keymap.set('n', '<leader>$', '<cmd>BufferLineGoToBuffer -1<CR>', { desc = 'Go to last buffer' })
