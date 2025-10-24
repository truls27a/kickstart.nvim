-- Harpoon 2 - Quick file navigation
-- https://github.com/ThePrimeagen/harpoon/tree/harpoon2

return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    -- File list keybindings
    vim.keymap.set('n', '<leader>fa', function()
      harpoon:list('files'):add()
    end, { desc = 'Harpoon: Add to files list' })

    vim.keymap.set('n', '<leader>fr', function()
      harpoon:list('files'):remove()
    end, { desc = 'Harpoon: Remove from files list' })

    vim.keymap.set('n', '<leader>fh', function()
      harpoon.ui:toggle_quick_menu(harpoon:list 'files')
    end, { desc = 'Harpoon: Toggle files menu' })

    -- Navigate to specific files
    vim.keymap.set('n', '<leader>f1', function()
      harpoon:list('files'):select(1)
    end, { desc = 'Harpoon: Go to file 1' })

    vim.keymap.set('n', '<leader>f2', function()
      harpoon:list('files'):select(2)
    end, { desc = 'Harpoon: Go to file 2' })

    vim.keymap.set('n', '<leader>f3', function()
      harpoon:list('files'):select(3)
    end, { desc = 'Harpoon: Go to file 3' })

    vim.keymap.set('n', '<leader>f4', function()
      harpoon:list('files'):select(4)
    end, { desc = 'Harpoon: Go to file 4' })

    vim.keymap.set('n', '<leader>f5', function()
      harpoon:list('files'):select(5)
    end, { desc = 'Harpoon: Go to file 5' })

    -- Navigate to previous/next file in files list
    vim.keymap.set('n', '<leader>fp', function()
      harpoon:list('files'):prev()
    end, { desc = 'Harpoon: Previous file' })

    vim.keymap.set('n', '<leader>fn', function()
      harpoon:list('files'):next()
    end, { desc = 'Harpoon: Next file' })

    -- Terminal list keybindings
    vim.keymap.set('n', '<leader>ta', function()
      harpoon:list('terminals'):add()
    end, { desc = 'Harpoon: Add to terminals list' })

    vim.keymap.set('n', '<leader>tr', function()
      harpoon:list('terminals'):remove()
    end, { desc = 'Harpoon: Remove from terminals list' })

    vim.keymap.set('n', '<leader>th', function()
      harpoon.ui:toggle_quick_menu(harpoon:list 'terminals')
    end, { desc = 'Harpoon: Toggle terminals menu' })

    -- Navigate to specific terminals
    vim.keymap.set('n', '<leader>t1', function()
      harpoon:list('terminals'):select(1)
    end, { desc = 'Harpoon: Go to terminal 1' })

    vim.keymap.set('n', '<leader>t2', function()
      harpoon:list('terminals'):select(2)
    end, { desc = 'Harpoon: Go to terminal 2' })

    vim.keymap.set('n', '<leader>t3', function()
      harpoon:list('terminals'):select(3)
    end, { desc = 'Harpoon: Go to terminal 3' })

    vim.keymap.set('n', '<leader>t4', function()
      harpoon:list('terminals'):select(4)
    end, { desc = 'Harpoon: Go to terminal 4' })

    vim.keymap.set('n', '<leader>t5', function()
      harpoon:list('terminals'):select(5)
    end, { desc = 'Harpoon: Go to terminal 5' })

    -- Navigate to previous/next terminal in terminals list
    vim.keymap.set('n', '<leader>tp', function()
      harpoon:list('terminals'):prev()
    end, { desc = 'Harpoon: Previous terminal' })

    vim.keymap.set('n', '<leader>tn', function()
      harpoon:list('terminals'):next()
    end, { desc = 'Harpoon: Next terminal' })
  end,
}
