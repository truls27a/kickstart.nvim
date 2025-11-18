-- LSP framework setup with on_attach and capabilities

local M = {}

-- Configure diagnostic display
vim.diagnostic.config({
  virtual_text = {
    prefix = function(diagnostic)
      local icons = {
        [vim.diagnostic.severity.ERROR] = '',
        [vim.diagnostic.severity.WARN] = '',
        [vim.diagnostic.severity.INFO] = '',
        [vim.diagnostic.severity.HINT] = '',
      }
      return icons[diagnostic.severity] or '●'
    end,
    spacing = 4,
    source = 'if_many',
  },
  signs = true,
  underline = {
    severity = { min = vim.diagnostic.severity.ERROR },
  },
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'if_many',
  },
})

-- Enhanced capabilities with blink.cmp
M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require('blink.cmp').get_lsp_capabilities(M.capabilities)

-- On attach function (called when LSP attaches to buffer)
M.on_attach = function(client, bufnr)
  local function map(keys, func, desc, mode)
    mode = mode or 'n'
    vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
  end

  -- Keymaps
  map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
  map('gra', vim.lsp.buf.code_action, 'Code [A]ction', { 'n', 'x' })
  map('grr', require('telescope.builtin').lsp_references, '[R]eferences')
  map('gri', require('telescope.builtin').lsp_implementations, '[I]mplementations')
  map('grd', require('telescope.builtin').lsp_definitions, '[D]efinition')
  map('grD', vim.lsp.buf.declaration, '[D]eclaration')
  map('grt', require('telescope.builtin').lsp_type_definitions, '[T]ype definition')
  map('gO', require('telescope.builtin').lsp_document_symbols, 'D[O]cument symbols')
  map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace symbols')

  -- Toggle inlay hints (if supported)
  if client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
    map('<leader>th', function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }))
    end, '[T]oggle Inlay [H]ints')
  end

  -- Document highlighting
  if client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
    local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      buffer = bufnr,
      group = highlight_augroup,
      callback = vim.lsp.buf.document_highlight,
    })

    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
      buffer = bufnr,
      group = highlight_augroup,
      callback = vim.lsp.buf.clear_references,
    })

    vim.api.nvim_create_autocmd('LspDetach', {
      group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
      callback = function(event)
        vim.lsp.buf.clear_references()
        vim.api.nvim_clear_autocmds({ group = 'lsp-highlight', buffer = event.buf })
      end,
    })
  end
end

return M
