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
			},
			on_attach = function(bufnr)
				local api = require("nvim-tree.api")
				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end
				vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts("Up"))
			end,
		})
	end,
}
