-- Theme system: cycle and toggle custom tokyonight variants
-- <leader>tH = toggle hacker theme, <leader>tT = cycle all themes

local M = {}

local default_opts = {
  style = 'night',
  styles = {
    comments = { italic = false },
  },
}

M.themes = {
  hacker = {
    desc = 'Neon green Matrix theme',
    opts = {
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
    },
  },
}

-- Ordered list for cycling (default is implicit as "no theme")
local theme_order = { 'hacker' }

function M.apply(name)
  local tokyonight = require 'tokyonight'
  if name == nil or name == 'default' then
    tokyonight.setup(default_opts)
    vim.g.active_theme = 'default'
  else
    local theme = M.themes[name]
    if not theme then
      vim.notify('Unknown theme: ' .. name, vim.log.levels.WARN)
      return
    end
    tokyonight.setup(theme.opts)
    vim.g.active_theme = name
  end
  vim.cmd.colorscheme 'tokyonight-night'
end

function M.toggle(name)
  if vim.g.active_theme == name then
    M.apply 'default'
  else
    M.apply(name)
  end
end

function M.cycle()
  local current = vim.g.active_theme or 'default'
  -- Find current index in theme_order
  local idx = nil
  for i, n in ipairs(theme_order) do
    if n == current then
      idx = i
      break
    end
  end
  if idx and idx < #theme_order then
    M.apply(theme_order[idx + 1])
  elseif idx == #theme_order then
    M.apply 'default'
  else
    -- current is default, go to first theme
    M.apply(theme_order[1])
  end
  vim.notify('Theme: ' .. vim.g.active_theme)
end

vim.keymap.set('n', '<leader>tH', function()
  M.toggle 'hacker'
end, { desc = '[T]oggle [H]acker theme' })
vim.keymap.set('n', '<leader>tT', M.cycle, { desc = '[T]oggle [T]heme (cycle)' })

return M
