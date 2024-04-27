-- Extencion de configuracion de LSP

local config = function ()
  -- Redefino la funcion keymap.set, y las tablas lsp y api para que quede más límpio la lectura
  local kms, lsp = vim.keymap.set, vim.lsp
  local lspconfig = require("lspconfig")

  -- Global mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  kms('n', '<space>e', vim.diagnostic.open_float)
  kms('n', '[d', vim.diagnostic.goto_prev)
  kms('n', ']d', vim.diagnostic.goto_next)
  kms('n', '<space>q', vim.diagnostic.setloclist)

  local on_attach = function(_, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = bufnr }
    kms('n', 'gD', lsp.buf.declaration, opts)
    kms('n', 'gd', lsp.buf.definition, opts)
    kms('n', 'K', lsp.buf.hover, opts)
    kms('n', 'gi', lsp.buf.implementation, opts)
    kms('n', '<C-k>', lsp.buf.signature_help, opts)
    kms('n', '<space>wa', lsp.buf.add_workspace_folder, opts)
    kms('n', '<space>wr', lsp.buf.remove_workspace_folder, opts)
    kms('n', '<space>wl', function()
      print(vim.inspect(lsp.buf.list_workspace_folders()))
    end, opts)
    kms('n', '<space>D', lsp.buf.type_definition, opts)
    kms('n', '<space>rn', lsp.buf.rename, opts)
    kms({ 'n', 'v' }, '<space>ca', lsp.buf.code_action, opts)
    kms('n', 'gr', lsp.buf.references, opts)
    kms('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end

  require("neodev").setup()

  -- LSP config -----------------------------------------------
  --
  --typescript and javascript congig
  lspconfig.tsserver.setup({
    on_attach = on_attach
  })

  -- lua config
  lspconfig.lua_ls.setup({
    on_attach = on_attach,
    settings = {
      lua = {
        telemetry = { enable = false },
        workspace = { checkThirParty = false },
      }
    }
  })
end

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim", -- Debe correr primero mason
    "folke/neodev.nvim",       -- Configura automaticamente Lua lsp
  },
  config = config
}
