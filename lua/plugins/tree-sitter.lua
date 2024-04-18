-- Extención generadora de parcer para el manejo del arbol de sintaxis.
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	enent = "VeryLazy",
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = {
			"lua",
			"luadoc",
		},
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
		},
		textobjects = {
			select = {
				enable = true,
				loogahead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["af"] = "@conditional.outer",
					["if"] = "@conditional.inner",
					["af"] = "@loop.outer",
					["if"] = "@loop.inner",
				},
			},
		},
	},
}
