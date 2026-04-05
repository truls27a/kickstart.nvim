return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<leader>e', '<cmd>Neotree toggle<CR>', desc = 'Toggle [E]xplorer (Neo-tree)' },
  },
  opts = {
    open_files_do_not_replace_types = { 'trouble', 'qf' },
    window = {
      position = 'left',
      width = 35,
    },
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
}
