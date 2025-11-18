-- Register all LSP servers with mason-lspconfig

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'j-hui/fidget.nvim',
    'saghen/blink.cmp',
  },
  config = function()
    local lsp_config = require('lsp')

    -- Setup mason-lspconfig
    require('mason-lspconfig').setup({
      handlers = {
        -- Default handler for all servers
        function(server_name)
          require('lspconfig')[server_name].setup({
            capabilities = lsp_config.capabilities,
            on_attach = lsp_config.on_attach,
          })
        end,

        -- Custom handlers for servers with specific settings
        ['rust_analyzer'] = function()
          local settings = require('lsp.settings.rust_analyzer')
          require('lspconfig').rust_analyzer.setup({
            capabilities = lsp_config.capabilities,
            on_attach = lsp_config.on_attach,
            settings = settings,
          })
        end,

        ['ts_ls'] = function()
          local settings = require('lsp.settings.ts_ls')
          require('lspconfig').ts_ls.setup({
            capabilities = lsp_config.capabilities,
            on_attach = lsp_config.on_attach,
            settings = settings,
          })
        end,

        ['jsonls'] = function()
          local settings = require('lsp.settings.jsonls')
          require('lspconfig').jsonls.setup({
            capabilities = lsp_config.capabilities,
            on_attach = lsp_config.on_attach,
            settings = settings,
          })
        end,

        ['yamlls'] = function()
          local settings = require('lsp.settings.yamlls')
          require('lspconfig').yamlls.setup({
            capabilities = lsp_config.capabilities,
            on_attach = lsp_config.on_attach,
            settings = settings,
          })
        end,

        ['html'] = function()
          local settings = require('lsp.settings.html')
          require('lspconfig').html.setup({
            capabilities = lsp_config.capabilities,
            on_attach = lsp_config.on_attach,
            filetypes = settings.filetypes,
          })
        end,

        ['tailwindcss'] = function()
          local settings = require('lsp.settings.tailwindcss')
          require('lspconfig').tailwindcss.setup({
            capabilities = lsp_config.capabilities,
            on_attach = lsp_config.on_attach,
            filetypes = settings.filetypes,
          })
        end,

        ['eslint'] = function()
          local settings = require('lsp.settings.eslint')
          require('lspconfig').eslint.setup({
            capabilities = lsp_config.capabilities,
            on_attach = lsp_config.on_attach,
            settings = settings,
          })
        end,

        ['lua_ls'] = function()
          local settings = require('lsp.settings.lua_ls')
          require('lspconfig').lua_ls.setup({
            capabilities = lsp_config.capabilities,
            on_attach = lsp_config.on_attach,
            settings = settings,
          })
        end,

        ['basedpyright'] = function()
          local settings = require('lsp.settings.basedpyright')
          require('lspconfig').basedpyright.setup({
            capabilities = lsp_config.capabilities,
            on_attach = lsp_config.on_attach,
            root_dir = settings.root_dir,
            settings = settings.settings,
          })
        end,

        ['sourcekit'] = function()
          local settings = require('lsp.settings.sourcekit')
          require('lspconfig').sourcekit.setup({
            capabilities = lsp_config.capabilities,
            on_attach = lsp_config.on_attach,
            cmd = settings.cmd,
            root_dir = settings.root_dir,
          })
        end,
      },
    })
  end,
}
