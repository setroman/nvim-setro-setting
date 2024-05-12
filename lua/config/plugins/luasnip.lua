-- Configuración de luasnip
-- Juego de teclas
local mapping = require("mapping.luasnip")

local ls, types = require("luasnip"), require("luasnip.util.types")

local M = {}

function M.setup()
  ls.config.set_config {
    -- This tells LuaSnip to remember to keep around the last snippet.
    -- You can jump back into even if you move outside of the selection
    history = true,

    -- This one is cool cause if you have dynamic snippets, it updatesas you type!
    updateevents = "TextChanged,TextChangedI",

    -- Autosnippets:
    enable_autosnippets = true,

    ext_opts = {
      [types.choiceNode] = {
        active = {
          virt_text = { { "<- Choice", "Error" } },
        },
      },
    },
  }
  mapping.default()
end

return M
