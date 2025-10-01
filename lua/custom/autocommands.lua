-- [[ Custom Autocommands ]]
-- Your personal autocommand configurations

-- Auto-reload files changed outside of Neovim
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
  command = 'checktime',
  desc = 'Reload files changed outside of Neovim',
})

-- Auto save
vim.api.nvim_create_autocmd({ 'InsertLeave', 'TextChanged', 'FocusLost', 'BufLeave' }, {
  group = vim.api.nvim_create_augroup('custom-autosave', { clear = true }),
  desc = 'Auto save on edit/blur',
  callback = function(args)
    local buf = args.buf
    -- Only write real, modifiable files that have changes
    if
      vim.bo[buf].buftype == '' -- normal file buffer
      and vim.bo[buf].modifiable
      and not vim.bo[buf].readonly
      and vim.api.nvim_buf_get_name(buf) ~= ''
      and vim.bo[buf].modified
    then
      require('conform').format({ buf = buf, timeout_ms = 1000 })
      vim.cmd 'silent! write'
    end
  end,
})