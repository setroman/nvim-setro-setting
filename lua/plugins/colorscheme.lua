-- Tema Kanagawa
return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priorty = 1000,
	config = function()
		vim.cmd([[colorscheme kanagawa]])
	end,
}
