--  -----------------------------
-- |  Configuraciones básicas   |
-- -----------------------------
require("config.main")

--  -------------------------------------------------
-- |  Configuración del gestor de extensiones Lazy  |
-- -------------------------------------------------

-- Obtirne el path del directorio de datos de nvim y le concatena "/lazy/lazy.nvim"
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Si el path en 'lazypath' no exixte lo crea y lo carga con el proyeto Lazy desde github
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

-- Aguregamos la ruta 'lazypath' con prioridad en la lista de rutas que maneja neovim. 
vim.opt.rtp:prepend(lazypath)

-- Carga el gestot de paquetes Lazy 
require("lazy").setup({
	spec = {
		{import = "plugins"} -- Carga los plugins automaticamente ( nvim/lua/plugins/*.lua) 
	}
})
