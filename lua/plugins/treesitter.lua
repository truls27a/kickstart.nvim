-- Treesitter: highlighting and indentation.
--
-- Uses the `main` branch. The archived `master` branch is broken on Neovim 0.12: it registers
-- query directives with `{ force = true, all = false }`, and 0.12 dropped `all = false`, so
-- directive handlers receive a *list* of TSNodes but index it as a single node ->
-- "attempt to call method 'range' (a nil value)" on markdown/bash/html/hcl/php buffers.
--
-- On `main` there are no modules and no options: parsers are installed imperatively, and
-- highlight/indent are enabled per-buffer from a FileType autocmd.

local ensure_installed = {
  'bash',
  'c',
  'diff',
  'go',
  'html',
  'javascript',
  'lua',
  'luadoc',
  'markdown',
  'markdown_inline',
  'python',
  'query',
  'rust',
  'swift',
  'tsx',
  'typescript',
  'vim',
  'vimdoc',
}

-- Keep legacy regex syntax on top of treesitter, keyed by FILETYPE.
-- (replaces `highlight.additional_vim_regex_highlighting`)
local extra_vim_syntax = { ruby = true }

-- Skip the treesitter indent expression, keyed by FILETYPE.
-- (replaces `indent.disable`)
local no_ts_indent = { ruby = true }

return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main', -- the repo's default branch is still `master`
  lazy = false, -- `main` does not support lazy-loading
  build = ':TSUpdate',
  config = function()
    local ts = require('nvim-treesitter')

    --- @param buf integer
    --- @param ft string filetype (NOT a parser name)
    --- @return boolean started
    local function ts_enable(buf, ft)
      if not vim.api.nvim_buf_is_valid(buf) then
        return false
      end

      local lang = vim.treesitter.language.get_lang(ft)
      -- language.add() is the cheap "is there a parser on disk?" check and never throws.
      if not lang or not vim.treesitter.language.add(lang) then
        return false
      end

      local ok, err = pcall(vim.treesitter.start, buf, lang)
      if not ok then
        vim.notify_once('treesitter: ' .. tostring(err), vim.log.levels.WARN)
        return false
      end

      if extra_vim_syntax[ft] then
        vim.bo[buf].syntax = 'ON'
      end

      if not no_ts_indent[ft] then
        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end

      return true
    end

    --- Re-run activation over loaded buffers once a parser lands on disk.
    --- @param lang string? only buffers whose language is `lang`
    local function ts_enable_all(lang)
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) then
          local ft = vim.bo[buf].filetype
          if ft ~= '' and (not lang or vim.treesitter.language.get_lang(ft) == lang) then
            ts_enable(buf, ft)
          end
        end
      end
    end

    -- ---- `auto_install = true` replacement --------------------------------
    local available ---@type table<string, true>?
    local attempted = {} ---@type table<string, true>

    local function is_available(lang)
      if not available then
        -- get_available() rebuilds the manifest and fires `User TSUpdate`; cache it.
        available = {}
        for _, l in ipairs(ts.get_available()) do
          available[l] = true
        end
      end
      return available[lang] == true
    end

    local function ts_auto_install(buf, ft)
      -- Don't kick off compiles from previews, terminals or scratch buffers.
      if vim.bo[buf].buftype ~= '' then
        return
      end

      local lang = vim.treesitter.language.get_lang(ft)
      -- `attempted` is never cleared: one try per language per session, so an
      -- unavailable language or a failing build can't re-trigger on every buffer.
      if not lang or attempted[lang] or not is_available(lang) then
        return
      end
      attempted[lang] = true

      ts.install({ lang }):await(function(err)
        vim.schedule(function()
          if err then
            vim.notify(
              'treesitter: could not install ' .. lang .. ': ' .. tostring(err),
              vim.log.levels.WARN
            )
            return
          end
          ts_enable_all(lang)
        end)
      end)
    end
    -- -----------------------------------------------------------------------

    vim.api.nvim_create_autocmd('FileType', {
      desc = 'Enable treesitter highlighting and indentation',
      group = vim.api.nvim_create_augroup('treesitter-enable', { clear = true }),
      callback = function(ev)
        if not ts_enable(ev.buf, ev.match) then
          ts_auto_install(ev.buf, ev.match)
        end
      end,
    })

    -- Baseline set. install() is async and skips what's present; the get_installed()
    -- diff just avoids the call entirely on a warm start.
    local installed = {}
    for _, lang in ipairs(ts.get_installed('parsers')) do
      installed[lang] = true
    end
    local missing = vim.tbl_filter(function(lang)
      return not installed[lang]
    end, ensure_installed)

    if #missing > 0 then
      vim.notify('treesitter: installing ' .. #missing .. ' parser(s)…', vim.log.levels.INFO)
      ts.install(missing):await(function(err)
        vim.schedule(function()
          if err then
            vim.notify('treesitter: install failed: ' .. tostring(err), vim.log.levels.ERROR)
            return
          end
          vim.notify('treesitter: parsers installed', vim.log.levels.INFO)
          ts_enable_all()
        end)
      end)
    end
  end,
}
