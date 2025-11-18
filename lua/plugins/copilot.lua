return {
  'github/copilot.vim',
  config = function()
    -- Accept suggestion with Ctrl-y
    vim.keymap.set('i', '<C-y>', 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false,
      desc = 'Copilot accept suggestion',
    })
    vim.g.copilot_no_tab_map = true

    -- Dismiss suggestion with Ctrl-e
    vim.keymap.set('i', '<C-e>', '<Plug>(copilot-dismiss)', { desc = 'Copilot dismiss suggestion' })
  end,
}
