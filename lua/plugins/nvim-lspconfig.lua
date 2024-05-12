
-- config lsp
local config = function()

  -- Juego de teclas
  local mapping = require("mapping.lsp")

  -- defino lspconfig para usarlo
  local lspconfig = require("lspconfig")

  -- Mapeo Global.
  -- -- Ver`:help vim.diagnostic.*` para obtener documentación sobre cualquiera de las siguientes funciones
  mapping.default()

  -- Caga de neodev
  require("neodev").setup()

  -- LSP - Linting configuración  -----------------------------------------------
  --
  -- tsserver - typescript y javascript
  lspconfig.tsserver.setup({
    on_attach = mapping.on_attach
  })

  -- eslint - javascript y typescript
  lspconfig.eslint.setup({
    on_attach = mapping.on_attach
  })
  -- marksman - markdown
  lspconfig.marksman.setup({
    on_attach = mapping.on_attach
  })

  -- lua_ls - lua
  lspconfig.lua_ls.setup({
    on_attach = mapping.on_attach,
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
