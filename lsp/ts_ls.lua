return {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
  settings = {
    typescript = {
      preferences = {
        includePackageJsonAutoImports = 'auto',
      },
      suggest = {
        autoImports = true,
      },
    },
    javascript = {
      suggest = {
        autoImports = true,
      },
    },
  },
}
