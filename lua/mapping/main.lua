
-- Combinaciones principales de teclaas

vim.g.mapleader = " " -- usa el espacio como tecla principar <leader>

local function map(mode, lhs, rhs, desc) -- método para abreviar 
  vim.keymap.set(mode, lhs, rhs,{ desc = desc })
end

-- Escape y movimientos en modo insert
map("i", "jk", "<ESC>", "Sale del modo insertar")
map("i", "<C-j>", "<Down>", "Se mueve una fila hacia abajo")
map("i", "<C-k>", "<Up>", "Se mueve una fila hacia arriba")
map("i", "<C-h>", "<Left>", "Se mueve un caracter hacia la izquierda")
map("i", "<C-l>", "<Right>", "Se mueve un caracter hacia la derecha")


map("n", "<leader>nh", ":nohl<CR>", "Resalte de busqueda borrado")

-- increment/decrement numbers
map("n", "<leader>+", "<C-a>", "Incrementa número") -- incremento
map("n", "<leader>-", "<C-x>", "Decrementa número") -- decremento

-- administeación de ventana
map("n", "<leader>sv", "<C-w>v", "Divide la ventana verticalmente") -- divide la ventana vertilalmente
map("n", "<leader>sh", "<C-w>s", "Divide la ventana horizontalmente") -- divide la ventana horizontalmente
map("n", "<leader>se", "<C-w>=", "Diviciones del mismo tamaño") -- hacer las diviciones del mismo ancho y alto
map("n", "<leader>sx", "<cmd>close<CR>", "Cierra la divición actual") -- cierra la división actual de la ventana

-- administeación de pestañas
map("n", "<leader>to", "<cmd>tabnew<CR>", "Nueva pestaña") -- nueva pestaña
map("n", "<leader>tx", "<cmd>tabclose<CR>", "Cierra la pestaña actual") -- cierra la pestaña actual
map("n", "<leader>tn", "<cmd>tabn<CR>", "Ir a la pestaña siguiente") --  ir a la proxima pestaña
map("n", "<leader>tp", "<cmd>tabp<CR>", "Ir a la pestaña previa") --  ir a la pestaña previa
map("n", "<leader>tf", "<cmd>tabnew %<CR>", "Abre el buffer actual a una nueva pestaña") --  mueve el buffer actual a una nueva pestaña
