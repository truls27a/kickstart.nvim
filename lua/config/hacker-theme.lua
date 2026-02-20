-- Hacker Theme: Neon green "Matrix" variant via tokyonight palette override
-- Toggle with <leader>tH

local M = {}

local default_opts = {
  style = 'night',
  styles = {
    comments = { italic = false },
  },
}

local hacker_opts = {
  style = 'night',
  styles = {
    comments = { italic = false },
  },
  on_colors = function(c)
    -- Background: near-black for that terminal/Matrix feel
    c.bg = '#0a0a0a'
    c.bg_dark = '#050505'
    c.bg_highlight = '#003300'
    c.bg_popup = '#0d1a00'
    c.bg_sidebar = '#050505'
    c.bg_statusline = '#0d1a00'
    c.bg_float = '#0d1a00'
    c.bg_visual = '#1a3300'
    c.bg_search = '#39FF14'

    -- Foreground: neon greens
    c.fg = '#39FF14'
    c.fg_dark = '#00CC00'
    c.fg_gutter = '#2a5a00'
    c.fg_sidebar = '#00CC00'
    c.fg_float = '#39FF14'

    -- Borders
    c.border = '#2a5a00'
    c.border_highlight = '#39FF14'

    -- UI shades
    c.comment = '#2a7a00'
    c.dark3 = '#1a4a00'
    c.dark5 = '#2a6a00'
    c.terminal_black = '#1a1a1a'

    -- Named colors → green spectrum + amber accent
    c.blue = '#00FF88'
    c.blue0 = '#00CC66'
    c.blue1 = '#00FF88'
    c.blue2 = '#00FFAA'
    c.blue5 = '#AFFFAF'
    c.blue6 = '#00FF66'
    c.blue7 = '#003300'
    c.cyan = '#00FF66'
    c.green = '#39FF14'
    c.green1 = '#00CC00'
    c.green2 = '#00AA00'
    c.magenta = '#00FF88'
    c.magenta2 = '#7FFF00'
    c.orange = '#FF8C00'
    c.purple = '#AFFFAF'
    c.red = '#FF3333'
    c.red1 = '#FF4444'
    c.teal = '#00FF66'
    c.yellow = '#7FFF00'

    -- Semantic
    c.error = '#FF3333'
    c.warning = '#FF8C00'
    c.info = '#00FF88'
    c.hint = '#2a7a00'
    c.todo = '#FF8C00'

    -- Git & diff
    c.git = { add = '#39FF14', change = '#FF8C00', delete = '#FF3333' }
    c.diff = { add = '#0a2600', delete = '#260a00', change = '#1a1200', text = '#2a5a00' }
  end,
}

function M.toggle()
  local tokyonight = require 'tokyonight'
  if vim.g.hacker_theme_active then
    tokyonight.setup(default_opts)
    vim.cmd.colorscheme 'tokyonight-night'
    vim.g.hacker_theme_active = false
  else
    tokyonight.setup(hacker_opts)
    vim.cmd.colorscheme 'tokyonight-night'
    vim.g.hacker_theme_active = true
  end
end

vim.keymap.set('n', '<leader>tH', M.toggle, { desc = '[T]oggle [H]acker theme' })

return M
