-- ~/.config/nvim/lua/danny/plugins/zen-mode.lua
return {
	"folke/zen-mode.nvim",
	config = function()
		require("zen-mode").setup({
			window = {
				backdrop = 1, -- set to 1 for full opacity
				width = 80, -- adjust to your preferred width
				height = 1,
				options = {
					signcolumn = "no",
					number = false,
					relativenumber = false,
					cursorline = false,
					cursorcolumn = false,
					foldcolumn = "0",
					list = false,
				},
			},
			plugins = {
				options = {
					enabled = true,
					ruler = false,
					showcmd = false,
				},
				twilight = { enabled = true },
				gitsigns = { enabled = false },
				tmux = { enabled = false },
				wezterm = {
					enabled = true,
					font = "+4",
				},
			},
			on_open = function(win) end,
			on_close = function() end,
		})
	end,
}
