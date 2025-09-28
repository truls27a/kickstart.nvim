return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  -- NOTE: Remove the line below to enable bufferline
  enabled = false,
  config = function()
    vim.opt.termguicolors = true
    require('bufferline').setup {
      options = {
        mode = 'buffers',
        separator_style = 'slant',
        always_show_bufferline = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        color_icons = true,
        diagnostics = 'nvim_lsp',
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match 'error' and ' ' or ' '
          return ' ' .. icon .. count
        end,
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'File Explorer',
            text_align = 'left',
            separator = true,
          },
        },
        hover = {
          enabled = true,
          delay = 200,
          reveal = { 'close' },
        },
      },
    }
  end,
}

