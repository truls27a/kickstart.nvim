-- GitHub Copilot
-- https://github.com/github/copilot.vim

return {
  'github/copilot.vim',
  config = function()
    -- Disable default Tab mapping
    vim.g.copilot_no_tab_map = true

    -- Map Ctrl+y to accept suggestion (vim-like)
    vim.keymap.set('i', '<C-y>', 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false,
      desc = 'Accept Copilot suggestion'
    })
  end,
}
