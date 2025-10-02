-- [[ Custom Autocommands ]]
-- Your personal autocommand configurations

-- Auto-reload files changed outside of Neovim
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
  command = 'checktime',
  desc = 'Reload files changed outside of Neovim',
})
