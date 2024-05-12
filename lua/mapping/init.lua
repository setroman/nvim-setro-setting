
local M = {}

-- configuración teclas principales
M.main = function() return require("mapping.main") end

-- fugitive keys
M.fugitive = require("mapping.fugitive")

-- treesitter-text-objects keys
M.treesitter_textobjects = require("mapping.treesitter-textobjects")

-- lsp
M.lsp = require("mapping.lsp")

-- luasnip
-- M.luasnip = require("mapping.luasnip")

return M
