local lspconfig = require('lspconfig')

return {
  cmd = { 'xcrun', 'sourcekit-lsp' },
  root_dir = lspconfig.util.root_pattern('Package.swift', '.git', 'buildServer.json'),
}
