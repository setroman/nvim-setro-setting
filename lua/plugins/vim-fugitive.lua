-- Juego de teclas
mapping = require("mapping.fugitive")
-- Extension fugitive para esar el cliente git 
return {
	"tpope/vim-fugitive",
	cmd = {"G","Git"},
	keys = mapping.keys
}
