-- Highlight yanked text briefly
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Auto-reload files changed outside Neovim
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
  desc = 'Auto-reload files when changed externally',
  group = vim.api.nvim_create_augroup('auto-reload', { clear = true }),
  callback = function()
    if vim.fn.mode() ~= 'c' then
      vim.cmd('checktime')
    end
  end,
})

-- Terminal: enable line numbers, disable signcolumn
vim.api.nvim_create_autocmd('TermOpen', {
  desc = 'Configure terminal buffers',
  group = vim.api.nvim_create_augroup('term-config', { clear = true }),
  callback = function()
    vim.opt_local.number = true
    vim.opt_local.relativenumber = true
    vim.opt_local.signcolumn = 'no'
  end,
})

