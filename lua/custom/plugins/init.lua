return {
	{ "slint-ui/vim-slint" },
	{ "mfussenegger/nvim-dap" },
	{
		"akinsho/flutter-tools.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- optional for vim.ui.select
		},
		config = true,
	},
	{ "Civitasv/cmake-tools.nvim" },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "olimorris/onedarkpro.nvim" },
	{ "rose-pine/neovim", name = "rose-pine" },
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				background_colour = "#1e1e1e", -- Set your desired background color here
			})
			vim.notify = require("notify")
		end,
	},
}
