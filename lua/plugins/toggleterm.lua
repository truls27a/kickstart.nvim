-- Terminal layout manager — tmux-like fixed panes inside neovim
--
-- ┌──────────┬──────────┐
-- │          │ Agent    │  70% height
-- │   Code   ├──────────┤
-- │          │ Git      │  20% height
-- │          ├──────────┤
-- │          │ Server   │  10% height
-- └──────────┴──────────┘

local api = vim.api

local top_win = nil -- agent
local mid_win = nil -- git
local bot_win = nil -- server

local agent_buf = nil
local server_buf = nil
local git_buf = nil
local float_term = nil

local RIGHT_WIDTH_RATIO = 0.4

local function win_valid(win)
  return win and api.nvim_win_is_valid(win)
end

local function buf_valid(buf)
  return buf and api.nvim_buf_is_valid(buf)
end

local function open_term_in_win(win)
  api.nvim_set_current_win(win)
  vim.cmd 'terminal'
  return api.nvim_get_current_buf()
end

local function focus_term(win, buf)
  api.nvim_win_set_buf(win, buf)
  api.nvim_set_current_win(win)
end

local function resize_right_column()
  local right_wins = {}
  if win_valid(top_win) then
    table.insert(right_wins, top_win)
  end
  if win_valid(mid_win) then
    table.insert(right_wins, mid_win)
  end
  if win_valid(bot_win) then
    table.insert(right_wins, bot_win)
  end
  if #right_wins == 0 then
    return
  end
  local width = math.floor(vim.o.columns * RIGHT_WIDTH_RATIO)
  for _, w in ipairs(right_wins) do
    api.nvim_win_set_width(w, width)
  end
  local n_right = #right_wins
  local total_h = vim.o.lines - vim.o.cmdheight - 1 - (n_right - 1)
  if n_right == 3 then
    api.nvim_win_set_height(top_win, math.floor(total_h * 0.70))
    api.nvim_win_set_height(mid_win, math.floor(total_h * 0.20))
  elseif n_right == 2 then
    local first = right_wins[1]
    api.nvim_win_set_height(first, math.floor(total_h * 0.75))
  end
end

local function on_win_closed()
  if not win_valid(top_win) then
    top_win = nil
  end
  if not win_valid(mid_win) then
    mid_win = nil
  end
  if not win_valid(bot_win) then
    bot_win = nil
  end
  resize_right_column()
end

local function toggle_float()
  if not float_term then
    local Terminal = require('toggleterm.terminal').Terminal
    float_term = Terminal:new {
      direction = 'float',
      display_name = 'float',
      count = 99,
      on_exit = function()
        float_term = nil
      end,
    }
  end
  float_term:toggle()
end

local function quick_terminal()
  vim.cmd 'terminal'
end

local function restore_layout()
  for _, w in ipairs { top_win, mid_win, bot_win } do
    if win_valid(w) then
      api.nvim_win_close(w, true)
    end
  end
  top_win, mid_win, bot_win = nil, nil, nil

  local code_win = api.nvim_get_current_win()

  vim.cmd 'botright vsplit'
  top_win = api.nvim_get_current_win()
  if buf_valid(agent_buf) then
    focus_term(top_win, agent_buf)
  else
    agent_buf = open_term_in_win(top_win)
  end

  vim.cmd 'belowright split'
  mid_win = api.nvim_get_current_win()
  if buf_valid(git_buf) then
    focus_term(mid_win, git_buf)
  else
    git_buf = open_term_in_win(mid_win)
  end

  vim.cmd 'belowright split'
  bot_win = api.nvim_get_current_win()
  if buf_valid(server_buf) then
    focus_term(bot_win, server_buf)
  else
    server_buf = open_term_in_win(bot_win)
  end

  resize_right_column()
  api.nvim_set_current_win(code_win)
  vim.cmd 'stopinsert'
end

return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      float_opts = {
        border = 'curved',
      },
    }
    api.nvim_create_autocmd('WinClosed', {
      callback = function()
        vim.schedule(on_win_closed)
      end,
    })
  end,
  keys = {
    { '<leader>tl', restore_layout, desc = '[T]erminal [L]ayout' },
    { '<leader>tf', toggle_float, desc = '[T]erminal [F]loat' },
    { '<leader>tt', quick_terminal, desc = '[T]erminal here' },
  },
}
