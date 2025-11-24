-- Global variables
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Mouse support
vim.opt.mouse = 'a'

-- Don't show mode in command line (shown in statusline)
vim.opt.showmode = false

-- Sync clipboard with OS (scheduled after UiEnter for performance)
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Persistent undo history
vim.opt.undofile = true

-- Case-insensitive searching (unless \C or capital letters in search)
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Always show sign column
vim.opt.signcolumn = 'yes'

-- Update time for CursorHold events and swap file writes
vim.opt.updatetime = 250

-- Timeout for mapped sequences
vim.opt.timeoutlen = 300

-- Split windows behavior
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Whitespace display
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Live preview of substitutions
vim.opt.inccommand = 'split'

-- Highlight current line
vim.opt.cursorline = true

-- Minimum lines to keep above/below cursor
vim.opt.scrolloff = 10

-- Show confirmation dialog instead of failing
vim.opt.confirm = true

-- Auto-reload files changed outside Neovim
vim.opt.autoread = true

-- Tab settings (use spaces, 2-space indentation)
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- Cursor shape configuration
vim.opt.guicursor = 'n-v-c:block,i-ci-ve:ver25,t:ver25,r-cr:hor20,o:hor50'
