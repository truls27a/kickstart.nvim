return {
  'echasnovski/mini.nvim',
  config = function()
    -- Better text objects (around/inside)
    require('mini.ai').setup({ n_lines = 500 })

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    require('mini.surround').setup()

    -- Simple statusline
    local statusline = require('mini.statusline')
    statusline.setup({ use_icons = vim.g.have_nerd_font })

    -- Customize statusline location to show line:column
    statusline.section_location = function()
      return '%2l:%-2v'
    end
  end,
}
