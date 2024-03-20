return {
	"zbirenbaum/copilot.vim",
	cmd = "Copilot",
	build = ":Copilot auth",
	opt = {
		suggestion = { enable = true },
		panel = { enable = false },
		filetypes = {
			markdown = true,
			help = true,
		},
	},
}
