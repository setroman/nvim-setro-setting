return {
	"tpope/vim-fugitive",
	cmd = {"G","Git"},
	keys = {
		{"<leader>ga", ":Git ferch --all -p<cr>", desc = "Git feth"},
		{"<leader>gl", ":Git pull<cr>", desc = "Git pull"},
	},
}
