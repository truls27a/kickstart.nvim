return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    require('mason').setup()

    -- Auto-install LSP servers and tools
    require('mason-tool-installer').setup({
      ensure_installed = {
        -- LSP servers
        'rust_analyzer',
        'ts_ls',
        'bashls',
        'jsonls',
        'yamlls',
        'marksman',
        'html',
        'cssls',
        'tailwindcss',
        'eslint',
        'lua_ls',
        'taplo',
        'basedpyright',

        -- Formatters
        'stylua',
        'black',
        'isort',
        'prettier',
      },
    })
  end,
}
