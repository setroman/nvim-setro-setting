-- Extension signs para colorear cambios en los archivos
--
return {
	"lewis6991/gitsigns.nvim",
	opts = {
    signcolumn = false,
		numhl = true,	-- colorea el número de la linea.
		max_file_length = 10000, -- limita el tamaño mazimo de un atchivo para habrirlo.
	}
	-- config = true,
	-- congig = funcion()
	-- 	require("gitsings").setup()
	-- end
}
