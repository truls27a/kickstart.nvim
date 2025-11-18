return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require('harpoon')
    harpoon:setup()

    -- File keymaps
    vim.keymap.set('n', '<leader>fa', function()
      harpoon:list():add()
    end, { desc = 'Harpoon [F]ile [A]dd' })

    vim.keymap.set('n', '<leader>fr', function()
      harpoon:list():remove()
    end, { desc = 'Harpoon [F]ile [R]emove' })

    vim.keymap.set('n', '<leader>fh', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Harpoon [F]ile [H]arpoon menu' })

    -- Navigate to files 1-5
    for i = 1, 5 do
      vim.keymap.set('n', '<leader>f' .. i, function()
        harpoon:list():select(i)
      end, { desc = 'Harpoon [F]ile ' .. i })
    end

    vim.keymap.set('n', '<leader>fp', function()
      harpoon:list():prev()
    end, { desc = 'Harpoon [F]ile [P]revious' })

    vim.keymap.set('n', '<leader>fn', function()
      harpoon:list():next()
    end, { desc = 'Harpoon [F]ile [N]ext' })

    -- Terminal keymaps
    local term_harpoon = require('harpoon'):list('term')

    vim.keymap.set('n', '<leader>ta', function()
      term_harpoon:add()
    end, { desc = 'Harpoon [T]erminal [A]dd' })

    vim.keymap.set('n', '<leader>tr', function()
      term_harpoon:remove()
    end, { desc = 'Harpoon [T]erminal [R]emove' })

    vim.keymap.set('n', '<leader>th', function()
      harpoon.ui:toggle_quick_menu(term_harpoon)
    end, { desc = 'Harpoon [T]erminal [H]arpoon menu' })

    -- Navigate to terminals 1-5
    for i = 1, 5 do
      vim.keymap.set('n', '<leader>t' .. i, function()
        term_harpoon:select(i)
      end, { desc = 'Harpoon [T]erminal ' .. i })
    end

    vim.keymap.set('n', '<leader>tp', function()
      term_harpoon:prev()
    end, { desc = 'Harpoon [T]erminal [P]revious' })

    vim.keymap.set('n', '<leader>tn', function()
      term_harpoon:next()
    end, { desc = 'Harpoon [T]erminal [N]ext' })
  end,
}
