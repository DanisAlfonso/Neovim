-- See the danny.nvim README for more information

return {
	"akinsho/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	config = true,
	"Civitasv/cmake-tools.nvim",
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	"xiyaowong/transparent.nvim",
	"olimorris/onedarkpro.nvim",
	priority = 1000,
}
