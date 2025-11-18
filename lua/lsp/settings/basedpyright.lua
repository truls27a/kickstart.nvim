local lspconfig = require('lspconfig')

return {
  root_dir = lspconfig.util.root_pattern('/Users/trulsborgvall/Documents/Skole/Bacheloroppgave/RealCube-server'),
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = 'basic',
        autoSearchPaths = true,
      },
    },
  },
}
