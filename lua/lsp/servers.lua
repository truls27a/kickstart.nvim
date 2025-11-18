-- Register all LSP servers with mason-lspconfig

local M = {}

M.setup = function()
  -- Setup mason-lspconfig with ensure_installed
  require('mason-lspconfig').setup {
    ensure_installed = {
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
    },
    automatic_installation = false,
  }

  -- Enable LSP servers (Neovim 0.11+ way)
  vim.lsp.enable {
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
    'sourcekit',
  }
end

return M
