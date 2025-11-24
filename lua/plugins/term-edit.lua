return {
  'chomosuke/term-edit.nvim',
  event = 'TermOpen',
  version = '1.*',
  opts = {
    -- Lua pattern matching the end of your zsh prompt
    prompt_end = '%$ ',
  },
}
