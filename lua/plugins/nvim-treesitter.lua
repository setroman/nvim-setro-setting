
--  -----------------------------------------------------------------------------
-- | nvim-treesitter: Generador de parcer para el manejo del arbol sintactico   |
-- -----------------------------------------------------------------------------
---@diagnostic disable: missing-fields

-- Juego de teclas
local mapping = require("mapping.treesitter-textobjects")

-- Configuracion de treesitter
local config = function()
  require("nvim-treesitter.configs").setup({
    highlight = {
      enable = true, -- habilita el resaltado de sintaxis
    },
    indent = {
      enable = true, -- habilita la sangria
    },
    autotag = {
      enable = true, -- habilita etiquetado autompatico
    },
    ensure_installed = {
      "lua",
      "luadoc",
      "vim",
      "vimdoc", -- Lo agregue porque parece arregle los errores de treesitter en el help
      "json",
      "javascript",
      "typescript",
      "tsx",
      "html",
      "css",
      "markdown",
      "markdown_inline",
      "c",
      "rust",
      "sql",
      "angular",
      "svelte",
      "astro",
      "gitignore",
    },
    textobjects = {
      select = {
        enable = true,

        -- Salta automaticamente hacia el texto-objeto, similar a targers.vim
        lookahead = true,
        keymaps = mapping.keymaps
      },
      swap = {
        enable = true,
        seap_next = mapping.swap.next,
        seap_previous = mapping.swap.previous,
      },
      move = {
        enable = true,
        set_jumps = true, -- si debe establecerse saltos
        goto_next_start = mapping.move.next_start,
        goto_next_end = mapping.move.next_end,
        goto_previous_start = mapping.move.previous_start,
        goto_previous_end = mapping.move.previous_end,
      },
    },
  })
  mapping.action_repeat()
end

return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects", -- para manejo y navegacion de objetos
    "windwp/nvim-ts-autotag",                      -- extencion para el manejo automático de etiquetas
    -- "nvim-treesitter/playground",                  -- visor de arbol sintactico ""... Ya viene incluido en nvim 0.10
  },
  build = ":TSUpdate",
  enent = "VeryLazy",
  config = config,
}
