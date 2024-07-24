-- ~/.config/nvim/lua/danny/plugins/zen-mode.lua
return {
	"folke/zen-mode.nvim",
	config = function()
		require("zen-mode").setup({
			-- your configuration comes here
			-- or leave it empty to use the default settings
			window = {
				backdrop = 0.95,
				width = 120, -- width of the zen window
				height = 1, -- height of the zen window
				options = {
					signcolumn = "no", -- disable signcolumn
					number = false, -- disable number column
					relativenumber = false, -- disable relative numbers
					cursorline = false, -- disable cursorline
					cursorcolumn = false, -- disable cursor column
					foldcolumn = "0", -- disable fold column
					list = false, -- disable whitespace characters
				},
			},
			plugins = {
				options = {
					enabled = true,
					ruler = false, -- disables the ruler text in the cmd line area
					showcmd = false, -- disables the command in the last line of the screen
				},
				twilight = { enabled = true }, -- enable twilight (if installed)
				gitsigns = { enabled = false }, -- disables git signs
				tmux = { enabled = false }, -- disables the tmux statusline
				wezterm = {
					enabled = true, -- enable wezterm integration
					font = "+4", -- font size increment
				},
			},
			-- callback where you can add custom code when the zen window opens
			on_open = function(win) end,
			-- callback where you can add custom code when the zen window closes
			on_close = function() end,
		})
	end,
}
