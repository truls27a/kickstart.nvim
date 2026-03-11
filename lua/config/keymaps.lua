-- Exit to normal mode with jk (insert, visual, select modes)
vim.keymap.set({ 'i', 'v', 's' }, 'jk', '<Esc>', { desc = 'Exit to normal mode' })

-- Exit terminal mode with escape
vim.keymap.set('t', 'jk', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Clear search highlights on <Esc>
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })

-- Save file
vim.keymap.set('n', '<C-s>', '<cmd>w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save file' })

-- Navigate between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to upper window' })

-- Named terminal
vim.keymap.set('n', '<leader>t', function()
  vim.cmd('terminal')
  local buf = vim.api.nvim_get_current_buf()
  vim.schedule(function()
    vim.ui.input({ prompt = 'Terminal name (optional): ' }, function(name)
      if name and name ~= '' then
        local base = 'term:' .. name
        local final = base
        local n = 1
        while vim.fn.bufnr(final) ~= -1 and vim.fn.bufnr(final) ~= buf do
          n = n + 1
          final = base .. '(' .. n .. ')'
        end
        vim.api.nvim_buf_set_name(buf, final)
      end
      vim.cmd('startinsert')
    end)
  end)
end, { desc = 'New [T]erminal' })

-- Diagnostic quickfix list
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
