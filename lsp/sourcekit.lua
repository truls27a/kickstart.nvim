return {
  cmd = { 'xcrun', 'sourcekit-lsp' },
  filetypes = { 'swift', 'objective-c', 'objective-cpp' },
  root_markers = { 'Package.swift', '.git', '*.xcodeproj', '*.xcworkspace' },
  init_options = {
    ['compilation-db-search-path'] = {
      vim.fn.expand('~/Library/Developer/Xcode/DerivedData'),
    },
  },
}
