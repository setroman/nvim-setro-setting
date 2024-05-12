-- Establece el explorador de archivos con estilo de árbol.
vim.cmd("let g:netrw_liststyle = 3")

local o = vim.o -- para abreviar las opciones

o.relativenumber = true
o.number = true

-- tabs & indentación (sangría)
o.tabstop = 2 -- 2 espacios por tabs (prettier default)
o.shiftwidth = 2 -- 2 espacios para el ancho de indentación 
o.expandtab = true -- expande tab a espacios
o.autoindent = true -- copia la sangria de la línea actual al comenzar una nueva

o.wrap = false -- false: Los reglones se extienden más alla del limite de la ventana. true: Si el reglon supera el límite de la ventana, se extiente en el reglon siguiente

-- configuracion de búsqueda
o.ignorecase = true -- ignora mayúsculas al reluzar búsquedas
o.smartcase = true -- si se incluyen mayusculas y minúsculas en la búsqueda, pasa a modo sendible entre mayusculas y minusculas

o.cursorline = true -- resalta la línea del cursor

-- (el terminal debe soportar true-colors)
o.termguicolors = true -- activa colores del terminal para el tema de colores (colorschemes)
o.background = "dark" -- colorschemes  que pueden ser claros u oscuro se oscureceran
o.signcolumn = "yes" -- muestra una columna de símbolos

-- backspace
o.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
-- o.clipboard:append("unnamedplus") -- registro de clipboard por defecto

-- split windows
o.splitright = true -- divide la ventana vertical hacia la derecha
o.splitbelow = true -- divide la ventana horizontal hacia abaho

-- turn off swapfile
o.swapfile = false -- deshabilita el archivo de intercambio

-- Configuración principal de teclado
require("mapping.main")
