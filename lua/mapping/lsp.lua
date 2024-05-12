local M = {}

local keymap, lsp = vim.keymap, vim.lsp

-- Global
M.default = function()
  -- Ver`:help vim.diagnostic.*` para obtener documentación sobre cualquiera de las siguientes funciones
  keymap.set('n', '<space>D', vim.diagnostic.open_float)
  keymap.set('n', '[d', vim.diagnostic.goto_prev)
  keymap.set('n', ']d', vim.diagnostic.goto_next)
  keymap.set('n', '<space>q', vim.diagnostic.setloclist)
end

-- Adicionales

M.on_attach = function(_, bufnr)

  -- Habilita la finalización activada por <c-x><c-o>
  vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
  local function map(mode, lhs, rhs, desc)
    -- Buffer local mappings.
    keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
  end

  -- Diagnósticos
  -- map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Mostrar diagnóstico de búfer") -- mostrar diagnóstico de búfer
  -- map("n", "<leader>d", vim.diagnostic.open_float, "Mostrar diagnóstico por linea") -- mostrar diagnóstico por linea
  -- map("n", "[d", vim.diagnostic.goto_prev, "Ir a anterior diagnóstico en el búfer") -- ir a anterior diagnóstico en el búfer
  -- map("n", "]d", vim.diagnostic.goto_next, "Ir al próximo diagnóstico en el búfer") -- ir al próximo diagnóstico en el búfer

  -- Establece la combinación de teclas
  map("n", "gR", "<cmd>Telescope lsp_references<CR>", "Mostrar referencia LSP")                   -- mostrar la definicipon, referencia
  map("n", "gD", lsp.buf.declaration, "Ir a la decraración")                                      -- ir a la declaración
  map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", "Mostrar definición de LSP")               -- mostrar definición LSP
  map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", "Mostrar implenentación de LSP")       -- mostrar implementación LSP
  map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", "Mostrar definición de tipos de LSP") -- mostrar la definición de tipos de LSP
  map({ "n", "v" }, "<leader>ca", lsp.buf.code_action, "Ver acciones de código disponibles")      -- ver acciones de código disponibles, en modo visual se aplicara a la selección
  map("n", "<leader>rn", lsp.buf.rename, "Renombrado inteligente")                                -- renombrado inteligente
  map("n", "K", lsp.buf.hover, "Muestra documentación de lo que esta bajo el cursor")             -- muestra documentación de lo que esta bajo el cursor
  map('n', '<C-k>', lsp.buf.signature_help, "Muestra ayuda de lo que esta bajo el cursor")
  map('n', '<space>wa', lsp.buf.add_workspace_folder, "Agrega espacio de trabajo")                -- agrega espacio de trajo
  map('n', '<space>wr', lsp.buf.remove_workspace_folder, "Remueve espacio de trabajo")            -- remueve espacio de trabajo
  map("n", "<leader>rs", ":LspRestart<CR>", "Reinicia LSP si es necesario")                       -- reinicia LSP si es necesario
  map('n', '<space>wl', function()
    print(vim.inspect(lsp.buf.list_workspace_folders()))
  end, "Lista los espacios de trabajo") -- lista los espacios de trabajo
  map('n', '<space>f', function()
    lsp.buf.format { async = true }
  end, "Formatea el búfer") -- formatea el búfer actual
end

return M
