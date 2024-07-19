return {
	"nvim-tree/nvim-tree.lua",
	requires = {
		"nvim-tree/nvim-web-devicons", -- optional, for file icons
	},
	config = function()
		require("nvim-tree").setup({
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			renderer = {
				highlight_opened_files = "all",
				highlight_git = true,
				icons = {
					show = {
						git = true,
						folder = true,
						file = true,
						folder_arrow = true,
					},
				},
			},
			view = {
				width = 30,
				side = "left",
				mappings = {
					list = {
						{ key = "u", action = "dir_up" },
					},
				},
			},
		})
	end,
}
