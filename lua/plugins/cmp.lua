-- Autocompletado
--
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-git",
    "L3MON403/LuaSnip",
    "saadparwaiz1/cmp_luasnip", -- fuente de luasnip
    "windwp/nvim-autopairs", -- asegura de cerrar la llave
  },
  event = "VeryLazy",
  main = "config.plugins.cmp",
  config = true,
}
