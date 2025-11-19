local lspconfig = require 'lspconfig'

return {
  root_dir = function(fname)
    -- First try git root, then Python project markers, finally cwd
    return vim.fs.dirname(vim.fs.find('.git', { path = fname, upward = true })[1])
      or lspconfig.util.root_pattern('pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile', 'pyrightconfig.json')(fname)
      or vim.fn.getcwd()
  end,
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = 'basic',
        autoSearchPaths = true,
      },
    },
  },
}
