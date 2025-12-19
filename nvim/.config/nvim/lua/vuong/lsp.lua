vim.lsp.config('*', {
  root_markers = { '.git' },
})

vim.diagnostic.config({
  virtual_text  = true,
  severity_sort = true,
  float         = {
    style  = 'minimal',
    border = 'rounded',
    source = 'if_many',
    header = '',
    prefix = '',
  },
  signs         = {
    text = {
      [vim.diagnostic.severity.ERROR] = '✘',
      [vim.diagnostic.severity.WARN]  = '▲',
      [vim.diagnostic.severity.HINT]  = '⚑',
      [vim.diagnostic.severity.INFO]  = '»',
    },
  },
})

local orig = vim.lsp.util.open_floating_preview
---@diagnostic disable-next-line: duplicate-set-field
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts            = opts or {}
  opts.border     = opts.border or 'rounded'
  opts.max_width  = opts.max_width or 80
  opts.max_height = opts.max_height or 24
  opts.wrap       = opts.wrap ~= false
  return orig(contents, syntax, opts, ...)
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    local buf    = args.buf
    local map    = function(mode, lhs, rhs) vim.keymap.set(mode, lhs, rhs, { buffer = buf }) end

    map('n', 'K', vim.lsp.buf.hover)
    map('n', 'gd', vim.lsp.buf.definition)
    map('n', 'gD', vim.lsp.buf.declaration)
    map('n', 'gi', vim.lsp.buf.implementation)
    map('n', 'go', vim.lsp.buf.type_definition)
    map('n', 'gr', vim.lsp.buf.references)
    map('n', 'gs', vim.lsp.buf.signature_help)
    map('n', 'gl', vim.diagnostic.open_float)
    map({ 'n', 'x' }, '<F3>', function() vim.lsp.buf.format({ async = true }) end)
    map('n', 'ga', vim.lsp.buf.code_action)
    map("n", "<leader>lf", function() vim.lsp.buf.format({ async = true }) end)
    map("n", "<leader>rn", vim.lsp.buf.rename) -- smart rename

    local excluded_filetypes = { php = true, c = true, cpp = true }
    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting')
        and not excluded_filetypes[vim.bo[buf].filetype]
    then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp.format', { clear = false }),
        buffer = buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end,
})

-- local keymap = vim.keymap -- for conciseness
-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = vim.api.nvim_create_augroup("UserLspConfig", {}),
--   callback = function(ev)
--     group = vim.api.nvim_create_augroup('my.lsp', {}),
--     -- Buffer local mappings.
--     -- See `:help vim.lsp.*` for documentation on any of the below functions
--     local opts = { buffer = ev.buf, silent = true }
--
--     -- set keybinds
--     opts.desc = "Format code"
--     keymap.set("n", "<leader>lf", vim.lsp.buf.format, opts)
--
--     opts.desc = "Show LSP references"
--     keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
--
--     opts.desc = "Go to declaration"
--     keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
--
--     opts.desc = "Show LSP definition"
--     keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- show lsp definition
--
--     opts.desc = "Show LSP implementations"
--     keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
--
--     opts.desc = "Show LSP type definitions"
--     keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
--
--     opts.desc = "See available code actions"
--     keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
--
--     opts.desc = "Smart rename"
--     keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
--
--     opts.desc = "Show buffer diagnostics"
--     keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
--
--     opts.desc = "Show line diagnostics"
--     keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
--
--     opts.desc = "Go to previous diagnostic"
--     keymap.set("n", "[d", function()
--       vim.diagnostic.jump({ count = -1, float = true })
--     end, opts) -- jump to previous diagnostic in buffer
--     --
--     opts.desc = "Go to next diagnostic"
--     keymap.set("n", "]d", function()
--       vim.diagnostic.jump({ count = 1, float = true })
--     end, opts) -- jump to next diagnostic in buffer
--
--     opts.desc = "Show documentation for what is under cursor"
--     keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
--
--     opts.desc = "Restart LSP"
--     keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
--   end,
-- })
