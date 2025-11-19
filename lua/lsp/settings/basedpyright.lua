local lspconfig = require('lspconfig')

-- Helper function to find project-local basedpyright
local function get_basedpyright_cmd(root_dir)
  if root_dir then
    local local_bin = root_dir .. '/node_modules/.bin/basedpyright-langserver'
    if vim.fn.executable(local_bin) == 1 then
      return { local_bin, '--stdio' }
    end
  end
  return { 'basedpyright-langserver', '--stdio' }
end

return {
  on_new_config = function(new_config, new_root_dir)
    new_config.cmd = get_basedpyright_cmd(new_root_dir)
  end,
  root_dir = function(fname)
    -- First try git root, then Python project markers, finally cwd
    return vim.fs.dirname(vim.fs.find('.git', { path = fname, upward = true })[1])
      or lspconfig.util.root_pattern(
        'pyproject.toml',
        'setup.py',
        'setup.cfg',
        'requirements.txt',
        'Pipfile',
        'pyrightconfig.json'
      )(fname)
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
