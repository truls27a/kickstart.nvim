-- Main entry point for Neovim configuration

-- Load core configuration
require 'config.options'
require 'config.keymaps'
require 'config.autocmds'

-- Bootstrap and setup lazy.nvim plugin manager
require 'config.lazy'

-- Load LSP configuration
-- NOTE: This must be loaded after lazy.nvim setup since it depends on plugins
require 'lsp'
